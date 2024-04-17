import 'package:ecommerce/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class HChoiceChip extends StatelessWidget {
  const HChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final iscolor = HHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: iscolor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        avatar: iscolor
            ? HCircularContainer(
                height: 50,
                width: 50,
                backgroundColor: HHelperFunctions.getColor(text),
              )
            : null,
        shape: iscolor ? const CircleBorder() : null,
        labelPadding: iscolor ? const EdgeInsets.all(0) : null,
        padding: iscolor ? const EdgeInsets.all(0) : null,
        backgroundColor: iscolor ? HHelperFunctions.getColor(text) : null,
        labelStyle: TextStyle(color: selected ? HColors.white : null),
      ),
    );
  }
}
