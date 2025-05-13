import 'package:express_ease/data/modals/packege_model.dart';
import 'package:express_ease/data/modals/serializable.dart';

class Parcel extends Serializable {
  List<Package>? package;
  String? rName;
  String? rEmail;
  String? rAlPhoneNum;
  String? pickupDate;
  String? note;
  String? userId;
  String? vehiclesTypeId;
  bool? loadUnload;
  String? pickupId;
  String? deliveryId;

  Parcel({
    this.package,
    this.rName,
    this.rEmail,
    this.rAlPhoneNum,
    this.pickupDate,
    this.note,
    this.userId,
    this.vehiclesTypeId,
    this.loadUnload,
    this.pickupId,
    this.deliveryId,
  });

  factory Parcel.fromJson(Map<String, dynamic> json) => Parcel(
        package: json["package"] == null
            ? []
            : List<Package>.from(
                json["package"]!.map((x) => Package.fromJson(x))),
        rName: json["rName"],
        rEmail: json["rEmail"],
        rAlPhoneNum: json["rAlPhoneNum"],
        pickupDate: json["pickupDate"],
        note: json["note"],
        userId: json["UserId"],
        vehiclesTypeId: json["VehiclesTypeId"],
        loadUnload: json["load_unload"],
        pickupId: json["pickupId"],
        deliveryId: json["deliveryId"],
      );
  @override
  Map<String, dynamic> toJson() => {
        "package": package == null
            ? []
            : List<dynamic>.from(package!.map((x) => x.toJson())),
        "rName": rName,
        "rEmail": rEmail,
        "rAlPhoneNum": rAlPhoneNum,
        "pickupDate": pickupDate,
        "note": note,
        "UserId": userId,
        "VehiclesTypeId": vehiclesTypeId,
        "load_unload": loadUnload,
        "pickupId": pickupId,
        "deliveryId": deliveryId,
      };
}
