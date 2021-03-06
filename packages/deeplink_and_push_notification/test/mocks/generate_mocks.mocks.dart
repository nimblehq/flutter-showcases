// Mocks generated by Mockito 5.0.15 from annotations
// in deeplink_and_push_notification/test/mocks/generate_mocks.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:deeplink_and_push_notification/api/api_service.dart' as _i3;
import 'package:deeplink_and_push_notification/model/response/user_response.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeUserResponse_0 extends _i1.Fake implements _i2.UserResponse {}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i3.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.UserResponse> getProfile() => (super.noSuchMethod(
          Invocation.method(#getProfile, []),
          returnValue: Future<_i2.UserResponse>.value(_FakeUserResponse_0()))
      as _i4.Future<_i2.UserResponse>);
  @override
  String toString() => super.toString();
}
