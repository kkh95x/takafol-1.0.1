import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final poiintState = StateProvider<GeoPoint?>((ref) => null);
final controller = StateProvider<MapController>((ref) =>
    MapController.withPosition(
        initPosition: GeoPoint(latitude: 36.58533090, longitude: 37.05654890)));
final mark = StateProvider<List<StaticPositionGeoPoint>?>((ref) => null);

class MapNeedyInputComponent extends ConsumerWidget {
  const MapNeedyInputComponent({super.key, required this.onPressed});
  final void Function(GeoPoint)? onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // default constructor

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
final controll=ref.read(controller);

  controll.myLocation();


    return ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: Container(
          color: Colors.blue.shade50,
          child: Stack(
            children: [
                Stack(
                  children: [
                    AbsorbPointer(
                      absorbing: true,
                      child: OSMFlutter(
                        
                          controller: controll,
                          mapIsLoading: Container(
                            color: Colors.blue.shade50,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),

                          osmOption: OSMOption(
                            isPicker: false,
                            showDefaultInfoWindow:
                                false, //THIS ENUBLE TOTH ON ONE PHGINER
                            enableRotationByGesture: false,
                            showZoomController: false,
                            // staticPoints: ref.watch(mark) ?? [],
                            zoomOption: const ZoomOption(
                              initZoom: 16,
                              minZoomLevel: 3,
                              maxZoomLevel: 19,
                              stepZoom: 1.0,
                            ),

                            // roadConfiguration: const RoadOption(
                            //   roadColor: Colors.yellowAccent,

                            // ),
                            markerOption: MarkerOption(
                                defaultMarker: const MarkerIcon(
                              icon: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                            )),
                          )),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                                Icons.person_pin_circle,
                                color: Colors.blue,
                                size: 56,
                              ),
                    )
                  ],
                ),
             
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 150.sp,
                    height: 150.sp,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50, shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () async {
                          final point = await showSimplePickerLocation(
                              context: context,
                              radius: 10.r,
                              title: "تحديد موقع المستخدم",
                              zoomOption: const ZoomOption(initZoom: 15),
                              contentPadding: EdgeInsets.all(30.sp),
                              
                              initPosition: ref.watch(poiintState) ??
                                  GeoPoint(
                                      latitude: 36.58533090,
                                      longitude: 37.05654890),
                              // initCurrentUserPosition:const UserTrackingOption(),
                              textConfirmPicker: "تحديد");
                          if (point != null) {
                            ref.read(poiintState.notifier).state = point;
                            ref.read(controller).goToLocation(point);
                            ref.read(mark.notifier).state = [
                              StaticPositionGeoPoint(
                                  "${ref.watch(poiintState)!.latitude + (ref.watch(poiintState)!.longitude)}",
                                const  MarkerIcon(icon: Icon(Icons.person)),
                                  [ref.watch(poiintState)!])
                            ];
                            onPressed?.call(point);
                          }
                        },
                        icon: const Icon(Icons.my_location)),
                  ))
            ],
          ),
        ));
  }
}
