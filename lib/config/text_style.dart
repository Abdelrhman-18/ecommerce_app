import 'package:ecommerce_app/config/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static final TextStyle welcomeSentence1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.sp,
    color: ColorManager.blackColor,
  );

  static final TextStyle welcomeSentence2 = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.sp,
    color: ColorManager.greyColor,
  );

  static final TextStyle newArrivalsStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
    color: ColorManager.blackColor,
  );

  static final TextStyle seeAllStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11.sp,
    color: ColorManager.primaryColor,
  );

  static final TextStyle productNameStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: ColorManager.blackColor,
  );

  static final TextStyle manufacturerTextStyle = TextStyle(
    color: ColorManager.grey600,
    fontSize: 13.sp,
  );

  static final TextStyle productPriceStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: ColorManager.blackColor,
  );
}
