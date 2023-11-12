import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_hotels/modules/add_room/view_model/add_room_view_model.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/resources/resources.dart';

class PetsInfoWidget extends StatelessWidget {
  const PetsInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addRoomProvider =Provider.of<AddRoomProvider>(context,listen: false);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s10.r),
      ),
      child: ListTile(
        title: Row(children: [
          CustomText(
              text: AppStrings.petFiendly,
              textStyle: Theme.of(context).textTheme.titleLarge),
          SizedBox(
            width: AppPadding.p4.w,
          ),
          Icon(
            Icons.info_outline,
            size: 18.w,
            color: ColorManager.black,
          )
        ]),
        subtitle: CustomText(
            text: AppStrings.onlyShowStaysThatAllowPets,
            textStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorManager.black)),
        trailing: CupertinoSwitch(value: context.watch<AddRoomProvider>().enablePets, onChanged: (value) {
          addRoomProvider.togglePets();
        }),
      ),
    );
  }
}