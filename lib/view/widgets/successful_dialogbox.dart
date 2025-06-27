import 'package:flutter/material.dart';
import 'package:task_pro/core/theme/app_color.dart';
import 'package:task_pro/view/widgets/button_widget.dart';

 Future<void> showSuccessDialog(BuildContext context, String message)  async{
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.black.withOpacity(0.2),
    builder: (dialogContext) {

      return AlertDialog(
       backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children:
          [
            Icon(Icons.check_circle,color: AppColors.green,size: 100,),
            SizedBox(height: 16),
            Text(
              message,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ButtonWidget(
                buttonText: message.contains("Login")?"Go to home":"Go to login",
                onSubmit:()
                {
                  Navigator.pop(dialogContext);  // Close dialog

                }

            )
          ],
        ),
      );
    },
  );
}
