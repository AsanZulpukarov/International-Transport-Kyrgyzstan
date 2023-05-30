import 'package:cargo_app/fetches/points_fetch.dart';
import 'package:cargo_app/model/info_point_model.dart';
import 'package:cargo_app/services/map_service.dart';
import 'package:cargo_app/services/service.dart';
import 'package:cargo_app/views/sendFormData/hotKeshAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as mp;
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

import '../fetches/getImage.dart';
import '../fetches/info_point_fetch.dart';
import '../model/points_model.dart';
import 'editAdminData/editAdminData.dart';

class SPAdminPage extends StatefulWidget {
  SPAdminPage({Key? key}) : super(key: key);

  static Set<Marker> allMarkersForMap = {};
  static Set<Polyline> allPolylines = {
    Polyline(
      polylineId: PolylineId('temp'),
      points: [
        LatLng(42.836853988529406, 74.56383548676968),
        LatLng(42.84220553994765, 74.56540390849113),
      ],
      color: Colors.green,
    ),
  };
  @override
  State<SPAdminPage> createState() => _SPAdminPageState();
}

class _SPAdminPageState extends State<SPAdminPage> {
  loc.LocationData? currentLocation;
  mp.MapController? mapController;

  Set<Marker> currentTwoAdminMarkers = {};
  Future<PointsModel>? futureAllPoints;

  double currentZoom = 0;

  @override
  void initState() {
    super.initState();
    futureAllPoints = FetchClass().fetchPoints();
  }

  @override
  void dispose() {
    if (currentTwoAdminMarkers.length == 1) {
      SPAdminPage.allMarkersForMap.remove(currentTwoAdminMarkers.first);
    } else if (currentTwoAdminMarkers.length == 2) {
      SPAdminPage.allPolylines.remove(SPAdminPage.allPolylines.last);
      SPAdminPage.allMarkersForMap.remove(currentTwoAdminMarkers.first);
      SPAdminPage.allMarkersForMap.remove(currentTwoAdminMarkers.last);
    }

    currentTwoAdminMarkers.clear();
    super.dispose();
  }

  Future<LatLng> getMyCoordsLocator() async {
    loc.LocationData? data = await MapService.getLocation();
    LatLng _latLng;
    if (data != null) {
      _latLng = LatLng(data.latitude!, data.longitude!);
    } else {
      _latLng = LatLng(37.4219983, -122.084);
    }
    return _latLng;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пункты'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0),
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              FutureBuilder(
                future: getMyCoordsLocator(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return GoogleMap(
                      markers: SPAdminPage.allMarkersForMap,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: snapshot.data as LatLng, zoom: 16),
                      mapType: MapType.normal,
                      onTap: _handleTap,
                      onMapCreated: (controller) {
                        mapController = controller as mp.MapController;
                      },
                      polylines: SPAdminPage.allPolylines,
                      // onCameraMove: (CameraPosition position) {
                      //   currentZoom = position.zoom;
                      //   // Обновите ширину линии Polyline здесь, основываясь на текущем масштабе
                      //   updatePolylineWidth();
                      // },
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              if (currentTwoAdminMarkers.length > 1)
                Positioned(
                  left: 20,
                  bottom: 80,
                  child: InkWell(
                    onTap: () {
                      onTapEditButton();
                      setState(() {});
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              if (currentTwoAdminMarkers.length > 1)
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: InkWell(
                    onTap: () {
                      onTapClearButton();
                      setState(() {});
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.blue),
                      child: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              FutureBuilder<PointsModel>(
                future: futureAllPoints,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var allPoints = snapshot.data!;
                    for (var i = 0; i < allPoints.data!.length; i++) {
                      SPAdminPage.allMarkersForMap.add(Marker(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  var like = false;
                                  return FutureBuilder<InfoPointModel>(
                                    future: InfoPoint().fetchInfoPoints(
                                        allPoints.data![i].id.toString()),
                                    builder: (context, snapshot2) {
                                      if (snapshot2.hasError) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      if (snapshot2.hasData) {
                                        var cut = snapshot2.data;
                                        return Container(
                                          padding: EdgeInsets.all(20),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    child: ImageString()
                                                        .imageFromBase64String(
                                                            allPoints.data![i]
                                                                    .id! -
                                                                1),
                                                    width: 150,
                                                    height: 150,
                                                  ),
                                                  SizedBox(width: 40),
                                                  Column(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                              Icons.thumb_up,
                                                              color: like ==
                                                                      false
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .red)),
                                                      Text(cut!.data!.likes!
                                                          .toString())
                                                    ],
                                                  ),
                                                  SizedBox(width: 10),
                                                  Column(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                              Icons.thumb_down,
                                                              color: like ==
                                                                      false
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .blue)),
                                                      Text(cut.data!.dislikes!
                                                          .toString())
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Text(cut.data!.userName!),
                                              SizedBox(height: 20),
                                              Text(cut.data!.description!),
                                              SizedBox(height: 20),
                                              Text(cut.data!.date!),
                                            ],
                                          ),
                                        );
                                      }
                                      return Center(
                                          child: CircularProgressIndicator());
                                    },
                                  );
                                });
                          },
                          markerId: MarkerId(
                              "saveMarker${allPoints.data![i].id.toString()}"),
                          position: LatLng(double.parse(allPoints.data![i].x!),
                              double.parse(allPoints.data![i].y!))));
                    }
                    if (currentTwoAdminMarkers.length == 1) {
                      SPAdminPage.allMarkersForMap
                          .add(currentTwoAdminMarkers.first);
                    } else if (currentTwoAdminMarkers.length == 2) {
                      SPAdminPage.allMarkersForMap
                          .add(currentTwoAdminMarkers.first);
                      SPAdminPage.allMarkersForMap
                          .add(currentTwoAdminMarkers.last);
                    }
                    for (var i = 0; i < allPoints.sections!.length; i++) {
                      SPAdminPage.allPolylines.add(
                        Polyline(
                          polylineId: PolylineId(
                              "savePolyline${allPoints.sections![i].id.toString()}"),
                          points: [
                            LatLng(double.parse(allPoints.sections![i].x1!),
                                double.parse(allPoints.sections![i].y1!)),
                            LatLng(double.parse(allPoints.sections![i].x2!),
                                double.parse(allPoints.sections![i].y2!))
                          ],
                          color: Colors.green,
                          width: 10,
                        ),
                      );
                    }
                    return Container();
                  }
                  return Center(child: SizedBox());
                },
              ),
            ])),
      ),
    );
  }

