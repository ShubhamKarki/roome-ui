import 'package:flutter/material.dart';
import 'package:roome_ui/data/popularDestination.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class Exploretab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Text('data'),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      'Popular Destinations',
                      style: heading2Style,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 250,
                    child: ListView.separated(
                      itemCount: popularDestination.length + 1,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 10.0,
                      ),
                      itemBuilder: (context, index) => index == 0
                          ? SizedBox(
                              width: 8,
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(24.0),
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
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: Container(
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(24.0),
                                      image: new DecorationImage(
                                        image: new ExactAssetImage(
                                            popularDestination[index - 1]
                                                .image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        popularDestination[index - 1]?.title ??
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
          ],
        ),
      ),
    );
  }
}
