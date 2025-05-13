// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);
import 'package:express_ease/data/modals/serializable.dart';

class AddressModel extends Serializable {
    int? id;
    String? title;
    String? building;
    String? aptNum;
    String? city;
    String? state;
    String? zip;
    String? phoneNum;
    dynamic lat;
    dynamic lng;
    String? exactAddress;
    int? userId;

    AddressModel({
        this.id,
        this.title,
        this.building,
        this.aptNum,
        this.city,
        this.state,
        this.zip,
        this.phoneNum,
        this.lat,
        this.lng,
        this.exactAddress,
        this.userId,
    });

    factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        title: json["title"],
        building: json["building"],
        aptNum: json["aptNum"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        phoneNum: json["phoneNum"],
        lat: json["lat"],
        lng: json["lng"],
        exactAddress: json["exactAddress"],
        userId: json["UserId"],
    );
@override
    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "building": building,
        "aptNum": aptNum,
        "city": city,
        "state": state,
        "zip": zip,
        "phoneNum": phoneNum,
        "lat": lat,
        "lng": lng,
        "exactAddress": exactAddress,
        "UserId": userId,
    };
}
