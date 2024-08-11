import 'package:flutter/material.dart';

import '../manger/nav_cubit/nav_cubit.dart';

class NAV extends StatelessWidget {
  const NAV({
    super.key,
    required this.cubit,
  });
  final NavCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:cubit.navItemsList,
      currentIndex: cubit.index,
      onTap: cubit.onTap,
    );
  }
}