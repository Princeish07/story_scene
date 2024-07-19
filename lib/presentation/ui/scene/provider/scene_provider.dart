
import 'package:flutter/cupertino.dart';

import '../../../../core/other/general_utils.dart';
import '../../../../domain/model/response/story_response.dart';

class SceneProvider extends ChangeNotifier{

//region Variables
  int selectedIndex = 0;
Scene? _scene;
List<Scene>? _sceneList = [];
//endregion

//region Getter Setter Methods
  setScene({Scene? scene}){
  _scene = scene;
  notifyListeners();
}

Scene? getScene(){
  return _scene;
}

setSceneList({List<Scene>? sceneList}){
  _sceneList = sceneList;
  notifyListeners();
}

List<Scene>? getSceneList(){
  return _sceneList;
}
//endregion

//Method to select choice radio button
void selectChoice(int index) {
  if (_scene?.choice?.isNotEmpty == true) {
    for (var choice in _scene!.choice!.first.choices!) {
      choice.isSelected = false; // Deselect all choices
    }
    _scene!.choice!.first.choices![index].isSelected = true; // Select the chosen item
    notifyListeners();
  }
}

//Method to update scene
updateScene({int? index}){
  _scene = _sceneList?[index!];
  notifyListeners();
}

//Method to call on Next button Click
onNextClick({Function()? moveBack,Function()? validation}){
  if(_scene?.deathScreen==true){
    moveBack!();
    return;
  }

  bool isAnySelected = _scene!.choice!.first.choices?.any((element) => element.isSelected == true) ?? false;

  if (!isAnySelected) {
    validation!();
    return;
  }
 ChoiceChoice? choice = _scene!.choice!.first.choices?.firstWhere((element){return element.isSelected==true;});


 var mainBaselineId  = choice?.condition?.variable?.baselineId;
 var statsSetId  = choice?.condition?.variable?.statsetId;


 if(mainBaselineId?.isNotEmpty==true){
  if( findMainBaselineIdInTrueAndFalseOutcome(mainId: mainBaselineId,isBaseline: true)){
    updateScene(index: choice?.condition?.variable?.trueLinkedSceneIndex);
  }else{
    updateScene(index: choice?.condition?.variable?.falseLinkedSceneIndex);

  }

  }else if(statsSetId?.isNotEmpty==true) {
   if( findMainBaselineIdInTrueAndFalseOutcome(mainId: mainBaselineId,isBaseline: true)){
     updateScene(index: choice?.condition?.variable?.trueLinkedSceneIndex);
   }else{
     updateScene(index: choice?.condition?.variable?.falseLinkedSceneIndex);

   }

 }
}


//Method to logic to move to next screen
bool findMainBaselineIdInTrueAndFalseOutcome({String? mainId, bool? isBaseline}){
  ChoiceChoice? choice = _scene!.choice!.first.choices?.firstWhere((element){return element.isSelected==true;});
  var isTrueOutCome = false;

  if(isBaseline==true) {
    if (mainId == choice?.condition?.variable?.trueOutcome?.first.baselineId) {
      if(checkOperator(a:choice?.condition?.variable?.value, b:choice?.condition?.variable?.trueOutcome?.first.value,operator:choice?.condition?.variable?.variableOperator )){
        isTrueOutCome = true;
      }else{
        isTrueOutCome = false;

      }

    }else if(mainId == choice?.condition?.variable?.falseOutcome?.first.baselineId) {

      if(checkOperator(a:choice?.condition?.variable?.value, b:choice?.condition?.variable?.falseOutcome?.first.value,operator:choice?.condition?.variable?.variableOperator )){
        isTrueOutCome = true;
      }else{
        isTrueOutCome = false;

      }
    }
  }else {
    if (mainId == choice?.condition?.variable?.trueOutcome?.first.statsetId) {
      if(checkOperator(a:choice?.condition?.variable?.value, b:choice?.condition?.variable?.trueOutcome?.first.value,operator:choice?.condition?.variable?.variableOperator )){
        isTrueOutCome = true;
      }else{
        isTrueOutCome = false;

      }
    }else if(mainId == choice?.condition?.variable?.falseOutcome?.first.statsetId) {
      if(checkOperator(a:choice?.condition?.variable?.value, b:choice?.condition?.variable?.falseOutcome?.first.value,operator:choice?.condition?.variable?.variableOperator )){
        isTrueOutCome = true;
      }else{
        isTrueOutCome = false;

      }

    }
  }
  return isTrueOutCome;

}

}