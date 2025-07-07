import 'package:evcharge/constants.dart';
import 'package:evcharge/widget/custom_title_station.dart';
import 'package:flutter/material.dart';

import 'card_items_builder.dart';

class StationBodyItems extends StatelessWidget {
  const StationBodyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              stationImage,
              height: 300,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomTitleStation(
              text: "Nearby Stations",
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 18,
            ),
          ),
          const CardItemsBuilder(),
        ],
      ),
    );
  }
}
