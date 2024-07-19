import 'package:flutter/cupertino.dart';
import 'package:story_scene/presentation/ui/stats/screens/stats_list.dart';

class TopList {
  String? title;
  bool? isSelected;
  Widget? screen;

  TopList({this.title, this.isSelected, this.screen});
}

class StatsProvider extends ChangeNotifier {
  //Variables
  List<TopList> topList = [
    TopList(title: "Statitics", isSelected: true, screen: const StatsList()),
    TopList(
        title: "Reputation",
        isSelected: false,
        screen: const Center(
          child: Text("Reputation"),
        )),
    TopList(
        title: "Inventory",
        isSelected: false,
        screen: const Center(
          child: Text("Inventory"),
        ))
  ];

  //Method to update and select the top items
  selectedTopItem(TopList? item) {
    for (int i = 0; i < topList.length; i++) {
      if (topList[i] == item) {
        topList[i].isSelected = true;
      } else {
        topList[i].isSelected = false;
      }
    }
    notifyListeners();
  }
}
