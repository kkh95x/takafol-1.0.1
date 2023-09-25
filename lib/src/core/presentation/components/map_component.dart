import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takafol/src/core/presentation/components/loading_component.dart';
import 'package:takafol/src/user_management/domain/app_user_model.dart';

class MapComponent extends StatelessWidget {
  const MapComponent(
      {super.key,
      this.point,
      this.controller,
      this.initZoom = 13,
      this.enableRotationByGesture = true,
      this.onGeoPointClicked,
      this.pepole = const [],
      this.showDefaultInfoWindow = true});
  final GeoPoint? point;
  final bool showDefaultInfoWindow; //THIS ENUBLE TOTH ON ONE PHGINER
  final bool enableRotationByGesture;
  final double initZoom;
  final List<AppUser> pepole;
  final MapController? controller;
  // List<PopupMenuEntry<dynamic>>? popup;
  final void Function(AppUser)? onGeoPointClicked;
  @override
  Widget build(BuildContext context) {
    // default constructor
    MapController controller =this.controller?? MapController(
      initPosition: GeoPoint(
          latitude: pepole.first.latitude ?? 47.4358055,
          longitude: pepole.first.longitude ?? 8.4737324),
    );
// or set manually init position
//  final controller = MapController.withPosition(
//             initPosition: GeoPoint(
//               latitude: 47.4358055,
//               longitude: 8.4737324,
//           ),
// );
// // init the position using the user location
// final controller = MapController.withUserPosition(
//         trackUserLocation: UserTrackingOption(
//            enableTracking: true,
//            unFollowUser: false,
//         )
// )
    final points = pepole
        .map((e) => StaticPositionGeoPoint(

                e.id ?? e.firstName,
                const MarkerIcon(

                  iconWidget: Icon(
                        Icons.person_pin_circle,
                        color: Colors.red,
                        size: 56,
                      ),
                  
                  
                  // Row(
                  //   children: [
                      
                      // PopupMenuButton(
                      //     elevation: 2,
                      //     position: PopupMenuPosition.under,
                      //     icon: const Icon(
                      //       Icons.more_vert,
                      //       color: Colors.white,
                      //     ),
                      //     iconSize: 120.h,
                      //     color: Theme.of(context).colorScheme.shadow,
                      //     itemBuilder: (BuildContext context) {
                      //       return [
                      //         PopupMenuItem(
                      //           onTap: () async {
                      //             // await ref.read(workingStepProvider(cases).future);
                      //           },
                      //           value: 'Start Step',
                      //           child: Row(
                      //             children: [
                      //               const Icon(Icons.start),
                      //               const SizedBox(width: 5),
                      //               Text(
                      //                 'Start Step',
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ];
                      //     }),
                  //   ],
                  // ),
                ),
                [
                  GeoPoint(
                    latitude: e.latitude ?? 0.0,
                    longitude: e.longitude ?? 0.0,
                  )
                ]))
        .toList();
    return OSMFlutter(
      
      mapIsLoading:const Center(child:  LoadingComponent(backColor: false,text: "جاري تحميل الخريطة")),
        controller: controller,
        onGeoPointClicked: (p0) {
          print("----m> ${p0}");
          try {
            final user = pepole.singleWhere((element) =>
                element.latitude == p0.latitude &&
                element.longitude == p0.longitude);
            onGeoPointClicked?.call(user);
          } catch (e) {
            print("---> error:${e.toString()}");
          }
        },
        osmOption: OSMOption(
          isPicker: false,
          // userLocationMarker: UserLocationMaker(personMarker: MarkerIcon(

          //         iconWidget: const Icon(
          //               Icons.person_pin_circle,
          //               color: Colors.black,
          //               size: 56,
          //             ),),
          //              directionArrowMarker:MarkerIcon(

          //         iconWidget: const Icon(
          //               Icons.person_pin_circle,
          //               color: Colors.black,
          //               size: 56,
          //             ),)),
          showDefaultInfoWindow:
              showDefaultInfoWindow, //THIS ENUBLE TOTH ON ONE PHGINER
          enableRotationByGesture: enableRotationByGesture,
          staticPoints: points,
          zoomOption: ZoomOption(
            initZoom: initZoom,
            minZoomLevel: 3,
            maxZoomLevel: 19,
            stepZoom: 1.0,
          ),

          roadConfiguration: const RoadOption(
            roadColor: Colors.yellowAccent,
          ),
          markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.blue,
              size: 56,
            ),
          )),
        ));
  }
}
