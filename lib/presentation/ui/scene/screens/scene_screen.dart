import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/presentation/theme/app_dimen.dart';
import 'package:story_scene/presentation/ui/scene/provider/scene_provider.dart';
import 'package:story_scene/presentation/ui/scene/screens/scene_list_item.dart';
import 'package:story_scene/presentation/ui/stats/screens/stats_screen.dart';

import '../../../../core/other/general_utils.dart';
import '../../../../core/other/resource.dart';
import '../../../../domain/model/response/story_response.dart';
import '../../../common_widgets/app_bar.dart';
import '../../../common_widgets/common_error_screen.dart';
import '../../../common_widgets/common_loader.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_style.dart';
import '../../story/provider/story_provider.dart';
import 'cardWithNumber.dart';
class SceneScreen extends StatefulWidget {
  Story? story;

   SceneScreen({super.key,this.story});

  @override
  State<SceneScreen> createState() => _SceneScreenState();
}

class _SceneScreenState extends State<SceneScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      List<Scene>? sceneList = await Provider.of<StoryProvider>(context,listen: false).sceneList;
     await Provider.of<SceneProvider>(context,listen: false).setSceneList(sceneList: sceneList);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer2<StoryProvider,SceneProvider>(
        builder: (context,provider,sceneProvider,child) {
          if(sceneProvider.getSceneList()==null || sceneProvider.getSceneList()!.isEmpty) {
          return LayoutBuilder(
            builder: (context,constraints) {
              return CommonLoader(constraints: constraints,);
            }
          );
          }else {
            return Scaffold(
              body:
              LayoutBuilder(
                  builder: (context,constraints) {
                    return SingleChildScrollView(
                      child: Container(
                        color: AppColors.mainBgColor,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            CommonAppBar(enableStates: true,onStatsClick: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>StatsScreen()));
                            },centerTitle: true,),
                            if(provider.storyResponse?.status==Status.LOADING)...[

                              //Common Loader
                              CommonLoader(constraints: constraints,)
                            ]
                            else if(provider.storyResponse?.status==Status.FAILURE)...[

                              //Error UI
                              ErrorScreen(message: provider.storyResponse?.message,constraints: constraints,)
                            ] else ...[

                              //Main UI
                              const SizedBox(height: 5,),
                              Text(
                                widget.story!.coverTitle!,
                                style: AppStyles().mainTitleStyle(Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                capitalize(widget.story!.creatorName!.first.name!) ?? "J. K. Rowling",
                                style: AppStyles().descriptionStyle(AppColors.authorNameTextColor),
                                textAlign: TextAlign.center,
                              ),


                              const SizedBox(height: 5,),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: AppDimen.mainHorizontalPadding),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: widget.story!.baseline!.map((e){
                                    return Expanded(child: CardWithNumber(number: e.value.toString(),type: e.title,));

                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 5),


                              Consumer<SceneProvider>(
                                  builder: (context,sceneProvider,child) {
                                    return SizedBox(
                                      height: constraints.maxHeight * 1-200, // Adjust height as needed

                                      child: SceneListItem(scene: sceneProvider.getSceneList()?.first,),

                                    );
                                  }
                              ),
                            ]



                          ],
                        ),
                      ),
                    );
                  }
              ),
            );

          }
        }
    );
  }
}
