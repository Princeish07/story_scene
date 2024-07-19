import 'package:story_scene/core/other/resource.dart';
import 'package:story_scene/domain/model/response/story_response.dart';

abstract class StoryRepository{

  Future<Resource<StoryResponse>> fetchStory();
}