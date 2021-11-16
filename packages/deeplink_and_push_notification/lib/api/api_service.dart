import 'package:deeplink_and_push_notification/model/response/user_response.dart';

abstract class ApiService {
  Future<UserResponse> getProfile();
}
