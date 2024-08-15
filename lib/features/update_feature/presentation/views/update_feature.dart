import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo2/core/widgets/custom_tff.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';
import 'package:todo2/features/home_feature/presentation/manger/update_task/update_tasks_cubit.dart';
import '../../../../core/utils/my_color.dart';
import '../../../home_feature/presentation/widgets/update_time_selection.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});
  static const String id = 'UpdateScreen';

  @override
  Widget build(BuildContext context) {
    TaskModel model = ModalRoute.of(context)!.settings.arguments as TaskModel;
    TextEditingController updateTitle =
        TextEditingController(text: model.title);
    TextEditingController updateDiscribe =
        TextEditingController(text: model.subTitle);
    updateTitle.addListener(() {
      model.title = updateTitle.text;
    });
    updateDiscribe.addListener(() {
      model.subTitle = updateDiscribe.text;
    });
    return BlocProvider(
      create: (context) => UpdateTasksCubit(),
      child: BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<UpdateTasksCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.taskUpdate,
                style: MyStyle.textStyle22,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: double.infinity,
                        color: blueColor,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 50, horizontal: 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Card(
                              child: Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 40,
                              end: 40,
                              top: 22,
                            ),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.editTask,
                                    style: MyStyle.textStyle18.copyWith(color: greyColor),
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  CustomTff(
                                    textEditingController: updateTitle,
                                    obSecureText: false,
                                    label: AppLocalizations.of(context)!.title,
                                    borderColor: greyColor,
                                  ),
                                  const SizedBox(
                                    height: 27,
                                  ),
                                  CustomTff(
                                    textEditingController: updateDiscribe,
                                    obSecureText: false,
                                    label: AppLocalizations.of(context)!
                                        .discribtion,
                                    borderColor: greyColor,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .selectTime,
                                        style: MyStyle.textStyle20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  UpdateTimeSelection(model: model),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      onPressed: () {
                                        model.title = updateTitle.text;
                                        model.subTitle = updateDiscribe.text;
                                        model.date = state is UpdateTime
                                            ? cubit.selectedDate
                                                .millisecondsSinceEpoch
                                            : model.date;
                                        cubit.updateTask(task: model);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .saveChanges,
                                          style: MyStyle.textStyle18
                                              .copyWith(color: whiteColor),
                                        ),
                                      )),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
