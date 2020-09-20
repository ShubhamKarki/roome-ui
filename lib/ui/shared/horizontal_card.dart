import 'package:flutter/material.dart';
import 'package:roome_ui/model/trips.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:uuid/uuid.dart';

class HorizontalCard extends StatelessWidget {
  final uuid = Uuid();
  final Trips trip;
  final isHorizontalScroll;

  HorizontalCard({
    Key key,
    @required this.trip,
    this.isHorizontalScroll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uuidId = uuid.v4();
    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.symmetric(
          horizontal: isHorizontalScroll ? 0.0 : 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            spreadRadius: 2.0,
            color: Colors.black12,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Row(
        children: [
          Hero(
            tag: "hero-$uuidId",
            child: Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return new Material(
                          color: Colors.black54,
                          child: Container(
                            padding: EdgeInsets.all(30.0),
                            child: InkWell(
                              child: Hero(
                                  tag: "hero-$uuidId",
                                  child: Image.asset(
                                    trip.image,
                                    width: 300.0,
                                    height: 300.0,
                                    alignment: Alignment.center,
                                    fit: BoxFit.contain,
                                  )),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 500)));
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(trip.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trip.hotelName,
                        style: heading3Style,
                      ),
                      Text(
                        trip.location,
                        style: subtitle1Style,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: primaryColor,
                                size: 12,
                              ),
                              Text(
                                trip.distance,
                                style: subtitle1Style,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 5,
                              rating: trip.starsCount,
                              size: 15.0,
                              isReadOnly: true,
                              color: primaryColor,
                              borderColor: primaryColor,
                              spacing: 0.0),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            trip.pricePerNight,
                            style: heading3Style,
                          ),
                          Text(
                            '/per night',
                            style: subtitle1Style,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
