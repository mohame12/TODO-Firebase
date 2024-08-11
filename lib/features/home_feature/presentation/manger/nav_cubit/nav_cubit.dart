
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../views/menu_tap.dart';
import '../../views/setting_tap.dart';

part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavInitial());

  int index=0;
  List<BottomNavigationBarItem>navItemsList=[
    const BottomNavigationBarItem(icon: Icon(Icons.list),label: ''),
    const BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
  ];

  List<Widget> navBodyLis=[
    const MenuTap(),
    const SettingTap(),
  ];
  onTap(int indx)
  {
    index=indx;
    emit(NavChange());
  }


}
