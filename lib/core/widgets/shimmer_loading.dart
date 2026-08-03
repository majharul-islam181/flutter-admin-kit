import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A reusable shimmer loading block to represent loading states.
class ShimmerLoading extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerLoading.rectangular({
    super.key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  });

  const ShimmerLoading.circular({
    super.key,
    required double size,
    this.shapeBorder = const CircleBorder(),
  })  : width = size,
        height = size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;
    final highlightColor = isDark ? Colors.grey[700]! : Colors.grey[100]!;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: baseColor,
          shape: shapeBorder,
        ),
      ),
    );
  }

  /// Builds a sample loading list item skeleton.
  static Widget buildListSkeleton({int count = 5}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerLoading.circular(size: 48),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerLoading.rectangular(
                    width: double.infinity,
                    height: 16,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ShimmerLoading.rectangular(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 12,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
