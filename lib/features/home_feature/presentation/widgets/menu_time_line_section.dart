import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';

class TimeLineSection extends StatelessWidget {
  const TimeLineSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: double.infinity,
          color: blueColor,
        ),
        EasyDateTimeLine(
          headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
              centerHeader: false,
              monthStyle: TextStyle(color: whiteColor),
              selectedDateStyle: TextStyle(color: whiteColor)
          ),

          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          activeColor: whiteColor,
          dayProps: EasyDayProps(
              activeDayStyle: DayStyle(dayNumStyle: MyStyle.textStyle15.copyWith(color: blueColor,fontSize: 20),
                  dayStrStyle: MyStyle.textStyle15.copyWith(color: blueColor,fontWeight: FontWeight.normal),
                  monthStrStyle: MyStyle.textStyle15.copyWith(color: blueColor,fontWeight: FontWeight.normal),
                  decoration: BoxDecoration(color: whiteColor,
                      borderRadius: BorderRadius.circular(18))
              ),
              inactiveDayStyle: DayStyle(dayNumStyle: MyStyle.textStyle15.copyWith(color: blackColor,fontSize: 20),
                  dayStrStyle: MyStyle.textStyle15.copyWith(color: blackColor,fontWeight: FontWeight.normal),
                  monthStrStyle: MyStyle.textStyle15.copyWith(color: blackColor,fontWeight: FontWeight.normal),
                  decoration: BoxDecoration(color: whiteColor,
                      borderRadius: BorderRadius.circular(18))
              )
          ),

          locale: "ar",
        ),
      ],

    );
  }
}