import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/component/custom_text.dart';
import '../../../../core/resources/resources.dart';
import '../../view_model/cities_view_model.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CitiesProvider>(builder: (_, data, ch) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius:
            BorderRadius.circular(12.r)),
        child: Container(
          margin: const EdgeInsets.all(6),
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(
              color: ColorManager.lightPrimaryColor,
            ),
            borderRadius: BorderRadius.circular(
              50.r,
            ),
          ),
          child: DropdownButton<String>(
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(
                color: ColorManager.primaryColor),
            value: data.selectedCity,
            icon: const SizedBox.shrink(),
            underline: const SizedBox(),
            hint: CustomText(
                text: AppStrings.selectCity,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(
                    color: ColorManager
                        .primaryColor)),
            items:
            data.citiesList?.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              data.updateCity(newValue);
            },
          ),
        ),
      );
    });
  }
}