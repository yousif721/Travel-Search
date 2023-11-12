import 'package:flutter/material.dart';

import '../component/app_bottom_sheet.dart';
import '../resources/resources.dart';

class AppSheets {
  static Future<T?> showBottomSheet<T>(BuildContext context, {required Widget child}) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: ColorManager.sheetColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s12))),
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.95, minWidth: double.maxFinite),
      builder: (context) => AppBottomSheet(child: child),
    );
  }
}
