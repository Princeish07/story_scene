import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/presentation/common_widgets/common_loader.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
import 'package:story_scene/presentation/theme/app_style.dart';
import 'package:story_scene/presentation/ui/login/provider/login_provider.dart';

import '../../../../core/other/resource.dart';
import '../../../common_widgets/common_error_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Consumer<LoginProvider>(
      builder: (context,loginProvider,child) {
        if(loginProvider.loginUserResponse?.status==Status.LOADING){
          return  CommonLoader();
        }else if(loginProvider.loginUserResponse?.status==Status.FAILURE) {
          return ErrorScreen(message: loginProvider.loginUserResponse?.message);
        }else {
          return Container(
            color: AppColors.mainBgColor,
            child: Center(
              child: ElevatedButton(
                child: Text("Login Now"), onPressed: () async {
                await loginProvider
                    .makeLoginRequest(context);
              }, style: AppStyles().mainButtonStyle(),),
            ),
          );
        }
      }
    );
  }
}
