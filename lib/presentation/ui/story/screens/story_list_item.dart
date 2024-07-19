import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:story_scene/core/other/general_utils.dart';
import 'package:story_scene/domain/model/response/story_response.dart';
import 'package:story_scene/presentation/theme/app_string.dart';
import 'package:story_scene/presentation/theme/app_style.dart';
import 'package:story_scene/presentation/ui/scene/screens/scene_screen.dart';

import '../../../../core/other/date_formatter.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';
import '../provider/story_provider.dart';

class StoryListItem extends StatefulWidget {
  Story? story;
    StoryListItem({super.key,this.story});

  @override
  State<StoryListItem> createState() => _StoryListItemState();
}

class _StoryListItemState extends State<StoryListItem> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context1,constraints) {
        return Column(
          children: [
            Expanded(
              child: Container(

                padding: const EdgeInsets.symmetric(vertical: AppDimen.mainVerticalPadding,horizontal: AppDimen.mainHorizontalPadding),
                width: 250,
                child: Column(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: AppString.publishedDateText,
                            style: AppStyles().smallDescStyle(AppColors.grayTextColor),
                            children: [
                          TextSpan(
                              text: DateFormatters.formatterDDMMYYHalfMonth.format(DateTime.fromMillisecondsSinceEpoch(widget.story!.createdAt!.millisecondsSinceEpoch)),
                              style: AppStyles().smallDescBoldStyle(Colors.black))
                        ])),
                    const SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                          height: 230,
                          width: 230,
                          fit: BoxFit.fill,
                          "${widget.story!.coverImage}"),
                    ),
                    const SizedBox(height: 5),
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: AppDimen.mainVerticalPadding,horizontal: AppDimen.mainHorizontalPadding),

                decoration: const BoxDecoration(
                    color: AppColors.cardBgColor,
                    borderRadius: BorderRadius.only(topLeft:  Radius.circular(AppDimen.cardCornerRadius),topRight:  Radius.circular(AppDimen.cardCornerRadius))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppString.descriptionText,style: AppStyles().placeHolderStyle(Colors.black),),
                      Text(
                        widget.story?.coverDescription ?? "Lorem Ipsum",
                        style: AppStyles().descriptionStyle(AppColors.descriptionColor),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          Expanded(child: ElevatedButton(onPressed: () async {
                            await Provider.of<StoryProvider>(context, listen: false).resetSceneList();

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SceneScreen(story: widget.story,)));
                  
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SceneScreen(story: widget.story,)));
                          },style: AppStyles().mainLargeButtonStyle(), child: const Text(AppString.readStoryText),)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
