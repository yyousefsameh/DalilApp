import 'history_model_list_data.dart';

class HistoryModel {
  bool? statue;
  List<HistoryModelListData>? data;

  HistoryModel({this.statue, this.data});

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        statue: json['statue'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map(
                (e) => HistoryModelListData.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'statue': statue,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
