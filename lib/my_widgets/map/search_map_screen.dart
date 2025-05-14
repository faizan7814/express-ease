import 'package:express_ease/res/colors/colors.dart';
import 'package:express_ease/res/icons/icons.dart';
import 'package:express_ease/controllers/map_controller.dart';
import 'package:express_ease/utils/mystyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchAddressScreen extends StatelessWidget {
  SearchAddressScreen({super.key});

  final controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borderOnly = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          25,
        ),
        topRight: Radius.circular(
          25,
        ),
      ),
      borderSide: BorderSide.none,
    );
    OutlineInputBorder borderAll = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(
                child: Obx(
                  () => GoogleMap(
                    onTap: (LatLng latlong) {
                      // print(latlong);
                    },
                    onLongPress: (LatLng latLng) {
                      controller.addMarker(latLng);
                      // print(latLng);
                    },
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: controller.kGoogleplex,
                    markers: Set<Marker>.of(controller.marker),
                    polylines: controller.polylines.toSet(),
                    onMapCreated: (GoogleMapController controllerMap) {
                      controller.mapController.complete(controllerMap);
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.searchAddress();
                    },
                    controller: controller.controllerText,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: controller.selectedAddresHint.value ??
                          'search Addrees',
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          googleMap,
                          height: 8,
                          width: 8,
                        ),
                      ),
                      enabledBorder: controller.placesModel!.isEmpty
                          ? borderAll
                          : borderOnly,
                      focusedBorder: controller.placesModel!.isEmpty
                          ? borderAll
                          : borderOnly,
                      errorBorder: controller.placesModel!.isEmpty
                          ? borderAll
                          : borderOnly,
                      focusedErrorBorder: controller.placesModel!.isEmpty
                          ? borderAll
                          : borderOnly,
                      border: controller.placesModel!.isEmpty
                          ? borderAll
                          : borderOnly,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 98),
                child: Obx(
                  () => Container(
                    height: controller.placesModel!.length * 60,
                    decoration: const BoxDecoration(
                        color: kwhite,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    width: double.infinity,
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.only(bottom: 23),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.placesModel!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var place = controller.placesModel![index];
                            return Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(width: .5, color: kblack)),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.onSelectAddress(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      place.description,
                                      style: inputText2,
                                    ),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.duration.value == null
                    ? const SizedBox()
                    : Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Text(
                              controller.distance.value!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: kblue,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: Text(
                              controller.duration.value!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ]),
                      ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: controller.curentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
