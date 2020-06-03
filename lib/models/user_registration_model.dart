import 'package:equatable/equatable.dart';

class UserRegistrationModel extends Equatable {
  final String name;
  final String email;
  final String institution;
  final String countryCode;
  final String phone;
  final String password;
  final String confirmPassword;

  UserRegistrationModel(
      {this.name,
      this.confirmPassword,
      this.email,
      this.password,
      this.institution,
      this.countryCode: "+91",
      this.phone});

  @override
  List<Object> get props =>
      [name, email, password, institution, countryCode, phone];
}
