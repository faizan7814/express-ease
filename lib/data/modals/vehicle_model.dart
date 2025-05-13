import 'package:express_ease/data/modals/serializable.dart';

class VehicleModel extends Serializable {
  int? id;
  String? name;
  String? image;

  VehicleModel({
    this.id,
    this.name,
    this.image,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
