// Flutter core
import 'package:flutter/material.dart';

// Third-party packages
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports - Config
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/app_images.dart';
import 'package:ecommerce_app/config/text_style.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage(AppImage.profileImage),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi, Abdelrhman", style: AppTextStyles.welcomeSentence1),
                  Text(
                    "Let's go shopping",
                    style: AppTextStyles.welcomeSentence2,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Icon(EvaIcons.searchOutline),
              SizedBox(width: 10.w),
              Stack(
                children: [
                  Icon(EvaIcons.bellOutline),
                  Positioned(
                    left: 11.w,
                    top: 3.w,
                    child: CircleAvatar(
                      backgroundColor: AppColors.redColor,
                      radius: 3.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
