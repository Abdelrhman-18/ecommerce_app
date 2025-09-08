import 'package:ecommerce_app/config/color_manager.dart';
import 'package:ecommerce_app/config/image_manager.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(ImageManager.profileImage),
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
                    left: 12.w,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.redColor,
                      radius: 5.r,
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
