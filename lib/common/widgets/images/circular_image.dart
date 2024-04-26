import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/loaders/circular_loader.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HCircularImage extends StatelessWidget {
  const HCircularImage({
    super.key,
    required this.image,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.overlaycolor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = HSizes.sm,
  });
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlaycolor;
  final Color? backgroundColor;
  final double width, height, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          //If image background color is null then switch it to light and dark mode color design

          color: backgroundColor ?? HHelperFunctions.getrightColor(context),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlaycolor,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const HShimmerEffect(width: 55, height: 55),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: isNetworkImage
                        ? NetworkImage(image)
                        : AssetImage(image) as ImageProvider,
                    color: overlaycolor,
                  ),
          ),
        ));
  }
}
