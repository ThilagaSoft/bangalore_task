import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/language/language_event.dart';
import 'package:task_pro/bloc/language/language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageCurrentState(Locale('en'))) {
    on<LanguageSelectedEvent>((event, emit) {
      emit(LanguageCurrentState(event.locale));
    });
  }
}
