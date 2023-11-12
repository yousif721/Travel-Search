import 'package:flutter/cupertino.dart';

class NationalitiesProvider extends ChangeNotifier {
  final List<String> _nationalitiesList = ["Egypt", "German", "England"];
  List<String>? get nationalitiesList => _nationalitiesList;


  String? _selectedNationalities;
  String? get selectedNationalities => _selectedNationalities;



  void updateNationality(String? newValue) {
    _selectedNationalities = newValue;
    notifyListeners();
  }






}
