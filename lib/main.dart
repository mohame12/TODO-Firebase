import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo2/core/utils/my_theme.dart';
import 'package:todo2/features/auth_features/presentation/views/login.dart';
import 'package:todo2/features/auth_features/presentation/views/register.dart';
import 'package:todo2/features/home_feature/presentation/manger/get_tasks/get_tasks_cubit.dart';
import 'package:todo2/features/home_feature/presentation/manger/nav_cubit/nav_cubit.dart';
import 'package:todo2/features/home_feature/presentation/views/home_screen.dart';
import 'package:todo2/features/update_feature/presentation/views/update_feature.dart';
import 'core/shared_pref/shared_pref.dart';
import 'core/utils/bloc_observer.dart';
import 'features/home_feature/presentation/manger/settings_cubit/settings_cubit.dart';
import 'features/splash_feature/presentation/views/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  UserDataFromStorage.getData();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavCubit(),),
        BlocProvider(create: (context) =>
        GetTasksCubit()
          ..lineTimeSelectedDate(DateTime.now())),
        BlocProvider(create: (context) => SettingsCubit()..lastLanguage()..lastTheme(),)
      ],
      child: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'), // English
              Locale('ar'), // Spanish
            ],
            locale: BlocProvider
                .of<SettingsCubit>(context)
                .isAr ? Locale('ar') : Locale('en'),


            theme:BlocProvider.of<SettingsCubit>(context).isLight? MyTheme.light:MyTheme.dark,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.id,
            routes: {
              SplashScreen.id: (context) => const SplashScreen(),
              HomeScreen.id: (context) => const HomeScreen(),
              UpdateScreen.id: (context) => UpdateScreen(),
              LoginScreen.id: (context) => const LoginScreen(),
              RegisterScreen.id: (context) => const RegisterScreen(),
            },
          );
        },
      ),
    );
  }
}
