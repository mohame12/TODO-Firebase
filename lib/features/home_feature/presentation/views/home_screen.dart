import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/home_feature/presentation/manger/nav_cubit/nav_cubit.dart';
import 'package:todo2/features/home_feature/presentation/widgets/nav.dart';
import '../widgets/fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, NavState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<NavCubit>(context);
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomAppBar(
              notchMargin: 8,
              child: NAV(cubit: cubit)),
          floatingActionButton:  FAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: cubit.navBodyLis[cubit.index],
        );
      },
    );
  }
}




