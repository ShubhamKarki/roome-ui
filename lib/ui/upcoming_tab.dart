import 'package:flutter/material.dart';
import 'package:roome_ui/data/trips_data.dart';
import 'package:roome_ui/ui/shared/tripCard.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class UpcomingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: upcoming.length + 1,
      itemBuilder: (context, index) => index == upcoming.length
          ? SizedBox(
              height: 10.0,
            )
          : TripCard(
              trip: upcoming[index],
            ),
    );
  }
}
