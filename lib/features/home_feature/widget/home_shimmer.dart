// Flutter core
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:flutter/material.dart';

// Third-party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 👤 Header shimmer
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    ShimmerBox(height: 40.h, width: 40.w, shape: BoxShape.circle),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(height: 12.h, width: 100.w),
                        SizedBox(height: 6.h),
                        ShimmerBox(height: 10.h, width: 140.w),
                      ],
                    ),
                  ],
                ),
              ),

              // 🖼️ Banner shimmer
              ShimmerBox(
                height: 150.h,
                width: double.infinity,
                borderRadius: BorderRadius.circular(12),
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              ),

              // 🔥 Section title shimmer
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerBox(height: 14.h, width: 100.w),
                    ShimmerBox(height: 12.h, width: 50.w),
                  ],
                ),
              ),

              // 👜 Products grid shimmer
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.w,
                    mainAxisSpacing: 12.h,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(
                          height: 120.h,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        SizedBox(height: 8.h),
                        ShimmerBox(height: 12.h, width: 80.w),
                        SizedBox(height: 4.h),
                        ShimmerBox(height: 10.h, width: 50.w),
                        SizedBox(height: 4.h),
                        ShimmerBox(height: 12.h, width: 60.w),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double height;
  final double? width;
  final BoxShape shape;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;

  const ShimmerBox({
    super.key,
    required this.height,
    this.width,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.circle ? null : borderRadius,
        ),
      ),
    );
  }
}

