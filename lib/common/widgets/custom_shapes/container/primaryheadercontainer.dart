import 'package:ecommerce/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return HCurvedEdgeWidget(
      child: Container(
        color: HColors.primary,
        padding: const EdgeInsets.all(0),
        //if size.isinfinite is not true  in stack  error occured
        child: Stack(
          children: [
            //background custom shapes
            Positioned(
              top: -150,
              right: -250,
              child: HCircularContainer(
                backgroundColor: HColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: HCircularContainer(
                backgroundColor: HColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
