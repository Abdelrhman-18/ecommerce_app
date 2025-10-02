import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(height: 350, color: Colors.white),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerBox(width: 120, height: 20),
                      shimmerBox(width: 60, height: 20),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: List.generate(
                      5,
                          (index) => Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: shimmerBox(
                          width: 20,
                          height: 20,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      shimmerBox(width: 30, height: 30, shape: BoxShape.circle),
                      const SizedBox(width: 10),
                      shimmerBox(width: 30, height: 30, shape: BoxShape.circle),
                      const SizedBox(width: 10),
                      shimmerBox(width: 30, height: 30, shape: BoxShape.circle),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Row(
                    children: [
                      shimmerBox(width: 40, height: 30, borderRadius: 8),
                      const SizedBox(width: 10),
                      shimmerBox(width: 40, height: 30, borderRadius: 8),
                      const SizedBox(width: 10),
                      shimmerBox(width: 40, height: 30, borderRadius: 8),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Description
                  shimmerBox(width: double.infinity, height: 20),
                  const SizedBox(height: 10),
                  shimmerBox(width: double.infinity, height: 80),
                  const SizedBox(height: 20),

                  // Reviews
                  shimmerBox(width: double.infinity, height: 20),
                  const SizedBox(height: 10),
                  shimmerBox(width: double.infinity, height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: const EdgeInsets.all(12),
        child: shimmerBox(width: double.infinity, height: 60, borderRadius: 30),
      ),
    );
  }

  Widget shimmerBox({
    double? width,
    double? height,
    BoxShape shape = BoxShape.rectangle,
    double borderRadius = 0,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}
