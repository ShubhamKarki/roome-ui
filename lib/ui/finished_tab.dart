import 'package:flutter/material.dart';
import 'package:roome_ui/data/trips_data.dart';
import 'package:roome_ui/ui/shared/tripCard.dart';

class FinishedTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: upcoming.length + 1,
      itemBuilder: (context, index) => index == upcoming.length
          ? SizedBox(
              height: 10.0,
            )
          : TripCard(
              trip: upcoming.reversed.toList()[index],
            ),
    );
  }
}
