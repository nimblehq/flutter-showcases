class PlacePrediction {
  String secondary_text;
  String main_text;
  String place_id;

  PlacePrediction(this.secondary_text, this.main_text, this.place_id);

  factory PlacePrediction.fromJson(Map<String, dynamic> json) {
    return PlacePrediction(
      json['structured_formatting']['secondary_text'],
      json['structured_formatting']['main_text'],
      json['place_id'],
    );
  }
}
