import 'dart:convert';

GPTData gptDataFromJson(String str) => GPTData.fromJson(json.decode(str));

String gptDataToJson(GPTData data) => json.encode(data.toJson());

class GPTData {
  String id;
  String object;
  int created;
  String model;
  List<ChoiceData> choices;
  UsageData usage;

  GPTData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory GPTData.fromJson(Map<String, dynamic> json) => GPTData(
        id: json["id"],
        object: json["object"],
        created: json["created"],
        model: json["model"],
        choices: List<ChoiceData>.from(json["choices"].map(
          (x) => ChoiceData.fromJson(x),
        )),
        usage: UsageData.fromJson(json["usage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}

class ChoiceData {
  String text;
  int index;
  dynamic logProbs;
  dynamic finishReason;

  ChoiceData({
    required this.text,
    required this.index,
    required this.logProbs,
    required this.finishReason,
  });

  factory ChoiceData.fromJson(Map<String, dynamic> json) => ChoiceData(
        text: json["text"],
        index: json["index"],
        logProbs: json["logprobs"],
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "index": index,
        "logprobs": logProbs,
        "finish_reason": finishReason,
      };
}

class UsageData {
  int promptToken; 
  int completionToken; 
  int totalTokens; 

  UsageData({
    required this.promptToken,
    required this.completionToken,
    required this.totalTokens,
  });

  factory UsageData.fromJson(Map<String, dynamic> json) => UsageData(
        promptToken: json["prompt_tokens"],
        completionToken: json["completion_tokens"],
        totalTokens: json["total_tokens"],
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptToken,
        "completion_tokens": completionToken,
        "total_tokens": totalTokens,
      };
}