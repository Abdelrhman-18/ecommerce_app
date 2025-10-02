// Flutter core
import 'package:flutter/material.dart';

// Third-party packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports - Config
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/app_images.dart';

// Project imports - Features
import 'package:ecommerce_app/features/home_feature/model/carousel_model.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  //TODO:Image List
  final List<CarouselModel> carouselList = [
    CarouselModel(imageUrl: AppImage.slider1),
    CarouselModel(imageUrl: AppImage.slider2),
    CarouselModel(imageUrl: AppImage.slider3),

  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //TODO: Carousel
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          CarouselSlider(
            items: carouselList
                .map(
                  (item) => ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: 340.w,
                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
              height: 150.h,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(height: 16.h),
          //TODO: Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(carouselList.length, (index) {
              return Container(
                width: 7.w,
                height: 7.h,
                margin:  EdgeInsets.symmetric(horizontal: 4.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? AppColors.primaryColor
                      : AppColors.lightGreyColor,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
