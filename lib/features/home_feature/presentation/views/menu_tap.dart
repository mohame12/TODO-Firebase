import 'package:flutter/material.dart';
import '../../../../core/utils/my_style.dart';
import '../widgets/menu_time_line_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/tasks_list_view.dart';
class MenuTap extends StatelessWidget {
  const MenuTap({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.toDoList, style: MyStyle.textStyle22,),
      ),
      body:  const Column(
        children: [
          TimeLineSection(),
          TaskListView(),
        ],
      ),
    );
  }
}






