import 'package:budget/domain/model/remote/base_model.dart';

class CategoryRemoteModel implements BaseModel {
  final String? name;
  final String? type;
  final int? total;
  final double? amount;

  CategoryRemoteModel({this.name, this.type, this.total, this.amount});

  factory CategoryRemoteModel.fromJson(Map<String, dynamic> json) =>
      CategoryRemoteModel(
          name: json["name"],
          type: json["type"],
          total: json["total"],
          amount: json["amount"]);

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "total": total,
        "amount": amount,
      };
}
