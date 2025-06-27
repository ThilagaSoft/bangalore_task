import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/auth/auth_bloc.dart';
import 'package:task_pro/bloc/auth/auth_event.dart';
import 'package:task_pro/bloc/auth/auth_state.dart';
import 'package:task_pro/view/widgets/common_loader.dart';
import 'package:task_pro/view/widgets/successful_dialogbox.dart';


class AuthController {
  final BuildContext context;
  final GlobalKey<FormState> formKey;

  AuthController(this.context,this.formKey);

  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String countryCode,
  }) {
    if (formKey.currentState!.validate())
      {
        context.read<AuthBloc>().add(RegisterEvent(
          userName: name,
          email: email,
          phone: phone,
          password: password,
          countryCode: countryCode,
        ));
      }

  }

  void login(String email, String password)
  {
    if (formKey.currentState!.validate())
      {
        context.read<AuthBloc>().add(LoginEvent(email: email, password: password));

      }

  }

  void handleState(AuthState state)
  {
    if (state is RegisterSuccess)
    {
      showSuccessDialog(context, "Register Success").then((val)
       {
         Navigator.pushNamed(context, '/');

        });
    }
    else if (state is LoginSuccess)
    {
      Navigator.pop(context);
      showSuccessDialog(context, "Login Success");
      // showSuccessDialog(context, "Login Success").then((val)
      // {
      //   Navigator.pushNamed(context, '/home');
      //
      // });
    }
    else if (state is AuthLoading)
      {
        showLoaderDialog(context);
      }
    else if (state is AuthError)
    {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message.replaceFirst("Exception: ", ""))),
      );
    }
  }
}
