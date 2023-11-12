import 'package:flutter/material.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/resources/resources.dart';

class RoomChildrenWidget extends StatelessWidget {
  final int childIndex;
  const RoomChildrenWidget({
    super.key,
    required this.childIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomText(
                text:
                "${AppStrings.ageOfChild} ${childIndex + 1}",
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(height: 2)),
            const Spacer(),
            CustomText(
                text: "14 ${AppStrings.years}",
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                    color: ColorManager.greyColor,
                    height: 2)),
          ],
        )
      ],
    );
  }
}