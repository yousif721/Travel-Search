import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/component/custom_text_field.dart';
import '../../../../core/resources/resources.dart';
import '../../view_model/date_range_view_model.dart';

class DateRangeComponent extends StatelessWidget {
  const DateRangeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DateRangeProvider>(builder: (_, data, ch) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(color: ColorManager.lightPrimaryColor),
            borderRadius: BorderRadius.circular(12.r)),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        child: CustomTextField(
          textAlign: TextAlign.center,
          hintText: AppStrings.selectDateRange.toUpperCase(),
          onTap: () async {
            DateTimeRange? newDateTimeRange = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2023, 11, 15),
                lastDate: DateTime(2025, 11, 15),
                initialDateRange: DateTimeRange(
                  start: DateTime(2023, 11, 15),
                  end: DateTime(2025, 11, 15),
                ));

            if (newDateTimeRange == null) return;

            data.updateDateRange(newDateTimeRange);
          },
          readOnly: true,
          controller: data.dateRangeTextField,
        ),
      );
    });
  }
}
