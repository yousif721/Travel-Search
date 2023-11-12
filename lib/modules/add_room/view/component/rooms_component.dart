import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_hotels/core/resources/app_values.dart';
import '../../view_model/add_room_view_model.dart';
import '../widget/room_widget.dart';

class RoomComponent extends StatelessWidget {
  final AddRoomProvider addRoomProvider;

  const RoomComponent({
    required this.addRoomProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: addRoomProvider.rooms.length,
      itemBuilder: (context, index) {
        return RoomWidget(addRoomProvider: addRoomProvider,index:index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return  SizedBox(
          height: AppPadding.p12.h,
        );
      },
    );
  }
}


