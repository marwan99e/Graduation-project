import 'package:evcharge/constants.dart';
import 'package:evcharge/model/station_model.dart';
import 'package:flutter/material.dart';

import '../services/location_services.dart';
import '../services/open_map_app.dart';
import '../views/inside_card_item_view.dart';

class CardItems extends StatefulWidget {
  const CardItems({super.key, required this.stationModel});
  final StationModel stationModel;

  @override
  State<CardItems> createState() => _CardItemsState();
}

class _CardItemsState extends State<CardItems> {
  late LocationServices locationServices;

  @override
  void initState() {
    locationServices = LocationServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, InsideCardItemView.id,
              arguments: widget.stationModel);
        },
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            child: ListTile(
              leading: Container(
                  height: 75,
                  width: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.stationModel.stationImage ?? demoStation,
                      fit: BoxFit.cover,
                    ),
                  )),
              trailing: Padding(
                padding: EdgeInsets.only(top: 18),
                child: GestureDetector(
                  onTap: () async {
                    await locationServices.checkAndRequestLocationScervice();
                    var hasPermission = await locationServices
                        .checkAndRequestLocationPermission();
                    if (hasPermission) {
                      OpenMap().openMap(
                        double.parse(widget.stationModel.locationLat),
                        double.parse(widget.stationModel.locationLong),
                      );
                    }
                  },
                  child: Icon(
                    Icons.location_on_sharp,
                    color: kPrimaryColor,
                    size: 24,
                  ),
                ),
              ),
              title: Row(
                children: [
                  Text(
                    widget.stationModel.stationName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontFamily: "NEOSANSW23", fontSize: 11),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                    "Distance ",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "${widget.stationModel.distanceInKm.toStringAsFixed(3)}",
                    style: TextStyle(
                        fontSize: 13, color: Color.fromARGB(255, 6, 152, 45)),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Km",
                    style: TextStyle(
                        color: Color.fromARGB(255, 6, 152, 45), fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
