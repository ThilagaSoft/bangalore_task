import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:task_pro/config/static_text.dart';
import 'package:task_pro/core/theme/app_color.dart';
import 'package:task_pro/model/category_model.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategorySection({required this.categories, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(StaticText.menuList.tr(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            children: categories.map((cat)
            {
              return Column(
                children: [
                  InkWell(
                    onTap:()
                       {
                       Navigator.pushNamed(context, '/${cat.title}');
                       },
                    child: Container(
                      width: 80,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.primary),
                        color: AppColors.boxShade
                      ),
                      child: Icon(cat.icon,size: 30,),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(cat.title, style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 12),

                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
