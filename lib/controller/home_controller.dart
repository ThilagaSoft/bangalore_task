import 'package:flutter/material.dart';
import 'package:task_pro/model/category_model.dart';


class HomeController
{
   List<CategoryModel>   mockCategories =
   [
     CategoryModel(
       id: 'chat',
       title: 'Chat',
       icon: Icons.chat,
     ),
     CategoryModel(
       id: 'map',
       title: 'Map',
       icon: Icons.map,
     ),
     CategoryModel(
       id: 'profile',
       title: 'Profile',
       icon: Icons.account_circle,
     ),
     CategoryModel(
       id: 'language',
       title: 'Language',
       icon: Icons.language,
     ),
   ];
   String message = 'Here are some menu options below. Select one to begin.';
   HomeController();

}
