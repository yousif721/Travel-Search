import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/component/item_tile.dart';
import '../../../../core/resources/resources.dart';
import '../../../home/view/screens/home_view.dart';
import '../../view_model/add_room_view_model.dart';
import '../component/room_children_component.dart';

class RoomWidget extends StatelessWidget {
  const RoomWidget({
    super.key,
    required this.addRoomProvider,
    required this.index,
  });

  final AddRoomProvider addRoomProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12.w, vertical: AppPadding.p8.h),
      margin: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSize.s10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              text: "${AppStrings.room.toUpperCase()} ${index + 1}",
              textStyle: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: AppPadding.p8,
          ),
          ItemTile(
            enableDecrement: addRoomProvider.rooms[index].adultNumber == 1
                ? false
                : true,
            enableIncrement:
            addRoomProvider.rooms[index].adultNumber < 4 ? true : false,
            title: AppStrings.adults,
            quantity: addRoomProvider.rooms[index].adultNumber,
            onDecrease: () {
              addRoomProvider.decreaseAdultsCount(index);
            },
            onIncrease: () {
              addRoomProvider.increaseAdultsCount(index);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          ItemTile(
            enableDecrement:
            addRoomProvider.rooms[index].childrenNumber == 0
                ? false
                : true,
            enableIncrement: addRoomProvider.rooms[index].childrenNumber < 4
                ? true
                : false,
            title: AppStrings.children,
            quantity: addRoomProvider.rooms[index].childrenNumber,
            onDecrease: () {
              addRoomProvider.decreaseChildrenCount(index);
            },
            onIncrease: () {
              addRoomProvider.increaseChildrenCount(index);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          RoomChildrenComponent(
              addRoomProvider: addRoomProvider, roomIndex: index),
        ],
      ),
    );
  }
}