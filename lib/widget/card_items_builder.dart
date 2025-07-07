import 'package:evcharge/model/station_model.dart';
import 'package:evcharge/widget/card_items.dart';
import 'package:flutter/material.dart';

import '../services/get_stations_info.dart';

class CardItemsBuilder extends StatelessWidget {
  const CardItemsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StationModel>>(
      future: StationsInfo().getInfo(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<StationModel> info = snapshot.data!;
          return SliverList(
              delegate: SliverChildBuilderDelegate(childCount: info.length,
                  (context, index) {
            return CardItems(
              stationModel: info[index],
            );
          }));
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()));
        }
      }),
    );
  }
}
