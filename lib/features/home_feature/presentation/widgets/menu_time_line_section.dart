import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/home_feature/presentation/manger/get_tasks/get_tasks_cubit.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';

class TimeLineSection extends StatelessWidget {
  const TimeLineSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=BlocProvider.of<GetTasksCubit>(context);

    return BlocConsumer<SettingsCubit, SettingsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

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

          initialDate:cubit.dateNow ,
          onDateChange:cubit.lineTimeSelectedDate ,
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

          locale:BlocProvider.of<SettingsCubit>(context).isAr? "ar":"en",
        ),
      ],

    );
  },
);
  },
);
  }
}