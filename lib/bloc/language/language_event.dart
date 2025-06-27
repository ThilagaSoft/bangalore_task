
import 'package:flutter/material.dart';

abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final Locale locale;
  final BuildContext context;

  ChangeLanguageEvent({required this.locale, required this.context});
}


class LanguageSelectedEvent extends LanguageEvent {
  final Locale locale;
  LanguageSelectedEvent(this.locale);
}
