import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';
import '../../../../core/utils/my_color.dart';
import 'modal_bottom_sheet.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: whiteColor, width: 2),
              borderRadius: BorderRadius.circular(30)),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor:BlocProvider.of<SettingsCubit>(context).isLight?whiteColor:darkScaffold,
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                context: context,
                builder: (context) => const ModalBottomSheet()
            );
          },
          child: const Icon(
            FontAwesomeIcons.plus,
            color: whiteColor,
          ),
        );
      },
    );
  }
}


