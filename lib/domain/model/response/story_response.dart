// To parse this JSON data, do
//
//     final storyResponse = storyResponseFromJson(jsonString);

import 'dart:convert';

StoryResponse storyResponseFromJson(String str) => StoryResponse.fromJson(json.decode(str));

String storyResponseToJson(StoryResponse data) => json.encode(data.toJson());

class StoryResponse {
  bool? success;
  int? statusCode;
  String? message;
  Result? result;
  int? time;

  StoryResponse({
    this.success,
    this.statusCode,
    this.message,
    this.result,
    this.time,
  });

  StoryResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Result? result,
    int? time,
  }) =>
      StoryResponse(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        result: result ?? this.result,
        time: time ?? this.time,
      );

  factory StoryResponse.fromJson(Map<String, dynamic> json) => StoryResponse(
    success: json["success"],
    statusCode: json["status_code"],
    message: json["message"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "message": message,
    "result": result?.toJson(),
    "time": time,
  };
}

class Result {
  List<Story>? story;
  List<Scene>? scene;

  Result({
    this.story,
    this.scene,
  });

  Result copyWith({
    List<Story>? story,
    List<Scene>? scene,
  }) =>
      Result(
        story: story ?? this.story,
        scene: scene ?? this.scene,
      );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    story: json["story"] == null ? [] : List<Story>.from(json["story"]!.map((x) => Story.fromJson(x))),
    scene: json["scene"] == null ? [] : List<Scene>.from(json["scene"]!.map((x) => Scene.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "story": story == null ? [] : List<dynamic>.from(story!.map((x) => x.toJson())),
    "scene": scene == null ? [] : List<dynamic>.from(scene!.map((x) => x.toJson())),
  };
}

class Scene {
  String? id;
  String? sceneName;
  String? storyId;
  int? sceneIndex;
  String? description;
  bool? deathScreen;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? creatorName;
  List<SceneChoice>? choice;

  Scene({
    this.id,
    this.sceneName,
    this.storyId,
    this.sceneIndex,
    this.description,
    this.deathScreen,
    this.createdAt,
    this.updatedAt,
    this.creatorName,
    this.choice,
  });

  Scene copyWith({
    String? id,
    String? sceneName,
    String? storyId,
    int? sceneIndex,
    String? description,
    bool? deathScreen,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? creatorName,
    List<SceneChoice>? choice,
  }) =>
      Scene(
        id: id ?? this.id,
        sceneName: sceneName ?? this.sceneName,
        storyId: storyId ?? this.storyId,
        sceneIndex: sceneIndex ?? this.sceneIndex,
        description: description ?? this.description,
        deathScreen: deathScreen ?? this.deathScreen,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        creatorName: creatorName ?? this.creatorName,
        choice: choice ?? this.choice,
      );

