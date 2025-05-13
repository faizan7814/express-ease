import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends GetConnect {
  Future<Response> getSuggestions(String input, String sessionId) async {
    String kplaceApiKey = 'AIzaSyD68_vw1gGE7LVVjJ5ZShy7qWwm9Rq0CBQ';
    String baseURL =
        "https://maps.googleapis.com/maps/api/place/autocomplete/json";
    String url =
        '$baseURL?input=$input&key=$kplaceApiKey&sessiontoken=$sessionId';
    Response response;
    try {
      response = await get(
        url,
      );
      debugPrint('Response: ${response.bodyString}');
    } catch (e) {
      debugPrint('Request failed: $e');
      throw Exception('Network error: $e');
    }

    return response;
  }

  Future<LatLng?> getLatLngFromPlaceId(String placeId) async {
    String kplaceApiKey = 'AIzaSyD68_vw1gGE7LVVjJ5ZShy7qWwm9Rq0CBQ';

    final String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$kplaceApiKey";

    try {
      final response = await get(url);

      if (response.statusCode == 200) {
        final data = response.body;
        if (data["status"] == "OK") {
          double lat = data["result"]["geometry"]["location"]["lat"];
          double lng = data["result"]["geometry"]["location"]["lng"];
          return LatLng(lat, lng);
        }
      }
    } catch (e) {
      print("Error fetching lat/lng: $e");
    }
    return null;
  }

  Future<Response> getDirectiona(LatLng origin, LatLng destination) async {
    String kplaceApiKey = "AIzaSyD68_vw1gGE7LVVjJ5ZShy7qWwm9Rq0CBQ";
    String baseURL = "https://maps.googleapis.com/maps/api/directions/json";

    final String url =
        "$baseURL?origin=${origin.latitude},${origin.longitude}&destination=${destination.latitude},${destination.longitude}&key=$kplaceApiKey";

    Response response;
    try {
      response = await get(
        url,
      );
      //debugPrint('Response: ${response.bodyString}');
    } catch (e) {
      debugPrint('Request failed: $e');
      throw Exception('Network error: $e');
    }

    return response;
  }
}
