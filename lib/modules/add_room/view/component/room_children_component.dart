import 'package:flutter/material.dart';
import '../../../../core/resources/resources.dart';
import '../../view_model/add_room_view_model.dart';
import '../widget/room_children_widget.dart';

class RoomChildrenComponent extends StatelessWidget {
  const RoomChildrenComponent({
    super.key,
    required this.addRoomProvider,
    required this.roomIndex,
  });

  final AddRoomProvider addRoomProvider;
  final int roomIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(left: AppPadding.p8),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: addRoomProvider.rooms[roomIndex].childrenNumber,
        itemBuilder: (context, childIndex) {
          return RoomChildrenWidget(
            childIndex: childIndex,
          );
        });
  }
}
