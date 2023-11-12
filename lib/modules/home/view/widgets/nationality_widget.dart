import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/component/custom_drop_down_field.dart';
import '../../../../core/component/custom_text.dart';
import '../../../../core/resources/resources.dart';
import '../../view_model/nationalities_view_model.dart';

class NationalityWidget extends StatelessWidget {
  const NationalityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Consumer<NationalitiesProvider>(
        builder: (_, data, ch) {
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorManager.white,
                border: Border.all(
                    color: ColorManager.lightPrimaryColor),
                borderRadius:
                BorderRadius.circular(12.r)),
            padding: EdgeInsets.symmetric(
                vertical: 5.h, horizontal: 5.w),
            child: CustomDropDownField<String>(
              value: data.selectedNationalities,
              hintText: AppStrings.selectNationality,
              onChanged: (newValue) {
                data.updateNationality(newValue);
              },
              items: data.nationalitiesList?.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: CustomText(
                        text: value,
                      ),
                    );
                  }).toList(),
            ),
          );
        });
  }
}
