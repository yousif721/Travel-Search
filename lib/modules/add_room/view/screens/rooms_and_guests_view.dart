import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_hotels/modules/add_room/view/widget/add_room_header_widget.dart';
import 'package:search_hotels/modules/add_room/view/widget/pets_info_widget.dart';
import '../../../../core/component/item_tile.dart';
import '../../../../core/resources/resources.dart';
import '../../../home/view/screens/home_view.dart';
import '../../view_model/add_room_view_model.dart';
import '../component/rooms_component.dart';

class RoomsAndGuestsView extends StatelessWidget {
  const RoomsAndGuestsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AddRoomProvider>(builder: (_, data, ch) {
      return Column(
        children: [
          const AddRoomHeaderWidget(),
          SizedBox(
            height: AppPadding.p12.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s10.r),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12.w, vertical: AppPadding.p8.h),
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
            child: ItemTile(
              enableDecrement: data.rooms.length == 1 ? false : true,

              title: AppStrings.rooms,
              quantity: data.rooms.length,
              onDecrease: () {
                data.decreaseRooms();
              },
              onIncrease: () {
                data.increaseRooms();
              },
            ),
          ),
          SizedBox(
            height: AppPadding.p12.h,
          ),
          RoomComponent(addRoomProvider: data),
          const SizedBox(
            height: 10,
          ),
          const PetsInfoWidget(),
          const SizedBox(
            height: 100,
          ),
        ],
      );
    });
  }
}
