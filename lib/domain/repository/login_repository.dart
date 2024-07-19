import 'package:story_scene/domain/model/response/login_user_response.dart';

import '../../core/other/resource.dart';

abstract class LoginRepository{
  Future<Resource<LoginUserResponse>> loginRequest();
}