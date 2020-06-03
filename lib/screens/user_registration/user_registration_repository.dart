import 'dart:convert';

import 'package:teesco/core/res/errors.dart';
import 'package:teesco/core/res/strings.dart';
import 'package:teesco/core/util/log_wrapper.dart';
import 'package:teesco/injection_container.dart';
import 'package:teesco/models/login.dart';
import 'package:http/http.dart' as http;
import 'package:teesco/models/user_registration_model.dart';

abstract class UserRegistrationRepository {
  /// Takes in a `UserRegistrationModel` object and returns a bool to indicate the success
  Future<bool> registerUser(UserRegistrationModel userRegistrationModel);
}

class APIUserRegistrationRepository implements UserRegistrationRepository {
  @override
  Future<bool> registerUser(UserRegistrationModel userRegistrationModel) async {
    http.Response response;
    dynamic payload = {
        "name": userRegistrationModel.name,
        "email": userRegistrationModel.email,
        "institution": userRegistrationModel.institution,
        "countryCode": userRegistrationModel.countryCode,
        "phone": userRegistrationModel.phone,
        "password": userRegistrationModel.password,
        "confirmPassword": userRegistrationModel.confirmPassword,
      };


    try {
      response = await sl.get<http.Client>().post(S.userRegistrationUrl, body: payload);
      print(payload);
      print(response.body);
    } catch (e) {
      print(e);
      throw NetworkError();
    }

    // Handled 400 already in validation.

    // throw InvalidInputError(errorDetails);
    // if (response.statusCode == 401) {
    //   throw InvalidCredentialsError();
    // } else if (response.statusCode == 404) {
    //   throw UserNotFoundError();
    // } else if (response.statusCode != 202) {
    //   Log.e(tag: "Loggin In", message: "Unknown API response code -> ${response.statusCode}");
    //   throw UnknownError();
    // }

    // String token;
    // try {
    //   token = (json.decode(response.body) as Map<String, dynamic>)[S.tokenKey];
    // } catch (e) {
    //   Log.e(tag: "Loggin In", message: "Parsing response to json to get token. Error: $e");
    //   throw UnknownError();
    // }

    return true;
  }
}
