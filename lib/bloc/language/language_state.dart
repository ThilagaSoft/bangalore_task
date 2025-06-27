
import 'package:flutter/material.dart';

abstract class LanguageState {}

class LanguageInitial extends LanguageState {}

class LanguageChanged extends LanguageState {
  final Locale locale;

  LanguageChanged({required this.locale});
}
class LanguageCurrentState extends LanguageState {
  final Locale locale;
  LanguageCurrentState(this.locale);
}
