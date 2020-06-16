import 'package:equatable/equatable.dart';
import 'package:teesco/models/permission.dart';

class OrgGroup extends Equatable {
  final int id;
  final int memberCount;
  final String name;
  final String role;
  final List<Permission> permissions;

  OrgGroup({this.id, this.memberCount, this.name, this.role, this.permissions});

  @override
  List<Object> get props => [id, memberCount, name, role, permissions];

  factory OrgGroup.fromJson(Map<String, dynamic> parsedJson) {
    return new OrgGroup(
        id: parsedJson['id'],
        memberCount: parsedJson['memberCount'],
        name: parsedJson['name'],
        role: parsedJson['role'],
        permissions: (parsedJson['permissions'] as Map<String, dynamic>)
            .entries
            .map((entry) => Permission.fromJson(entry)));
  }
}
