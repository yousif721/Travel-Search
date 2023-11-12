import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../core/component/custom_text.dart';
import '../../../../core/resources/resources.dart';

class AddRoomHeaderWidget extends StatelessWidget {
  const AddRoomHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p8.h, horizontal: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.close,
            size: 18.w,
            color: ColorManager.white,
          ),
          Expanded(
              child: CustomText(
            text: AppStrings.roomsAndGuests,
            textAlign: TextAlign.center,
            textStyle: Theme.of(context).textTheme.titleLarge,
          )),
          GestureDetector(
            onTap: () {
              NavigationService.goBack(context);
            },
            child: Icon(
              Icons.close,
              size: 25.w,
              color: ColorManager.black,
            ),
          )
        ],
      ),
    );
  }
}
