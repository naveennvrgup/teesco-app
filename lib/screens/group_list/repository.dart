import 'dart:convert';

import 'package:teesco/core/res/errors.dart';
import 'package:teesco/core/res/strings.dart';
import 'package:teesco/core/util/log_wrapper.dart';
import 'package:teesco/injection_container.dart';
import 'package:http/http.dart' as http;
import 'package:teesco/models/orgGroup.dart';

abstract class GroupListRepository {
  Future<List<OrgGroup>> fetchGroups();
}

class APIGroupListRepository implements GroupListRepository {
  @override
  Future<List<OrgGroup>> fetchGroups() async {
    // http.Response response;
    // try {
    //   response = await sl.get<http.Client>().get(S.fetchGroupsUrl(1));
    // } catch (e) {
    //   throw NetworkError();
    // }

    // if (response.statusCode == 401) {
    //   throw InvalidCredentialsError();
    // } else if (response.statusCode == 404) {
    //   throw UserNotFoundError();
    // } else if (response.statusCode != 200) {
    // }

    // String token;
    // try {
    //   token = (json.decode(response.body) as Map<String, dynamic>)[S.tokenKey];
    // } catch (e) {
    //   Log.e(
    //       tag: "Loggin In",
    //       message: "Parsing response to json to get token. Error: $e");
    //   throw UnknownError();
    // }

    dynamic dummy = [
      {"id": 1, "name": "group1", "memberCount": 1},
      {"id": 2, "name": "group2", "memberCount": 3},
      {"id": 3, "name": "group3", "memberCount": 1}
    ];

    return (json.decode(dummy) as List<dynamic>).map((e) => OrgGroup.);
  }
}
