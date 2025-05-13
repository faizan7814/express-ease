

import 'dart:async';
import 'dart:io';

import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/ui/map/map_provider.dart';
import 'package:express_ease/ui/map/places_model.dart';
import 'package:express_ease/utils/cutom_toast/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapController extends GetxController {
  final TextEditingController controllerText = TextEditingController();
  final getMap = MapProvider();
  RxList? placesModel = [].obs;
  String? selectedAddresstext;
  Rx<String?> selectedAddresHint = Rx<String?>(null);

  RxSet<Polyline> polylines = <Polyline>{}.obs;

  RxnString duration = RxnString();
  RxnString distance = RxnString();

  int? selectedAddressindex;

  LatLng? oringin;
  LatLng? destination;
  RxString userCurentAddress = ''.obs;
  final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  CameraPosition? cameraPosition;

  CameraPosition kGoogleplex =
      const CameraPosition(zoom: 10, target: LatLng(31.5204, 74.3587));

  final List<Marker> marker = <Marker>[].obs;

  Future<LocationPermission> getpermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    return permission;
  }

  Future<Position> getUserCurrentLocation() async {
    return await Geolocator.getCurrentPosition();
  }

  Future<BitmapDescriptor> getCustomMarkerIcon() async {
    return await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(30, 30)), // Adjust size as needed
      currentLocation,
    );
  }

  void addMarker(LatLng latlng) {
    marker.add(Marker(
        markerId: const MarkerId('marker'),
        position: LatLng(latlng.latitude, latlng.longitude),
        infoWindow: const InfoWindow(title: 'location')));
  }

  Future<void> curentLocation() async {
    final permission = await getpermission();
    Position? userCurrentlocation;
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      userCurrentlocation = await getUserCurrentLocation();
      final GoogleMapController controllerMap = await mapController.future;
      await controllerMap.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 16,
              target: LatLng(userCurrentlocation.latitude,
                  userCurrentlocation.longitude))));

      oringin =
          LatLng(userCurrentlocation.latitude, userCurrentlocation.longitude);
      BitmapDescriptor liveLocationIcon = await getCustomMarkerIcon();

      marker.add(Marker(
          markerId: const MarkerId('3'),
          icon: liveLocationIcon,
          position: LatLng(
              userCurrentlocation.latitude, userCurrentlocation.longitude),
          infoWindow: const InfoWindow(title: 'mylocation location')));
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      } else {
        return "No address found";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  void fetchAddress() async {
    final permission = await getpermission();
    Position? userCurrentlocation;
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      userCurrentlocation = await getUserCurrentLocation();

      String address = await getAddressFromLatLng(
          userCurrentlocation.latitude, userCurrentlocation.longitude);

      userCurentAddress.value = address;
      print("Address: $address");
    }
  }

  void searchAddress() async {
    var uuid = const Uuid();
    var sessionId = uuid.v4();

    print('api call search address ${controllerText.text}');
    try {
      final response =
          await getMap.getSuggestions(controllerText.text, sessionId);
      print('api call search address');
      print('api call search address${response.statusCode}');

      if (response.statusCode == HttpStatus.ok) {
        final data = response.body;
        print('api call search address response $data');

        placesModel!.value = (data['predictions'])
            .map((place) => PlaceModel.fromJson(place))
            .toList();

        if (controllerText.text.isEmpty) {
          placesModel!.clear();
        }
      }
    } catch (e) {
      CustomToast.showError(e.toString(), 'failed laoding Map catch error');
    }
  }

  Future<void> onSelectAddress(int index) async {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      final selectedAddress = placesModel![index];
      selectedAddresstext = selectedAddress.description!;
      selectedAddresHint.value = selectedAddress.description!;

      final id = selectedAddress.placeId;
      print('Selected Address: $selectedAddresstext');

      LatLng? latLng = await getMap.getLatLngFromPlaceId(id);
      destination = latLng;

      final GoogleMapController controllerMap = await mapController.future;

      await controllerMap.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: latLng!,
            zoom: 14,
          ),
        ),
      );

      marker.add(Marker(
        markerId: const MarkerId('selected_place'),
        position: latLng,
        infoWindow: InfoWindow(title: selectedAddresstext),
      ));

      getDirection();

      controllerText.text = selectedAddresstext!;
      placesModel!.clear();
    } catch (e) {
      CustomToast.showError(e.toString(), 'Error selecting address');
    }
  }

  void getdecodePolyline(String polylineString) {
    print("get decode run $polylineString");

    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();

    List<PointLatLng> result = polylinePoints.decodePolyline(polylineString);

    if (result.isEmpty) {
      print("Error: Decoded polyline is empty.");
      return;
    }

    for (var point in result) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }

    polylines.add(Polyline(
      polylineId: const PolylineId("route"),
      points: polylineCoordinates,
      color: Colors.blue,
      width: 5,
    ));

    polylines.refresh();
  }

  void getDirection() async {
    final response = await getMap.getDirectiona(oringin!, destination!);

    if (response.statusCode == 200) {
      final data = response.body;

      final List<dynamic> routes = data["routes"];
      //  print(routes);

      final route = routes[0];

      final leg = route["legs"][0];

      distance.value = leg["distance"]["text"].toString();
      duration.value = leg["duration"]["text"].toString();

      final String polylineString = route["overview_polyline"]["points"];

      getdecodePolyline(polylineString);
    }
  }
}
