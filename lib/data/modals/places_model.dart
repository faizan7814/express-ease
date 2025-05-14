class PlaceModel {
  final String? placeId;
  final String? description;

  // Constructor
  PlaceModel({this.placeId, this.description});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeId: json['place_id'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_id': placeId,
      'description': description,
    };
  }
}
