import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';

import '../../../update_feature/presentation/views/update_feature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EditSlidable extends StatelessWidget {
  const EditSlidable({
    super.key, required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (val){
        Navigator.pushNamed(context, UpdateScreen.id,arguments: taskModel);
      },
      padding: EdgeInsets.zero,
      backgroundColor: const Color(0xFF21B7CA),
      foregroundColor: Colors.white,
      icon: Icons.edit,
      label: AppLocalizations.of(context)!.edit,
    );
  }
}