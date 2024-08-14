import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';

import '../widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle:  SystemUiOverlayStyle(
                statusBarIconBrightness:BlocProvider.of<SettingsCubit>(context).isLight?Brightness.light:Brightness.light,
                statusBarColor:BlocProvider.of<SettingsCubit>(context).isLight? scaffoldColor:darkScaffold
            ),
          ),
          body: const SplashBody(),
        );
      },
    );
  }
}


