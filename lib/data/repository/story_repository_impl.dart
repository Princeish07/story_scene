 import 'package:story_scene/core/other/resource.dart';
import 'package:story_scene/core/shared_pref/shared_pref_key.dart';
import 'package:story_scene/core/shared_pref/shared_preference.dart';
import 'package:story_scene/domain/model/response/story_response.dart';
import 'package:story_scene/domain/repository/story_repository.dart';

import '../../core/api_service/api_service.dart';

class StoryRepositoryImpl extends StoryRepository{

  //Get Story/Scene method from API
  @override
  Future<Resource<StoryResponse>> fetchStory() async {
    try {
    var token =  await PreferenceUtils.getString(SharedPrefKey.userToken);
      final response = await ApiService().request(
        'user/getStory',
        DioMethod.get,
        contentType: 'application/json',isAuthenticationRequired: true,token: token
      );
      if (response.statusCode == 200) {
        print('API call successful: ${response.data}');

        StoryResponse storyResponse = StoryResponse.fromJson(response.data);


        return Resource.success(data: storyResponse);
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