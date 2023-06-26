import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:driver_app/assistants/request_assistant.dart';
import 'package:driver_app/config_map.dart';
import 'package:driver_app/datahandler/app_data.dart';
import 'package:driver_app/models/address.dart';
import 'package:driver_app/models/place_prediction.dart';
import 'package:driver_app/widgets/divider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String idScreen = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController pickUpTextEdittingController = TextEditingController();
  TextEditingController dropOffTextEdittingController = TextEditingController();

  List<PlacePrediction> placePredictionList = [];

  @override
  void initState() {
    super.initState();
    pickUpTextEdittingController.text =
        context.read(pickupLocationProvider.notifier).state.placeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 215,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 6,
                  spreadRadius: 0.5,
                  offset: Offset(0.7, 0.7),
                )
              ],
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(left: 25, top: 30, right: 25, bottom: 20),
              child: Column(
                children: [
                  SizedBox(height: 5),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      Center(
                        child: Text(
                          "Set Drop Off",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/pickicon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: TextField(
                            controller: pickUpTextEdittingController,
                            decoration: InputDecoration(
                              hintText: 'Pickup Location',
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.only(left: 11, top: 8, bottom: 8),
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/desticon.png',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(height: 10),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: TextField(
                            onSubmitted: (text) {
                              print("Submit findPlace: $text");
                              findPlace(text);
                            },
                            controller: dropOffTextEdittingController,
                            decoration: InputDecoration(
                              hintText: 'Where to?',
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.only(left: 11, top: 8, bottom: 8),
                            ),
                          ),
                        ),
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
          //tile for predictions
          SizedBox(
            height: 10,
          ),
          (placePredictionList.length > 0)
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return PredictionTile(placePredictionList[index]);
                    },
                    separatorBuilder: (context, index) => DividerWidget(),
                    itemCount: placePredictionList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=${getMapKey()}&sessiontoken=12348098534&components=country:vn|country:us";
      var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if (res == "Failed") {
        return;
      }

      if (res['status'] == 'OK') {
        var predictions = res['predictions'];

        var placeList = (predictions as List)
            .map((e) => PlacePrediction.fromJson(e))
            .toList();

        setState(() {
          placePredictionList = placeList;
        });
      }
    }
  }
}

class PredictionTile extends StatelessWidget {
  PredictionTile(this.placePrediction, {Key? key}) : super(key: key);

  final PlacePrediction placePrediction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        getPlaceAddressDetails(placePrediction.place_id, context);
      },
      child: Container(
        child: Column(
          children: [
            SizedBox(width: 10),
            Row(
              children: [
                Icon(Icons.add_location),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        placePrediction.main_text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        placePrediction.secondary_text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  void getPlaceAddressDetails(String placeId, BuildContext context) async {
    String placeDetailsUrl =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${getMapKey()}";

    var res = await RequestAssistant.getRequest(placeDetailsUrl);

    if (res == "Failed") {
      return;
    }

    if (res['status'] == "OK") {
      Address address = Address();
      address.placeName = res['result']['name'];
      address.placeId = placeId;
      address.latitude = res['result']['geometry']['location']['lat'];
      address.longitude = res['result']['geometry']['location']['lng'];

      context.read(dropoffLocationProvider.notifier).state = address;
      print("Drop off location: ${address.placeName}");

      Navigator.pop(context, "obtainDirection");
    }
  }
}
