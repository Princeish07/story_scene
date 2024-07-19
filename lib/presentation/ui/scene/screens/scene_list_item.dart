
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/presentation/common_widgets/common_loader.dart';
import 'package:story_scene/presentation/theme/app_colors.dart';
import 'package:story_scene/presentation/ui/scene/provider/scene_provider.dart';
import 'package:story_scene/presentation/ui/scene/screens/choice_view.dart';
import 'package:story_scene/presentation/ui/story/provider/story_provider.dart';

import '../../../../core/other/general_utils.dart';
import '../../../../domain/model/response/story_response.dart';
import '../../../theme/app_dimen.dart';
import '../../../theme/app_style.dart';

class SceneListItem extends StatefulWidget {
  Scene? scene;

  SceneListItem({super.key, this.scene});

  @override
  State<SceneListItem> createState() => _SceneListItemState();
}

class _SceneListItemState extends State<SceneListItem> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<SceneProvider>(context, listen: false).setScene(scene: widget.scene!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Consumer<SceneProvider>(
          builder: (context, provider, child) {
            if (provider.getScene() == null) {
              return CommonLoader(constraints: constraints);
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(minHeight: 150),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimen.mainVerticalPadding,
                        horizontal: AppDimen.mainHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Scene Title : ",
                            children: [
                              TextSpan(
                                text: "Chapter ${provider.getScene()?.sceneIndex.toString()}",
                                style: AppStyles().descriptionStyle(Colors.black),
                              ),
                            ],
                            style: AppStyles().placeHolderStyle(AppColors.placeHolderTextColor),
                          ),
                        ),
                        Text(
                          style: AppStyles().descriptionStyle(AppColors.descriptionColor),
                          removeHtmlTags(provider.getScene()!.description.toString()) ??
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimen.mainVerticalPadding,
                        horizontal: AppDimen.mainHorizontalPadding),
                    decoration: const BoxDecoration(
                      color: AppColors.cardBgColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppDimen.cardCornerRadius),
                        topRight: Radius.circular(AppDimen.cardCornerRadius),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (provider.getScene()?.choice?.isNotEmpty == true) ...[
                          Text(
                            "Make your choice",
                            style: AppStyles().placeHolderStyle(Colors.black),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider.getScene()?.choice?.first.choices?.length,
                            itemBuilder: (context, index) {
                              return ChoiceView(
                                sceneChoice: provider.getScene()?.choice?.first.choices?[index],
                                index: index,
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                        ],
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<SceneProvider>(context, listen: false).onNextClick(
                                    moveBack: () async {
                                      await Provider.of<StoryProvider>(context, listen: false).resetSceneList();
                                      Navigator.pop(context);
                                    },
                                    validation: (){
                                      showToast("Please select choice");
                                    }
                                  );
                                },
                                child: Text(
                                  "Next",
                                  style: AppStyles().smallDescBoldStyle(Colors.white),
                                ),
                                style: AppStyles().mainLargeButtonStyle(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      );
    });
  }
}
