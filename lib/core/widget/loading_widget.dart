import 'package:flutter/material.dart';
import 'package:flutter_template/core/widget/shimmer_widget.dart';

class LoadingPlaceholder extends StatelessWidget {
  const LoadingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              ShimmerWidget(
                type: BoxType.circle,
              ),
              ShimmerWidget(),
              ShimmerWidget(
                type: BoxType.rectangle,
              ),
            ],
          ),
          ShimmerWidget.shimmerRow,
          Row(
            children: [
              ShimmerWidget(),
              ShimmerWidget(
                type: BoxType.rectangle,
              ),
              ShimmerWidget(),
            ],
          ),
          ShimmerWidget.shimmerRow21,
          Row(
            children: [
              ShimmerWidget(),
              ShimmerWidget(),
              ShimmerWidget(
                type: BoxType.rectangle,
              ),
            ],
          ),
          ShimmerWidget.shimmerRow121,
        ],
      ),
    );
  }
}
