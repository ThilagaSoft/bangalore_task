import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/apiClient/auth_repository.dart';
import 'package:task_pro/bloc/auth/auth_event.dart';
import 'package:task_pro/bloc/auth/auth_state.dart';
import 'package:task_pro/model/user_model.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial())
  {
    on<RegisterEvent>(onRegisterRequested);
    on<LoginEvent>(onLoginRequest);
  }

  Future<void> onRegisterRequested(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.register(
        event.userName,
        event.email,
        event.phone,
        event.password,
        event.countryCode
      );
      emit(RegisterSuccess(user));
    }
    on SocketException {
      emit(AuthError("No internet connection"));
    }
    on Exception catch (e)
    {
      emit(AuthError(e.toString()));
    }
    catch (e)
    {
      print(e.toString());

      emit(AuthError(e.toString()));
    }
  }

  Future<UserModel?> onLoginRequest(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepository.login(event.email, event.password);

      emit(LoginSuccess(user:user));
    }
    on SocketException {
      emit(AuthError("No internet connection"));
    }
    on Exception catch (e)
    {
      emit(AuthError(e.toString()));
    }
    catch (e, stackTrace)
    {
      print(" Unexpected Login error: $e\n$stackTrace");
      emit(AuthError("Something went wrong"));
    }
    return null;
  }



}
