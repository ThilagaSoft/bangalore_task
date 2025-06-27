import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/navigation/nav_event.dart';
import 'package:task_pro/bloc/navigation/nav_state.dart';



class NavigationBloc extends Bloc<NavigationEvent, NavigationState>
{
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationItemSelected>((event, emit) {
      emit(NavigationItemChanged(event.index));
    });
  }
}
