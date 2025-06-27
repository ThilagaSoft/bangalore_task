import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/language/language_bloc.dart';
import 'package:task_pro/bloc/language/language_event.dart';
import 'package:task_pro/bloc/language/language_state.dart';
import 'package:task_pro/config/static_text.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StaticText.selectLanguage.toLowerCase().tr())),
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          final current = (state as LanguageCurrentState).locale.languageCode;

          return ListView(
            children: ['en', 'ar'].map((code) {
              return RadioListTile<String>(
                title: Text(code.toUpperCase()),
                value: code,
                groupValue: current,
                onChanged: (selectedCode) {
                  if (selectedCode == null) return;
                  context.read<LanguageBloc>().add(
                    LanguageSelectedEvent(Locale(selectedCode)),
                  );
                  context.setLocale(Locale(selectedCode));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
