// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:express_ease/data/modals/serializable.dart';

class CategoryData extends Serializable {
    String? insuranceText;
    String? loadUnloadChargesText;
    String? insuranceChargesText;
    List<CategoryElement>? categories;

    CategoryData({
        this.insuranceText,
        this.loadUnloadChargesText,
        this.insuranceChargesText,
        this.categories,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        insuranceText: json["insuranceText"],
        loadUnloadChargesText: json["load_unload_chargesText"],
        insuranceChargesText: json["insurance_chargesText"],
        categories: json["categories"] == null ? [] : List<CategoryElement>.from(json["categories"]!.map((x) => CategoryElement.fromJson(x))),
    );
@override
    Map<String, dynamic> toJson() => {
        "insuranceText": insuranceText,
        "load_unload_chargesText": loadUnloadChargesText,
        "insurance_chargesText": insuranceChargesText,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class CategoryElement {
    int? id;
    String? name;
    String? image;
    bool? status;
    bool? adult18Plus;
    String? createdAt;
    String? updatedAt;

    CategoryElement({
        this.id,
        this.name,
        this.image,
        this.status,
        this.adult18Plus,
        this.createdAt,
        this.updatedAt,
    });

    factory CategoryElement.fromJson(Map<String, dynamic> json) => CategoryElement(
        id: json["id"],
        name: json["name"],
        image: json["Image"],
        status: json["status"],
        adult18Plus: json["adult_18plus"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Image": image,
        "status": status,
        "adult_18plus": adult18Plus,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
