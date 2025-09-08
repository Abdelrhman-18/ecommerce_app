import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/config/color_manager.dart';
import 'package:ecommerce_app/features/home_feature/model/carousel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final List<CarouselModel> carouselList = [
    CarouselModel(imageUrl: "assets/images/slider/slider_1.jpg"),
    CarouselModel(imageUrl: "assets/images/slider/slider_2.jpg"),
    CarouselModel(imageUrl: "assets/images/slider/slider_3.jpg"),
    CarouselModel(imageUrl: "assets/images/slider/slider_4.jpg"),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      child: Column(
        children: [
          CarouselSlider(
            items: carouselList
                .map(
                  (item) => ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  width: 320.w,
                ),
              ),
            )
                .toList(),
            options: CarouselOptions(
              height: 180.h,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(carouselList.length, (index) {
              return Container(
                width: 8.w,
                height: 8.h,
                margin:  EdgeInsets.symmetric(horizontal: 4.h),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? ColorManager.primaryColor
                      : ColorManager.greyColor,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
