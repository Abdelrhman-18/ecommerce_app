import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/shared/counter_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCounter extends StatelessWidget {
  final int counter;
  final String productId;
  final dynamic cubit;
  final int? initialValue;

  const CustomCounter({
    super.key,
    required this.counter,
    required this.productId,
    required this.cubit,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterIconWidget(
            icon: Icons.remove,
            onTap: () => initialValue != null
                ? cubit.decrementQuantity(productId, initialValue)
                : cubit.decrementQuantity(productId),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text("$counter", style: AppTextStyles.counterStyle),
          ),
          CounterIconWidget(
            icon: Icons.add,
            onTap: () => initialValue != null
                ? cubit.incrementQuantity(productId, initialValue)
                : cubit.incrementQuantity(productId),
          ),
        ],
      ),
    );
  }
}
