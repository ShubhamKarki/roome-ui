import 'package:flutter/material.dart';
import 'package:roome_ui/model/trips.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:uuid/uuid.dart';

class TripCard extends StatelessWidget {
  final Trips trip;
  final uuid = Uuid();
  TripCard({Key key, @required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final uuidId = uuid.v4();

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${trip.date}, ${trip.rooms} Room - ${trip.memberCount} Adults',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  color: Colors.black12,
                  offset: Offset(5, 5),
                )
              ],
            ),
            child: Column(
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
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                trip.image,
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: whiteColor,
                              child: Center(
                                child: Icon(
                                  trip.isFavourite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                trip.hotelName,
                                style: heading2Style,
                              ),
                              Row(
                                children: [
                                  Text(
                                    trip.location,
                                    style: subtitle1Style,
                                  ),
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
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                trip.pricePerNight,
                                style: heading2Style,
                              ),
                              Text(
                                '/per night',
                                style: subtitle1Style,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
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
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            '${trip.reviewCount} Reviews',
                            style: subtitle1Style,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
