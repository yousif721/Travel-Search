import 'package:flutter/cupertino.dart';
import 'package:search_hotels/modules/add_room/models/room_model.dart';

import '../../../core/resources/resources.dart';

class AddRoomProvider extends ChangeNotifier {
  final roomsConclusionController = TextEditingController();
  bool enablePets = false;
  List<RoomModel> rooms = [RoomModel(adultNumber: 1, childrenNumber: 0)];

  void increaseRooms() {
    rooms.add(RoomModel(adultNumber: 1, childrenNumber: 1));
    notifyListeners();
  }

  void decreaseRooms() {
    rooms.removeLast();
    notifyListeners();
  }

  void increaseChildrenCount(int index) {
    rooms[index].childrenNumber++;
    notifyListeners();
  }

  void decreaseChildrenCount(int index) {
    rooms[index].childrenNumber--;
    notifyListeners();
  }

  void increaseAdultsCount(int index) {
    rooms[index].adultNumber++;
    notifyListeners();
  }

  void decreaseAdultsCount(int index) {
    rooms[index].adultNumber--;
    notifyListeners();
  }

  void togglePets() {
    enablePets = !enablePets;
    notifyListeners();
  }

  ///total
  String get totalNumbers {
    int totalChildren = 0;
    int totalAdults = 0;
    for (var element in rooms) {
      totalChildren += element.childrenNumber;
      totalAdults += element.adultNumber;
    }

    return "${rooms.length} ${AppStrings.room} , $totalAdults ${AppStrings.adult} , $totalChildren ${AppStrings.children}";
  }
}
