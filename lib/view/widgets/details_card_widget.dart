import 'package:flutter/material.dart';
import 'package:task_pro/core/theme/app_color.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String country;
  final String imageUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.imageUrl, // Default image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(15),
       border: Border.all(
         color: AppColors.primary.withOpacity(0.2)
       )
     ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // Background image
            Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            // Semi-transparent overlay
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withOpacity(0.1),
            ),
            // Profile details
            Positioned(
              bottom: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 16, color:AppColors.black),
                      const SizedBox(width: 4),
                      Text(
                        phoneNumber,
                        style: TextStyle(color:AppColors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color:AppColors.black),
                      const SizedBox(width: 4),
                      Text(
                        country,
                        style: TextStyle(color:AppColors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
