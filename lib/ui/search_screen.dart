import 'package:flutter/material.dart';
import 'package:roome_ui/data/trips_data.dart';
import 'package:roome_ui/ui/shared/customInputField.dart';
import 'package:roome_ui/ui/shared/custom_button.dart';
import 'package:roome_ui/ui/shared/tripCard.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          'Explore',
          style: heading2Style,
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.favorite_border,
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.location_on,
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                color: backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                              hintText: 'Explore', controller: null),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                spreadRadius: 5.0,
                                color: chipBackground,
                                offset: Offset(5, 5),
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.search,
                            color: whiteColor,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              final List<DateTime> picked =
                                  await DateRagePicker.showDatePicker(
                                      context: context,
                                      initialFirstDate: new DateTime.now(),
                                      initialLastDate: (new DateTime.now())
                                          .add(new Duration(days: 7)),
                                      firstDate: new DateTime(2015),
                                      lastDate: new DateTime(2030));
                              if (picked != null && picked.length == 2) {
                                print(picked);
                              }
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Choose date',
                                  style: subtitle1Style,
                                ),
                                Text(
                                  '12 Dec - 22 Dec',
                                  style: titleboldstyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1.0,
                          color: grey,
                        ),
                        Expanded(
                          child: Hero(
                            tag: "hero-roomPicker",
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Material(
                                      type: MaterialType.transparency,
                                      color: whiteColor,
                                      child: Hero(
                                        tag: "hero-roomPicker",
                                        child: Center(
                                          // Aligns the container to center
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            // width: 300.0,
                                            height: 300.0,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SearchHelper(
                                                    title: 'Number of Rooms'),
                                                Divider(
                                                  height: 30.0,
                                                ),
                                                SearchHelper(title: 'Adult'),
                                                Divider(
                                                  height: 30.0,
                                                ),
                                                SearchHelper(title: 'Children'),
                                                Divider(
                                                  height: 30.0,
                                                ),
                                                CustomButton(
                                                  title: 'Apply',
                                                  ontap: () {
                                                    Navigator.pop(context);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Number of Rooms',
                                      style: subtitle1Style,
                                    ),
                                    Text(
                                      '1 Room - 2 Adults',
                                      style: titleboldstyle,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '530 hotels found',
                      style: titlestyle,
                    ),
                    Row(
                      children: [
                        Text(
                          'Filters',
                          style: titlestyle,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.sort,
                          color: primaryColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: upcoming.length + 1,
                itemBuilder: (context, index) => index == upcoming.length
                    ? SizedBox(
                        height: 10.0,
                      )
                    : TripCard(
                        trip: upcoming[index],
                        hidedate: true,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // DateTime selectedDate = DateTime.now();

  // Future<void> _selectDate(BuildContext context, setState) async {
  //   final DateTime picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime(2022, 8),
  //   );

  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }
}

class SearchHelper extends StatelessWidget {
  final title;

  const SearchHelper({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? 'Number of Rooms',
          style: titleboldstyle,
        ),
        Row(
          children: [
            Container(
              height: 20,
              width: 20.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                  )),
              child: Icon(
                Icons.remove,
                size: 15,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              '1',
              style: heading3Style,
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 20,
              width: 20.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2.0,
                  )),
              child: Icon(
                Icons.add,
                size: 15,
              ),
            )
          ],
        )
      ],
    );
  }
}
