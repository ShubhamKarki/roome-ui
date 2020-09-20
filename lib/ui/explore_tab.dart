import 'package:flutter/material.dart';
import 'package:roome_ui/data/popularDestination.dart';
import 'package:roome_ui/data/trips_data.dart';
import 'package:roome_ui/ui/shared/horizontal_card.dart';
import 'package:roome_ui/utils/app_constants.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class Exploretab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.SearchScreen);
              },
              child: Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      spreadRadius: 5.0,
                      color: chipBackground,
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Where are you going?',
                      style: titlestyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: popularDestination
                            .map((e) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage(e.image),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        e.title,
                                        style: subtitleStyle,
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Popular Destinations',
                              style: heading2Style,
                            ),
                          ),
                          Container(
                            height: 250,
                            child: ListView.separated(
                              itemCount: popularDestination.length + 1,
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 5.0,
                              ),
                              itemBuilder: (context, index) => index == 0
                                  ? SizedBox(
                                      width: 5,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.0,
                                              spreadRadius: 2.0,
                                              color: Colors.black12,
                                              offset: Offset(5, 5),
                                            )
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                          child: Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    popularDestination[
                                                            index - 1]
                                                        .image),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                popularDestination[index - 1]
                                                        ?.title ??
                                                    '',
                                                style: heading2Style.copyWith(
                                                    color: whiteColor,
                                                    shadows: [
                                                      Shadow(
                                                          blurRadius: 2.0,
                                                          offset: Offset(2, 2))
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Best Deals',
                              style: heading2Style,
                            ),
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              itemCount: upcoming.length + 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => index == 0
                                  ? SizedBox(
                                      width: 12,
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 12),
                                      child: Container(
                                        width: 310,
                                        child: HorizontalCard(
                                          trip: upcoming[index - 1],
                                          isHorizontalScroll: true,
                                        ),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
