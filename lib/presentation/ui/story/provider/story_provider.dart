import 'package:flutter/cupertino.dart';
import 'package:story_scene/core/other/resource.dart';
import 'package:story_scene/domain/model/response/StatsModel.dart';
import 'package:story_scene/domain/model/response/story_response.dart';
import 'package:story_scene/presentation/ui/scene/screens/scene_list_item.dart';

import '../../../../domain/repository/story_repository.dart';
import '../screens/story_list_item.dart';

class StoryProvider extends ChangeNotifier {
  //region Variables
  Resource<StoryResponse>? storyResponse;
  List<StoryListItem>? storyList = [];
  List<StatsModel>? statsList = [];
  List<Item>? itemList = [];
  List<Scene>? sceneList = [];
  StoryRepository? storyRepository;
  StoryProvider({this.storyRepository});
  //endregion

  //Method to fetch Story and scene from api
  Future<void> fetchStory() async {
    try {
      storyResponse = Resource.loading();
      notifyListeners();
      storyResponse = await storyRepository?.fetchStory();
      storyList?.clear();
      sceneList?.clear();
      itemList?.clear();

      storyResponse?.data?.result?.story?.forEach((story) {
        storyList?.add(StoryListItem(story: story));
      });
      storyResponse?.data?.result?.scene?.forEach((scene) {
        sceneList?.add(scene);
      });
      for (int i = 0; i < storyList!.length; i++) {
        for (int j = 0; j < storyList![i].story!.statSet!.length; j++) {
          if (storyList![i].story!.statSet![j].items != null &&
              storyList![i].story!.statSet![j].items!.isNotEmpty) {
            itemList?.addAll(storyList![i].story!.statSet![j].items!);
          }
        }
      }
      storyList;
      notifyListeners();
    } catch (e) {
      storyResponse =
          Resource.failure(message: "Something went wrong: ${e.toString()}");
      notifyListeners();
    }
  }

  //Method to reset Scene List
  resetSceneList() {
    sceneList?.first.choice?.first.choices?.forEach((element) {
      element.isSelected = false;
    });
    notifyListeners();
  }
}
