import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';
import 'outline_border_icon_widget.dart';

class ItemTile extends StatelessWidget {
  final int quantity;
  final String title;
  final bool enableDecrement;
  final bool enableIncrement;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  const ItemTile({
    required this.quantity,
    required this.onDecrease,
    required this.title,
    this.enableDecrement = false,
    this.enableIncrement = true,
    required this.onIncrease,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomText(
          text: title, textStyle: Theme.of(context).textTheme.titleMedium),
      const Spacer(),
      GestureDetector(
          onTap:  enableIncrement ? onIncrease : null,
          child: OutlineBorderIconWidget(
            icon: Icons.add,
            isnEnable: enableIncrement,
          )),
      SizedBox(
          width: 40.w,
          child: Center(child: CustomText(text: quantity.toString()))),
      GestureDetector(
          onTap: enableDecrement ? onDecrease : null,
          child: OutlineBorderIconWidget(
              icon: Icons.remove, isnEnable: enableDecrement)),
    ]);
  }
}
