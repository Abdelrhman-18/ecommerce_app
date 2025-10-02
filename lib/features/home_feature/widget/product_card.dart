// Flutter core
import 'package:flutter/material.dart';

// Third-party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports - Config
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/text_style.dart';

// Project imports - Features
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.product,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: Image with Favorite Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    color: AppColors.lightGreyColor,
                    child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                top: 10.h,
                child: GestureDetector(
                  onTap: onFavoriteToggle,
                  child: Container(
                    height: 30.r,
                    width: 30.r,
                    decoration: BoxDecoration(
                      color: AppColors.blackOpacityColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: product.isFavorite
                          ? AppColors.redColor
                          : AppColors.whiteColor,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //TODO: Product Info
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.productNameStyle,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  product.manufacturer,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.manufacturerTextStyle,
                ),
                SizedBox(height: 5.h),
                Text(
                  "\$${product.price}",
                  style: AppTextStyles.productPriceStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
