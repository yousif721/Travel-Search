import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/resources.dart';

class AppBottomSheet extends StatelessWidget {
  final Widget child;

  const AppBottomSheet({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /*  padding: const EdgeInsets.all(AppPadding.p16)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),*/
      decoration:  BoxDecoration(
        color: ColorManager.sheetColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.s10)),
      ),
      child: SafeArea(
        child: Container(
          decoration:  BoxDecoration(
            color: ColorManager.sheetColor,
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppSize.s10)),
          ),
          child: ClipRRect(
            borderRadius:  const BorderRadius.vertical(top: Radius.circular(AppSize.s10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: AppPadding.p16),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
