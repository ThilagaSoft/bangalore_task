import 'package:flutter/cupertino.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent
{
  final String userName;
  final String email;
  final String phone;
  final String password;
  final String countryCode;

  RegisterEvent({
    required this.userName,
    required this.email,
    required this.phone,
    required this.password,
    required this.countryCode,
  });
}
class LoginEvent extends AuthEvent
{
  final String email;
  final String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

