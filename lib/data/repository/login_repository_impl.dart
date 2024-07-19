import 'package:story_scene/core/other/resource.dart';
import 'package:story_scene/domain/model/response/login_user_response.dart';
import 'package:story_scene/domain/repository/login_repository.dart';

import '../../core/api_service/api_service.dart';
import 'dart:io' show Platform;

import '../../core/other/general_utils.dart';

class LoginRepositoryImpl extends LoginRepository{

  //Method to make Login API request
  @override
  Future<Resource<LoginUserResponse>> loginRequest() async {
    try {

      final response = await ApiService().request(
          'auth/login',
          DioMethod.post,
          contentType: 'application/json',
          param: {'story_id': "65cf02d0acc51c6b7795e060", 'device_type': platformString(),"device_id":"Prince","device_token":"helgdsgsdgs"},
      );
      if (response.statusCode == 202) {
        print('API call successful: ${response.data}');

        LoginUserResponse loginUserResponse = LoginUserResponse.fromJson(response.data);


        return Resource.success(data: loginUserResponse);
      } else {
        print('API call failed: ${response.statusMessage}');
        return Resource.failure(message: response.statusMessage);

      }
    } catch (e) {
      print('Network error occurred: $e');
      return Resource.failure(message: e.toString());

    }
  }

}