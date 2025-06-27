import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/auth/auth_event.dart';
import 'package:task_pro/bloc/auth/auth_state.dart';
import 'package:task_pro/controller/auth_controller.dart';
import 'package:task_pro/core/theme/text_styles.dart';
import 'package:task_pro/bloc/auth/auth_bloc.dart';
import 'package:task_pro/bloc/auth/password_visibility_cubit.dart';
import 'package:task_pro/view/widgets/button_widget.dart';
import 'package:task_pro/view/widgets/passwordField_widget.dart';
import 'package:task_pro/view/widgets/successful_dialogbox.dart';
import 'package:task_pro/view/widgets/textformfield_widget.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState()
  {
    super.initState();
    
  }
  @override
  void dispose()
  {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context)
  {
    final controller = AuthController(context,formKey);

    return BlocListener<AuthBloc,AuthState>(
        listener: (context, state) => controller.handleState(state),

       child:  Scaffold(
            backgroundColor: Colors.purple, // Set main scaffold background
            body: SafeArea(
              child: Container(
                color: Colors.purple, // This ensures full background
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TextFormFieldWidget(
                                  controller: emailController,
                                  hintText: 'Email',
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                const SizedBox(height: 20),
                                BlocSelector<PasswordVisibilityCubit, Map<String, bool>, bool>(
                                    selector: (state) => state["Password"] ?? true,
                                    builder: (context, obscure) {
                                    return PasswordFieldWidget(
                                      controller: passwordController,
                                      hintText: 'Password',
                                      obscurePassword: obscure,
                                      onChanged: ()
                                      {
                                        context.read<PasswordVisibilityCubit>().toggle('Password');

                                      },
                                    );
                                  }
                                ),
                                const SizedBox(height: 24),
                                ButtonWidget(buttonText: "Login",
                                onSubmit: ()
                                {

                                  controller.login(emailController.text, passwordController.text);
                                },
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:
                                  [
                                    Text("Don't have an account?",style: TextStyles.smallHintText,),
                                    TextButton(
                                        onPressed: ()
                                        {

                                          Navigator.pushNamed(context, '/register');

                                        },
                                        child: Text("Sign up",style: TextStyles.smallHintButtonText,))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )

    );  }
}
