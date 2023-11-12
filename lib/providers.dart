import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_hotels/modules/home/view_model/nationalities_view_model.dart';

import 'modules/add_room/view_model/add_room_view_model.dart';
import 'modules/home/view_model/cities_view_model.dart';
import 'modules/home/view_model/date_range_view_model.dart';

class AppProviders extends StatelessWidget {
  final Widget child;

  const AppProviders({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddRoomProvider()),
        ChangeNotifierProvider(create: (context) => CitiesProvider()),
        ChangeNotifierProvider(create: (context) => NationalitiesProvider()),
        ChangeNotifierProvider(create: (context) => DateRangeProvider()),
      ],
      child: child,
    );
  }
}
