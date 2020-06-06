import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teesco/core/res/errors.dart';
import 'package:teesco/core/res/strings.dart';
import 'package:teesco/injection_container.dart';

abstract class UserRegistrationRepository {
  /// Takes in a `UserRegistrationModel` object and returns a bool to indicate the success
  Future<bool> registerUser(dynamic payload);
}

Map<String, String> decodeErrorsFromResponse(dynamic response) {
  return (json.decode(response.body) as Map<String, dynamic>).map(
      (key, value) => MapEntry<String, String>(
          key, new List<String>.from(value as List<dynamic>).join(", ")));
}

class APIUserRegistrationRepository implements UserRegistrationRepository {
  @override
  Future<bool> registerUser(dynamic payload) async {
    http.Response response;

    try {
      response = await sl
          .get<http.Client>()
          .post(S.userRegistrationUrl, body: payload);
    } catch (e) {
      print(e);
      throw NetworkError();
    }

    print(response.body);
    if (response.statusCode == 400) {
      throw InvalidFormInputError(decodeErrorsFromResponse(response));
    }

    return true;
  }
}
