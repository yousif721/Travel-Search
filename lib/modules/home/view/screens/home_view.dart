import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_hotels/core/component/custom_button.dart';
import 'package:search_hotels/modules/home/view/widgets/date_range_component.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/component/triangle_clipper.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/utils/sheets.dart';
import '../../../add_room/view/screens/rooms_and_guests_view.dart';
import '../../../add_room/view_model/add_room_view_model.dart';
import '../widgets/cityWidget.dart';
import '../widgets/nationality_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AssetsManager.homeImage,
              ),
              fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p16.w, vertical: AppPadding.p20.h),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 50,
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p6),
                      width: 170.w,
                      color: ColorManager.primaryColor,
                      alignment: AlignmentDirectional.centerStart,
                      child: CustomText(
                          text: AppStrings.hotelSearch,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: ColorManager.white)),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: ColorManager.orangeColor,
                  ),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p12.w,
                            vertical: AppPadding.p16.w,
                          ),
                          decoration: BoxDecoration(
                            //   color:ColorManager.orangeColor,
                            borderRadius: BorderRadius.circular(12.r),
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                ColorManager.primaryColor,
                                ColorManager.lightPrimaryColor,
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const CityWidget(),
                              SizedBox(height: 10.h),
                              const DateRangeComponent(),
                              SizedBox(height: 10.h),
                              const NationalityWidget(),
                              SizedBox(height: 10.h),
                              GestureDetector(
                               onTap: (){
                                 AppSheets.showBottomSheet(context,
                                     child: const RoomsAndGuestsView());
                               },
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      border: Border.all(
                                          color: ColorManager.lightPrimaryColor),
                                      borderRadius: BorderRadius.circular(12.r)),
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppPadding.p16.h,
                                      horizontal: AppPadding.p16.w),
                                  child: CustomText(
                                      text: context
                                          .watch<AddRoomProvider>()
                                          .totalNumbers,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: ColorManager.primaryColor)),
                                ),
                              ),
                            ],
                          )),
                      CustomButton(
                        backgroundColor: ColorManager.orangeColor,
                        onTap: () {
                         /* AppSheets.showBottomSheet(context,
                              child: const RoomsAndGuestsView());*/
                        },
                        buttonText: AppStrings.findHotels,
                        icon: Icons.search,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
