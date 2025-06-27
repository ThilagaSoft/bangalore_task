import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/apiClient/auth_repository.dart';
import 'package:task_pro/apiClient/country_repository.dart';
import 'package:task_pro/bloc/country/country_bloc.dart';
import 'package:task_pro/bloc/country/country_event.dart';
import 'package:task_pro/bloc/language/language_bloc.dart';
import 'package:task_pro/bloc/navigation/nav_bloc.dart';
import 'package:task_pro/core/theme/app_color.dart';
import 'package:task_pro/core/theme/text_styles.dart';
import 'package:task_pro/bloc/auth/auth_bloc.dart';
import 'package:task_pro/view/dashboard/dashbard_screen.dart';
import 'package:task_pro/view/home/home_screen.dart';
import 'bloc/auth/password_visibility_cubit.dart';
import 'view/auth/register_screen.dart';
import 'view/language/language_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PasswordVisibilityCubit()),
        BlocProvider(create: (_) => AuthBloc(authRepository: AuthRepository())),
        BlocProvider(create: (_) => LanguageBloc()),
        BlocProvider(create: (_) => NavigationBloc()),
        BlocProvider(create: (context) => CountryBloc(CountryApiService())..add(FetchCountries())),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/home': (_) => const HomeScreen(),
          '/': (_) => const DashboardScreen(),
          '/language': (_) => const LanguageScreen(),  // renamed route
          '/register': (_) => const RegisterScreen(),
        },
        locale: context.locale,          // <-- important!
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              textStyle: TextStyles.boldText,
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
