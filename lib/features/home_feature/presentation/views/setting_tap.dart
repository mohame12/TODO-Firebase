import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_style.dart';
import '../../../../core/utils/my_color.dart';
import '../widgets/selected_container.dart';
import '../widgets/title_of_selected_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingTap extends StatelessWidget {
  const SettingTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings,style: MyStyle.textStyle22,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            color: blueColor,
          ),
          TitleOfSelectedContainer(title:AppLocalizations.of(context)!.language,),
          SelectedContainer(contain: AppLocalizations.of(context)!.english,),
          TitleOfSelectedContainer(title:AppLocalizations.of(context)!.mode,),
          SelectedContainer(contain:AppLocalizations.of(context)!.light,)
        ],
      ),
    )
      ;
  }
}




