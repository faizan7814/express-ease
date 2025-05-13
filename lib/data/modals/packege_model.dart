// To parse this JSON data, do
//
//     final packges = packgesFromJson(jsonString);

import 'package:express_ease/data/modals/serializable.dart';

class Packges extends Serializable {
    List<Package>? packages;

    Packges({
        this.packages,
    });

    factory Packges.fromJson(Map<String, dynamic> json) => Packges(
        packages: json["packages"] == null ? [] : List<Package>.from(json["packages"]!.map((x) => Package.fromJson(x))),
    );
@override
    Map<String, dynamic> toJson() => {
        "packages": packages == null ? [] : List<dynamic>.from(packages!.map((x) => x.toJson())),
    };
}

class Package {
    String? categoryId;
    String? categoryName;
    String? weight;
    String? height;
    String? length;
    String? width;
    String? estWorth;
    bool? insurance;
    String? unit;

    Package({
        this.categoryId,
        this.categoryName,
        this.weight,
        this.height,
        this.length,
        this.width,
        this.estWorth,
        this.insurance,
        this.unit,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        categoryId: json["CategoryId"],
        categoryName: json["categoryName"],
        weight: json["weight"],
        height: json["height"],
        length: json["length"],
        width: json["width"],
        estWorth: json["estWorth"],
        insurance: json["insurance"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "CategoryId": categoryId,
        "categoryName": categoryName,
        "weight": weight,
        "height": height,
        "length": length,
        "width": width,
        "estWorth": estWorth,
        "insurance": insurance,
        "unit": unit,
    };
}
