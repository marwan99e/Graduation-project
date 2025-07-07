import 'package:evcharge/constants.dart';
import 'package:evcharge/model/station_model.dart';
import 'package:evcharge/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/location_services.dart';
import '../services/open_map_app.dart';

class InsideCardItemView extends StatefulWidget {
  const InsideCardItemView({super.key});

  static String id = "InsideCardItemView";

  @override
  State<InsideCardItemView> createState() => _InsideCardItemViewState();
}

class _InsideCardItemViewState extends State<InsideCardItemView> {
  late CameraPosition initialCameraPosition;
  late LocationServices locationServices;

  void initState() {
    locationServices = LocationServices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StationModel stationModel =
        ModalRoute.of(context)!.settings.arguments as StationModel;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: kPrimaryColor,
          ),
        ),
        elevation: 2,
        title: Text(
          "Station Information",
          style: TextStyle(color: kPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 175, 175, 175),
                    offset: Offset(0, 2),
                    blurRadius: 3,
                  )
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18),
                    bottomRight: Radius.circular(18)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(stationModel.stationImage ?? demoStation),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.only(left: 12, top: 12),
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 175, 175, 175),
                      offset: Offset(0, 2),
                      blurRadius: 3,
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stationModel.stationName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: "NEOSANSW23", fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Distance : ",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: "NEOSANSW23"),
                      ),
                      Text(
                        "${stationModel.distanceInKm.toStringAsFixed(3)} Km",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.green, fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Address : ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "NEOSANSW23"),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          stationModel.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                    markers: {
                      Marker(
                          markerId: MarkerId("1"),
                          draggable: true,
                          position: LatLng(
                            double.parse(stationModel.locationLat),
                            double.parse(stationModel.locationLong),
                          ))
                    },
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                        zoom: 18,
                        target: LatLng(
                          double.parse(stationModel.locationLat),
                          double.parse(stationModel.locationLong),
                        )))),
            SizedBox(
              height: 24,
            ),
            CustomButton(
                onTap: () async {
                  await locationServices.checkAndRequestLocationScervice();
                  var hasPermission = await locationServices
                      .checkAndRequestLocationPermission();
                  if (hasPermission) {
                    OpenMap().openMap(
                      double.parse(stationModel.locationLat),
                      double.parse(stationModel.locationLong),
                    );
                  }
                },
                text: "Get Diriction"),
          ],
        ),
      ),
    );
  }
}
