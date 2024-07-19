import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../theme/app_colors.dart';
import '../../../theme/app_dimen.dart';
import '../../../theme/app_string.dart';
import '../../../theme/app_style.dart';
import '../../story/provider/story_provider.dart';
class StatsList extends StatefulWidget {
  const StatsList({super.key});

  @override
  State<StatsList> createState() => _StatsListState();
}

class _StatsListState extends State<StatsList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              color: AppColors.cardBgColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimen.mainHorizontalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.variableText,
                      style: AppStyles().placeHolderStyle(Colors.black),
                    ),
                    Text(AppString.statsText,
                        style: AppStyles().placeHolderStyle(Colors.black))
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimen.mainHorizontalPadding) +
                      EdgeInsets.all(10),
        
                  child: Consumer<StoryProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                            itemCount: provider.itemList?.length,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      provider.itemList![index].name!,
                                      style: AppStyles()
                                          .descriptionStyle(Colors.black),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(":",
                                        style: AppStyles()
                                            .descriptionStyle(Colors.black),
                                        textAlign: TextAlign.start),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                        provider.itemList![index].value
                                            .toString(),
                                        style: AppStyles()
                                            .descriptionStyle(Colors.black),
                                        textAlign: TextAlign.start),
                                  )
                                ],
                              );
                            });
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
