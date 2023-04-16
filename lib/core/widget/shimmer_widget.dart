import 'package:flutter/material.dart';
import 'package:flutter_template/core/res/colors.dart';
import 'package:shimmer/shimmer.dart';

enum BoxType { square, rectangle, circle }

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.type = BoxType.square,
  });
  final BoxType type;

  static const Row shimmerRow = Row(
    children: [
      ShimmerWidget(),
      ShimmerWidget(),
      ShimmerWidget(),
    ],
  );
  static const Row shimmerRow121 = Row(
    children: [
      ShimmerWidget(),
      ShimmerWidget(
        type: BoxType.rectangle,
      ),
      ShimmerWidget(),
    ],
  );
  static const Row shimmerRow21 = Row(
    children: [
      ShimmerWidget(
        type: BoxType.rectangle,
      ),
      ShimmerWidget(),
    ],
  );

  @override
  Widget build(BuildContext context) {
    if (type == BoxType.rectangle) {
      return Expanded(
        flex: 2,
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlighted,
          child: Container(
            width: 200,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    } else if (type == BoxType.circle) {
      return Expanded(
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlighted,
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppColors.darkGrey,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    } else {
      // if BoxType is default => Square
      return Expanded(
        child: Shimmer.fromColors(
          baseColor: AppColors.shimmerBase,
          highlightColor: AppColors.shimmerHighlighted,
          child: Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }
  }
}
