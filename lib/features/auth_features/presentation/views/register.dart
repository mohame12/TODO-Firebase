import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/utils/my_assets.dart';
import '../../../../core/utils/my_style.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static const String id='RegisterScreen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
  builder: (context, state) {

    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(image:BlocProvider.of<SettingsCubit>(context).isLight?AssetImage(AssetData.loginBG):AssetImage(AssetData.loginBGDark),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.signIn,style:MyStyle.textStyle20.copyWith(fontWeight:FontWeight.w900) ,),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent
          ),
        ),
        body:  const RegisterBody(),
      ),
    );
  },
);
  }
}
