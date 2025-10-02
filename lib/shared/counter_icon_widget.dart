import 'package:ecommerce_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterIconWidget extends StatelessWidget {
  final IconData icon ;
  final VoidCallback onTap;
  const CounterIconWidget({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      width: 25.w,
      child: CircleAvatar(
        backgroundColor: AppColors.whiteColor,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onTap,
          icon: Icon(icon, color: AppColors.blackColor, size: 15.sp),
        ),
      ),
    );
  }
}
