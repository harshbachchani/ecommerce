import 'package:ecommerce/common/widgets/images/circular_image.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HUserProfileTile extends StatelessWidget {
  const HUserProfileTile({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: const HCircularImage(
        image: HImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Hello User',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: HColors.white),
      ),
      subtitle: Text(
        'hellouser@gmail.com',
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: HColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit_copy, color: HColors.white),
      ),
    );
  }
}
