import 'package:equatable/equatable.dart';

class Permission extends Equatable {
  final int permInt;
  final String name;
  final bool granted;

  Permission({this.permInt, this.name, this.granted});

  @override
  List<Object> get props => [permInt, name, granted];

  factory Permission.fromJson(MapEntry<String, dynamic> entry) {
    String name = entry.key.toString();
    
    Map<String, String> entryValue = entry.value as Map<String, String>;
    int permInt = int.parse(entryValue['perm_int']);
    bool granted = entryValue['perm_int'] == 'true' ? true : false;

    return Permission(name: name, permInt: permInt, granted: granted);
  }
}
