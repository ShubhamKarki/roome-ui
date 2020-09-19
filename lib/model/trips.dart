import 'package:flutter/material.dart';

class Trips {
  final date;
  final rooms;
  final memberCount;
  final hotelName;
  final image;
  final pricePerNight;
  final location;
  final distance;
  final starsCount;
  final reviewCount;
  final isFavourite;

  Trips({
    @required this.date,
    @required this.rooms,
    @required this.memberCount,
    @required this.hotelName,
    @required this.image,
    @required this.pricePerNight,
    @required this.location,
    @required this.distance,
    @required this.starsCount,
    @required this.reviewCount,
    @required this.isFavourite,
  });
}
