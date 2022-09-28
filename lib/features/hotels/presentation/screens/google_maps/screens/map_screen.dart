// // ignore_for_file: avoid_unnecessary_containers
//
// import 'dart:async';
//
// import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//
//
//
// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
//
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//
//   // static Position? position;
//
//   Completer<GoogleMapController> _mapController = Completer();
//
//   // static final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
//   //     target: LatLng(AppCubit.get(context).hotels!.latitude, position!.longitude),
//   //     bearing: 0.5,
//   //     tilt: 0.0,
//   //     zoom: 17);
//
//   // Future<void> getMyCurrentLocationForInitial() async {
//   //   await LocationHelper.getCurrentLocation();
//   //   position = await Geolocator.getLastKnownPosition().whenComplete(() {
//   //     setState(() {});
//   //   });
//   // }
//
//   @override
//   initState() {
//     super.initState();
//     _goToMyCurrentLocation();
//   }
//
//   Widget buildMap() {
//     return GoogleMap(
//       initialCameraPosition: CameraPosition(
//           target: LatLng(double.parse(AppCubit.get(context).hotels![0].latitude.toString()), double.parse(AppCubit.get(context).hotels![0].longitude.toString())),
//           bearing: 0.5,
//           tilt: 0.0,
//           zoom: 17),
//       mapType: MapType.normal,
//       myLocationButtonEnabled: false,
//       zoomControlsEnabled: true,
//       myLocationEnabled: true,
//       onMapCreated: (GoogleMapController controller) {
//         _mapController.complete(controller);
//         setState(() {
//           _mapController.complete(controller);
//         });
//       },
//     );
//   }
//
//   Future<void> _goToMyCurrentLocation() async {
//     final GoogleMapController controller = await _mapController.future;
//     controller.animateCamera(
//         CameraUpdate.newCameraPosition(CameraPosition(
//             target: LatLng(double.parse(AppCubit.get(context).hotels![1].latitude.toString()), double.parse(AppCubit.get(context).hotels![1].longitude.toString())),
//             bearing: 0.5,
//             tilt: 0.0,
//             zoom: 17),));
//   }
//
//   // Widget buildFloatingSearchBar() {
//   //   final isPortrait =
//   //       MediaQuery.of(context).orientation == Orientation.portrait;
//   //
//   //   return FloatingSearchBar(
//   //     hint: 'Find a place',
//   //     border: const BorderSide(style: BorderStyle.none),
//   //     margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
//   //     padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
//   //     elevation: 6,
//   //     hintStyle: const TextStyle(fontSize: 18),
//   //     queryStyle: const TextStyle(fontSize: 18),
//   //     scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
//   //     transitionDuration: const Duration(milliseconds: 800),
//   //     transitionCurve: Curves.easeInOut,
//   //     physics: const BouncingScrollPhysics(),
//   //     axisAlignment: isPortrait ? 0.0 : -1.0,
//   //     openAxisAlignment: 0.0,
//   //     width: isPortrait ? 600 : 500,
//   //     debounceDelay: const Duration(milliseconds: 500),
//   //     onQueryChanged: (query) {
//   //       // Call your model, bloc, controller here.
//   //     },
//   //     onFocusChanged: (_) {},
//   //     // Specify a custom transition to be used for
//   //     // animating between opened and closed stated.
//   //     transition: CircularFloatingSearchBarTransition(),
//   //     actions: [
//   //       FloatingSearchBarAction(
//   //         showIfOpened: false,
//   //         child: CircularButton(
//   //           icon: const Icon(Icons.place, color: Colors.black),
//   //           onPressed: () {},
//   //         ),
//   //       ),
//   //       FloatingSearchBarAction.searchToClear(
//   //         showIfClosed: false,
//   //       ),
//   //     ],
//   //     builder: (context, transition) {
//   //       return ClipRRect(
//   //         borderRadius: BorderRadius.circular(8),
//   //         child: Material(
//   //           color: Colors.white,
//   //           elevation: 4.0,
//   //           child: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             children: Colors.accents.map((color) {
//   //               return Container(height: 112, color: color);
//   //             }).toList(),
//   //           ),
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           AppCubit.get(context).hotels!.length!= null
//               ? buildMap()
//               : Center(
//             child: Container(
//               child: const CircularProgressIndicator(
//                 color: Colors.blue,
//               ),
//             ),
//           ),
//           // buildFloatingSearchBar()
//         ],
//       ),
//       // floatingActionButton: Container(
//       //   margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
//       //   child: FloatingActionButton(
//       //     backgroundColor: Colors.blue,
//       //     onPressed: () {
//       //       _goToMyCurrentLocation();
//       //       setState(() {});
//       //     },
//       //     child: const Icon(
//       //       Icons.place,
//       //       color: Colors.white,
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key, required this.latitude, required this.longitude}) : super(key: key);
 final double latitude;
 final double longitude;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude,widget.longitude),
            bearing: 1,
            tilt: 1,
            zoom: 100),
        mapType: MapType.hybrid,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        myLocationEnabled: true,
        buildingsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _mapController.complete(controller);
          setState(() {
            _mapController.complete(controller);
          });
        },
      ));
    }
  }