/*  void updatePolylineWidth() {
    // Рассчитайте новую ширину линии на основе текущего масштаба
    double newLineWidth = calculateLineWidth();

    // Обновите ширину линии для каждого элемента Polyline
    SPAdminPage.allPolylines.forEach((polyline) {
      SPAdminPage.allPolylines = SPAdminPage.allPolylines.map((polyline) {
        return polyline.copyWith(widthParam: newLineWidth.round());
      }).toSet();
    });
  }*/
/*
  double calculateLineWidth() {
    // Определите диапазон масштаба, в котором вы хотите изменять ширину линии
    final double minZoom =
        5; // Минимальный масштаб, при котором ширина будет минимальной
    final double maxZoom =
        15; // Максимальный масштаб, при котором ширина будет максимальной
    final double minWidth = 1; // Минимальная ширина линии
    final double maxWidth = 10; // Максимальная ширина линии

    // Интерполируйте значение ширины линии в зависимости от текущего масштаба
    double normalizedZoom = (currentZoom - minZoom) / (maxZoom - minZoom);
    double interpolatedWidth =
        (maxWidth - minWidth) * normalizedZoom + minWidth;

    return interpolatedWidth;
  }*/

  late List<String> locationXY;

  int markersId = 0;
  void _handleTap(LatLng tapPosition) async {
    final location = loc.Location();
    try {
      currentLocation = await location.getLocation();
      if (markersId <= 1) {
        currentTwoAdminMarkers.add(Marker(
          markerId: MarkerId('currentTwoAdminMarker$markersId'),
          position: tapPosition,
          icon: BitmapDescriptor.defaultMarker,
        ));

        markersId++;
      }
      if (markersId > 1) {
        SPAdminPage.allPolylines.add(Polyline(
          polylineId:
              PolylineId('currentPolyline${SPAdminPage.allPolylines.length}'),
          points: [
            currentTwoAdminMarkers.first.position,
            currentTwoAdminMarkers.last.position
          ],
          color: Colors.green,
        ));
      }

      setState(() {});
      locationXY.add(tapPosition.longitude.toString());
      locationXY.add(tapPosition.latitude.toString());

      var json = {
        'x': locationXY.elementAt(0),
        'y': '',
        'photo': '',
        'user_id': '',
        'type': '',
        'description': ''
      };
      print('${tapPosition.longitude} ${tapPosition.latitude}');
    } catch (e) {
      currentLocation = null;
    }
  }
/*
  Future<void> _onMar(LatLng tapPosition) async {
    List<Placemark> placemark = await placemarkFromCoordinates(
        tapPosition.latitude, tapPosition.longitude);
    var first = placemark.first.name;
    print(first.toString());
  }
  */
/*
  Future<void> _onMarkerTapped(Marker marker) async {
    final coordinates =
        Coordinates(marker.position.latitude, marker.position.longitude);
    final addresses = await geocoding.findAddressesFromCoordinates(coordinates);

    if (addresses.isNotEmpty) {
      final firstAddress = addresses.first;
      final street = firstAddress.thoroughfare;

      if (street != null) {
        print(street);
      } else {
        print('Улица не найдена');
      }
    } else {
      print('Адрес не найден');
    }
  }
  */

  onTapClearButton() {
    clearTwoMarkers();

    SPAdminPage.allPolylines.remove(SPAdminPage.allPolylines.last);
  }

  onTapEditButton() async {
    bool add = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditAdminData(adminMarkers: currentTwoAdminMarkers),
      ),
    );
    if (add) {
      clearTwoMarkers();
    }
  }

  clearTwoMarkers() {
    currentTwoAdminMarkers.clear();
    // Marker marker1 = SPAdminPage.allMarkersForMap.lastWhere(
    //     (marker) => marker.markerId.value == "currentTwoAdminMarker0");
    // Marker marker2 = SPAdminPage.allMarkersForMap.lastWhere(
    //     (marker) => marker.markerId.value == "currentTwoAdminMarker1");
    SPAdminPage.allMarkersForMap.remove(SPAdminPage.allMarkersForMap.last);
    SPAdminPage.allMarkersForMap.remove(SPAdminPage.allMarkersForMap.last);

    markersId = 0;
  }
}
