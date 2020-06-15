import 'dart:convert';

Map<String, String> decodeErrorsFromResponse(dynamic response) {
  /// 1. The JSON string is decoded into <String,dynamic>
  /// 2. The dynamic is converted into List<String>
  /// 3. List<String> is join together by ","
  /// 4. Finally returning a Map<String,String> of error messages
  return (json.decode(response.body) as Map<String, dynamic>).map(
      (key, value) => MapEntry<String, String>(
          key, new List<String>.from(value as List<dynamic>).join(", ")));
}
