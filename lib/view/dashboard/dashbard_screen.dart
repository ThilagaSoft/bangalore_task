import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pro/bloc/navigation/nav_bloc.dart';
import 'package:task_pro/bloc/navigation/nav_event.dart';
import 'package:task_pro/bloc/navigation/nav_state.dart';
import 'package:task_pro/core/theme/app_color.dart';
import 'package:task_pro/view/home/home_screen.dart';
import 'package:task_pro/view/language/language_screen.dart';
import 'package:task_pro/view/widgets/common_appBar.dart';
import 'package:task_pro/view/widgets/drawer_menu_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CommonAppBar(title: "Welcome"),
      drawer: CommonDrawer(
        onHomeTap: ()
        {
          Navigator.pushNamed(context, '/lang');
        },
        onProfileTap: () {},
        onLogoutTap: () {},
        headerColor: AppColors.primary,
        title: "Hello, User!",
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationItemChanged) {
            currentIndex = state.index;
          }
          return IndexedStack(
            index: currentIndex,
            children: const [
              HomeScreen(),
              HomeScreen(),
              LanguageScreen(),
              HomeScreen(),
              HomeScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          int currentIndex = 0;
          if (state is NavigationItemChanged) {
            currentIndex = state.index;
          }
          return BottomNavigationBar(
            backgroundColor: AppColors.primary,
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<NavigationBloc>().add(NavigationItemSelected(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: AppColors.primary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Location',
                backgroundColor: AppColors.primary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: 'Language',
                backgroundColor: AppColors.primary,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Chat',
                backgroundColor: AppColors.primary,

              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
                backgroundColor: AppColors.primary,
              ),
            ],
          );
        },
      ),
    );
  }
}
