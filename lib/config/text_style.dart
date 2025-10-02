import 'package:ecommerce_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static final TextStyle welcomeSentence1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
    color: AppColors.blackColor,
  );

  static final TextStyle welcomeSentence2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: AppColors.greyColor,
  );

  static final TextStyle newArrivalsStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: AppColors.blackColor,
  );

  static final TextStyle seeAllStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    color: AppColors.primaryColor,
  );

  static final TextStyle productNameStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static final TextStyle manufacturerTextStyle = TextStyle(
    color: AppColors.grey600,
    fontSize: 13.sp,
  );

  static final TextStyle productPriceStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
  static final TextStyle counterStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
