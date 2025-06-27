import 'package:flutter/material.dart';
import 'package:task_pro/controller/home_controller.dart';
import 'package:task_pro/view/widgets/category_list_widgte.dart';
import 'package:task_pro/view/widgets/details_card_widget.dart';
import 'package:task_pro/view/widgets/meesage_widget.dart';

class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    final homeController = HomeController();
    return ListView(
        shrinkWrap: true,
        children:
        [
          ProfileCard(
            name: 'Jane Smith',
            phoneNumber: '+44 7911 123456',
            country: 'UK',
            imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUJud2BBjuoQY11nXmhJwokj2tXovmXddoMQ&s',
          ),

          MessageWidget(message: homeController.message,),

          CategorySection(categories: homeController.mockCategories),
      ]
    );
  }
}
