import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_scene/core/other/general_utils.dart';
import 'package:story_scene/domain/model/response/login_user_response.dart';
import 'package:story_scene/domain/repository/login_repository.dart';
import 'package:story_scene/presentation/ui/story/screens/story_screen.dart';

import '../../../../core/api_service/api_service.dart';
import '../../../../core/other/resource.dart';
import '../../../../core/shared_pref/shared_pref_key.dart';
import '../../../../core/shared_pref/shared_preference.dart';

class LoginProvider extends ChangeNotifier{
  LoginRepository? repository;
  Resource<LoginUserResponse>? loginUserResponse;
  LoginProvider({this.repository});

  //Method to make Login Api request
  Future<void> makeLoginRequest(BuildContext context) async {
    try {
      loginUserResponse = Resource.loading();
      notifyListeners();
      loginUserResponse =  await repository?.loginRequest();
      if(loginUserResponse?.data?.statusCode==202){
        await PreferenceUtils.setString(
            SharedPrefKey.userToken, loginUserResponse!.data!.result!.token.toString());
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const StoryScreen()));

        showToast("Logged In Successfully");
      }
      notifyListeners();


    } catch (e) {
      loginUserResponse = Resource.failure(message: "Something went wrong: $e");
      notifyListeners();

    }

  }
}