import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:story_scene/core/shared_pref/shared_pref_key.dart';
import 'package:story_scene/presentation/theme/app_assets.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
import 'package:story_scene/presentation/ui/login/screen/login_screen.dart';
import 'package:story_scene/presentation/ui/story/screens/story_screen.dart';

import '../../../../core/shared_pref/shared_preference.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
    var value = await  PreferenceUtils.getString(SharedPrefKey.userToken);

    if(value.isNotEmpty){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const StoryScreen()),
      );
    }else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
    });
    return Container(
      color: AppColors.mainBgColor,
      child: Center(
        child: SvgPicture.asset(AppAssets.icSplashLogo),
      ),
    );
  }
}
