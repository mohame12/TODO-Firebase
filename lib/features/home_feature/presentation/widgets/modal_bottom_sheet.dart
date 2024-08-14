import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';
import '../../../../core/widgets/custom_tff.dart';
import '../manger/create_task_cubit/modal_sheet_cubit.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ModalSheetCubit(),
      child: BlocBuilder<ModalSheetCubit, ModalSheetState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<ModalSheetCubit>(context);
          return Padding(
            padding: EdgeInsetsDirectional.only(
                start: 40,
                end: 40,
                top: 22,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.addNewTask,
                    style: MyStyle.textStyle18,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  CustomTff(
                    textEditingController: cubit.titleController,
                    obSecureText: false,
                    label: AppLocalizations.of(context)!.title,
                    borderColor: greyColor,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  CustomTff(
                    textEditingController: cubit.discribeController,
                    obSecureText: false,
                    label: AppLocalizations.of(context)!.discribtion,
                    borderColor: greyColor,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.selectTime,
                        style: MyStyle.textStyle20,
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        cubit.timePicker(context: context);
                      },
                      child: Text(
                        '${cubit.selectedDate}'.substring(0,10),
                        style: MyStyle.textStyle18.copyWith(color: greyColor),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: whiteColor, width: 2)),
                    onPressed: () {
                      cubit.createTask(context: context);
                    },
                    child: const Icon(
                      FontAwesomeIcons.check,
                      color: whiteColor,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
