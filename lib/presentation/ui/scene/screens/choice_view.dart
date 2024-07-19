import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/presentation/ui/scene/provider/scene_provider.dart';

import '../../../../domain/model/response/story_response.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_style.dart';
class ChoiceView extends StatefulWidget {
  ChoiceChoice? sceneChoice;
  int? index;
   ChoiceView({super.key,this.sceneChoice,this.index});

  @override
  State<ChoiceView> createState() => _ChoiceViewState();
}

class _ChoiceViewState extends State<ChoiceView> {
  @override
  Widget build(BuildContext context) {
    return                     GestureDetector(
      onTap: (){
        Provider.of<SceneProvider>(context,listen: false).selectChoice(widget.index!);

      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
        decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)),border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.sceneChoice!.title.toString(),style: AppStyles().smallDescStyle(Colors.black),),
            Consumer<SceneProvider>(
              builder: (context,provider,child) {
                return Radio(value: widget.index, activeColor: AppColors.mainButtonColor,groupValue: provider.getScene()?.choice?.first.choices?.indexWhere((choice) => choice.isSelected!), onChanged: (value){
                  // provider.selectChoice(widget.index!);

                });
              }
            )

          ],
        ),
      ),
    )
    ;
  }
}
