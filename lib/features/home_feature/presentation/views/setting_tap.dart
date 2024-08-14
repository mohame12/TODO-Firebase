import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';
import '../../../../core/utils/my_color.dart';
import '../widgets/selected_container.dart';
import '../widgets/title_of_selected_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTap extends StatelessWidget {
  const SettingTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<SettingsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.settings,
              style: MyStyle.textStyle22,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.1,
                width: double.infinity,
                color: blueColor,
              ),
              TitleOfSelectedContainer(
                title: AppLocalizations.of(context)!.language,
              ),
              GestureDetector(
                onTap: () {
                  cubit.onPressedLanguage(context: context);
                },
                child: BlocConsumer<SettingsCubit, SettingsState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return SelectedContainer(
                        contain: BlocProvider.of<SettingsCubit>(context).isAr?AppLocalizations.of(context)!.arabic:AppLocalizations.of(context)!.english);
                  },
                ),
              ),
              TitleOfSelectedContainer(
                title: AppLocalizations.of(context)!.mode,
              ),
              GestureDetector(
                onTap: () {
                  cubit.onPressedMode(context: context);
                },
                child: SelectedContainer(
                  contain: AppLocalizations.of(context)!.light,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
