import 'package:flutter/material.dart';
import 'package:todo2/core/utils/my_assets.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo2/features/auth_features/presentation/views/login.dart';
import '../../../home_feature/presentation/views/home_screen.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({
    super.key,
  });

  @override
  State<SplashBody> createState() => _SplashBodyState();
}
class _SplashBodyState extends State<SplashBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset>slideAnimation;
  @override
  void initState() {
    super.initState();
    animationControl();
    timeOut();
  }

  void animationControl() {
    animationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
    slideAnimation=Tween<Offset>(end: Offset.zero,begin:Offset(2,0) ).animate(animationController);
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          const Image(image: AssetImage(AssetData.splashLogo)),
          AnimatedBuilder(
            builder: (context,_) {
              return SlideTransition(position: slideAnimation,
              child:  Text(AppLocalizations.of(context)!.addSomeTasks,textAlign: TextAlign.center,style: MyStyle.textStyle18.copyWith(color: greyColor,fontWeight:FontWeight.w900),));
            }, animation: slideAnimation,
          )
        ],
      ),
    );
  }

  void timeOut() {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, LoginScreen.id);
    });
  }
}