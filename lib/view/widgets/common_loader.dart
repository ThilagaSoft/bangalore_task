import 'package:flutter/material.dart';
import 'package:task_pro/core/theme/app_color.dart';

Future<void> showLoaderDialog(BuildContext context)  async
{
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.black.withOpacity(0.2),
    builder: (dialogContext)
    {
      return AlertDialog(
        backgroundColor: AppColors.white,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: SizedBox(
            height: MediaQuery.of(context).size.height/4,
            child: Center(child: CircularProgressIndicator(color: AppColors.primary,))),
      );
    },
  );
}