  factory Scene.fromJson(Map<String, dynamic> json) => Scene(
    id: json["_id"],
    sceneName: json["scene_name"],
    storyId: json["story_id"],
    sceneIndex: json["scene_index"],
    description: json["description"],
    deathScreen: json["death_screen"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    creatorName: json["creator_name"],
    choice: json["choice"] == null ? [] : List<SceneChoice>.from(json["choice"]!.map((x) => SceneChoice.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "scene_name": sceneName,
    "story_id": storyId,
    "scene_index": sceneIndex,
    "description": description,
    "death_screen": deathScreen,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "creator_name": creatorName,
    "choice": choice == null ? [] : List<dynamic>.from(choice!.map((x) => x.toJson())),
  };
}

class SceneChoice {
  String? id;
  String? sceneId;
  String? storyId;
  List<ChoiceChoice>? choices;
  DateTime? createdAt;
  DateTime? updatedAt;

  SceneChoice({
    this.id,
    this.sceneId,
    this.storyId,
    this.choices,
    this.createdAt,
    this.updatedAt,
  });

  SceneChoice copyWith({
    String? id,
    String? sceneId,
    String? storyId,
    List<ChoiceChoice>? choices,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      SceneChoice(
        id: id ?? this.id,
        sceneId: sceneId ?? this.sceneId,
        storyId: storyId ?? this.storyId,
        choices: choices ?? this.choices,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory SceneChoice.fromJson(Map<String, dynamic> json) => SceneChoice(
    id: json["_id"],
    sceneId: json["scene_id"],
    storyId: json["story_id"],
    choices: json["choices"] == null ? [] : List<ChoiceChoice>.from(json["choices"]!.map((x) => ChoiceChoice.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "scene_id": sceneId,
    "story_id": storyId,
    "choices": choices == null ? [] : List<dynamic>.from(choices!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class ChoiceChoice {
  String? title;
  Condition? condition;
  bool? isSelected;
  String? id;

  ChoiceChoice({
    this.title,
    this.condition,
    this.isSelected,
    this.id,
  });

  ChoiceChoice copyWith({
    String? title,
    Condition? condition,
    bool? isSelected,
    String? id,
  }) =>
      ChoiceChoice(
        title: title ?? this.title,
        condition: condition ?? this.condition,
        isSelected:  isSelected ?? this.isSelected,
        id: id ?? this.id,
      );

  factory ChoiceChoice.fromJson(Map<String, dynamic> json) => ChoiceChoice(
    title: json["title"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    isSelected: false,
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "condition": condition?.toJson(),
    "_id": id,
  };
}

class Condition {
  Variable? variable;

  Condition({
    this.variable,
  });

  Condition copyWith({
    Variable? variable,
  }) =>
      Condition(
        variable: variable ?? this.variable,
      );

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    variable: json["variable"] == null ? null : Variable.fromJson(json["variable"]),
  );

  Map<String, dynamic> toJson() => {
    "variable": variable?.toJson(),
  };
}

class Variable {
  String? baselineId;
  String? statsetId;
  String? itemId;
  String? variableOperator;
  int? value;
  int? trueLinkedSceneIndex;
  int? falseLinkedSceneIndex;
  List<EOutcome>? trueOutcome;
  List<EOutcome>? falseOutcome;

  Variable({
    this.baselineId,
    this.statsetId,
    this.itemId,
    this.variableOperator,
    this.value,
    this.trueLinkedSceneIndex,
    this.falseLinkedSceneIndex,
    this.trueOutcome,
    this.falseOutcome,
  });

  Variable copyWith({
    String? baselineId,
    String? statsetId,
    String? itemId,
    String? variableOperator,
    int? value,
    int? trueLinkedSceneIndex,
    int? falseLinkedSceneIndex,
    List<EOutcome>? trueOutcome,
    List<EOutcome>? falseOutcome,
  }) =>
      Variable(
        baselineId: baselineId ?? this.baselineId,
        statsetId: statsetId ?? this.statsetId,
        itemId: itemId ?? this.itemId,
        variableOperator: variableOperator ?? this.variableOperator,
        value: value ?? this.value,
        trueLinkedSceneIndex: trueLinkedSceneIndex ?? this.trueLinkedSceneIndex,
        falseLinkedSceneIndex: falseLinkedSceneIndex ?? this.falseLinkedSceneIndex,
        trueOutcome: trueOutcome ?? this.trueOutcome,
        falseOutcome: falseOutcome ?? this.falseOutcome,
      );

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
    baselineId: json["baseline_id"],
    statsetId: json["statset_id"],
    itemId: json["item_id"],
    variableOperator: json["operator"],
    value: json["value"],
    trueLinkedSceneIndex: json["true_linked_scene_index"],
    falseLinkedSceneIndex: json["false_linked_scene_index"],
    trueOutcome: json["true_outcome"] == null ? [] : List<EOutcome>.from(json["true_outcome"]!.map((x) => EOutcome.fromJson(x))),
    falseOutcome: json["false_outcome"] == null ? [] : List<EOutcome>.from(json["false_outcome"]!.map((x) => EOutcome.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "baseline_id": baselineId,
    "statset_id": statsetId,
    "item_id": itemId,
    "operator": variableOperator,
    "value": value,
    "true_linked_scene_index": trueLinkedSceneIndex,
    "false_linked_scene_index": falseLinkedSceneIndex,
    "true_outcome": trueOutcome == null ? [] : List<dynamic>.from(trueOutcome!.map((x) => x.toJson())),
    "false_outcome": falseOutcome == null ? [] : List<dynamic>.from(falseOutcome!.map((x) => x.toJson())),
  };
}

class EOutcome {
  String? baselineId;
  String? statsetId;
  String? itemId;
  Operator? eOutcomeOperator;
  int? value;
  String? id;

  EOutcome({
    this.baselineId,
    this.statsetId,
    this.itemId,
    this.eOutcomeOperator,
    this.value,
    this.id,
  });

  EOutcome copyWith({
    String? baselineId,
    String? statsetId,
    String? itemId,
    Operator? eOutcomeOperator,
    int? value,
    String? id,
  }) =>
      EOutcome(
        baselineId: baselineId ?? this.baselineId,
        statsetId: statsetId ?? this.statsetId,
        itemId: itemId ?? this.itemId,
        eOutcomeOperator: eOutcomeOperator ?? this.eOutcomeOperator,
        value: value ?? this.value,
        id: id ?? this.id,
      );

  factory EOutcome.fromJson(Map<String, dynamic> json) => EOutcome(
    baselineId: json["baseline_id"],
    statsetId: json["statset_id"],
    itemId: json["item_id"],
    eOutcomeOperator: operatorValues.map[json["operator"]]!,
    value: json["value"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "baseline_id": baselineId,
    "statset_id": statsetId,
    "item_id": itemId,
    "operator": operatorValues.reverse[eOutcomeOperator],
    "value": value,
    "_id": id,
  };
}

enum Operator {
  EMPTY,
  OPERATOR
}

final operatorValues = EnumValues({
  "-": Operator.EMPTY,
  "+": Operator.OPERATOR
});

class Story {
  String? id;
  String? creatorId;
  int? status;
  String? coverTitle;
  String? coverDescription;
  String? coverImage;
  int? threshold;
  List<Baseline>? baseline;
  List<StatSet>? statSet;
  bool? isPaid;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? requestedDate;
  int? sceneCount;
  int? amount;
  DateTime? approvedDate;
  int? freeScene;
  dynamic rejectReason;
  List<CreatorName>? creatorName;

  Story({
    this.id,
    this.creatorId,
    this.status,
    this.coverTitle,
    this.coverDescription,
    this.coverImage,
    this.threshold,
    this.baseline,
    this.statSet,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
    this.requestedDate,
    this.sceneCount,
    this.amount,
    this.approvedDate,
    this.freeScene,
    this.rejectReason,
    this.creatorName,
  });

  Story copyWith({
    String? id,
    String? creatorId,
    int? status,
    String? coverTitle,
    String? coverDescription,
    String? coverImage,
    int? threshold,
    List<Baseline>? baseline,
    List<StatSet>? statSet,
    bool? isPaid,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? requestedDate,
    int? sceneCount,
    int? amount,
    DateTime? approvedDate,
    int? freeScene,
    dynamic rejectReason,
    List<CreatorName>? creatorName,
  }) =>
      Story(
        id: id ?? this.id,
        creatorId: creatorId ?? this.creatorId,
        status: status ?? this.status,
        coverTitle: coverTitle ?? this.coverTitle,
        coverDescription: coverDescription ?? this.coverDescription,
        coverImage: coverImage ?? this.coverImage,
        threshold: threshold ?? this.threshold,
        baseline: baseline ?? this.baseline,
        statSet: statSet ?? this.statSet,
        isPaid: isPaid ?? this.isPaid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        requestedDate: requestedDate ?? this.requestedDate,
        sceneCount: sceneCount ?? this.sceneCount,
        amount: amount ?? this.amount,
        approvedDate: approvedDate ?? this.approvedDate,
        freeScene: freeScene ?? this.freeScene,
        rejectReason: rejectReason ?? this.rejectReason,
        creatorName: creatorName ?? this.creatorName,
      );

  factory Story.fromJson(Map<String, dynamic> json) => Story(
    id: json["_id"],
    creatorId: json["creator_id"],
    status: json["status"],
    coverTitle: json["cover_title"],
    coverDescription: json["cover_description"],
    coverImage: json["cover_image"],
    threshold: json["threshold"],
    baseline: json["baseline"] == null ? [] : List<Baseline>.from(json["baseline"]!.map((x) => Baseline.fromJson(x))),
    statSet: json["stat_set"] == null ? [] : List<StatSet>.from(json["stat_set"]!.map((x) => StatSet.fromJson(x))),
    isPaid: json["isPaid"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    requestedDate: json["requested_date"] == null ? null : DateTime.parse(json["requested_date"]),
    sceneCount: json["sceneCount"],
    amount: json["amount"],
    approvedDate: json["approved_date"] == null ? null : DateTime.parse(json["approved_date"]),
    freeScene: json["freeScene"],
    rejectReason: json["rejectReason"],
    creatorName: json["creator_name"] == null ? [] : List<CreatorName>.from(json["creator_name"]!.map((x) => CreatorName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "creator_id": creatorId,
    "status": status,
    "cover_title": coverTitle,
    "cover_description": coverDescription,
    "cover_image": coverImage,
    "threshold": threshold,
    "baseline": baseline == null ? [] : List<dynamic>.from(baseline!.map((x) => x.toJson())),
    "stat_set": statSet == null ? [] : List<dynamic>.from(statSet!.map((x) => x.toJson())),
    "isPaid": isPaid,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "requested_date": requestedDate?.toIso8601String(),
    "sceneCount": sceneCount,
    "amount": amount,
    "approved_date": approvedDate?.toIso8601String(),
    "freeScene": freeScene,
    "rejectReason": rejectReason,
    "creator_name": creatorName == null ? [] : List<dynamic>.from(creatorName!.map((x) => x.toJson())),
  };
}

class Baseline {
  String? title;
  int? value;
  bool? affectThreshold;
  String? id;

  Baseline({
    this.title,
    this.value,
    this.affectThreshold,
    this.id,
  });

  Baseline copyWith({
    String? title,
    int? value,
    bool? affectThreshold,
    String? id,
  }) =>
      Baseline(
        title: title ?? this.title,
        value: value ?? this.value,
        affectThreshold: affectThreshold ?? this.affectThreshold,
        id: id ?? this.id,
      );

  factory Baseline.fromJson(Map<String, dynamic> json) => Baseline(
    title: json["title"],
    value: json["value"],
    affectThreshold: json["affectThreshold"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "value": value,
    "affectThreshold": affectThreshold,
    "_id": id,
  };
}

class CreatorName {
  String? id;
  String? name;

  CreatorName({
    this.id,
    this.name,
  });

  CreatorName copyWith({
    String? id,
    String? name,
  }) =>
      CreatorName(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory CreatorName.fromJson(Map<String, dynamic> json) => CreatorName(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class StatSet {
  String? id;
  String? title;
  String? storyId;
  List<Item>? items;
  DateTime? createdAt;
  DateTime? updatedAt;

  StatSet({
    this.id,
    this.title,
    this.storyId,
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  StatSet copyWith({
    String? id,
    String? title,
    String? storyId,
    List<Item>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      StatSet(
        id: id ?? this.id,
        title: title ?? this.title,
        storyId: storyId ?? this.storyId,
        items: items ?? this.items,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory StatSet.fromJson(Map<String, dynamic> json) => StatSet(
    id: json["_id"],
    title: json["title"],
    storyId: json["story_id"],
    items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "story_id": storyId,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Item {
  String? name;
  int? value;
  bool? hidden;
  String? id;

  Item({
    this.name,
    this.value,
    this.hidden,
    this.id,
  });

  Item copyWith({
    String? name,
    int? value,
    bool? hidden,
    String? id,
  }) =>
      Item(
        name: name ?? this.name,
        value: value ?? this.value,
        hidden: hidden ?? this.hidden,
        id: id ?? this.id,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    value: json["value"],
    hidden: json["hidden"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "value": value,
    "hidden": hidden,
    "_id": id,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
