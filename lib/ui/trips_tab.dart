import 'package:flutter/material.dart';
import 'package:roome_ui/ui/favorites.dart';
import 'package:roome_ui/ui/finished_tab.dart';
import 'package:roome_ui/ui/upcoming_tab.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class Tripstab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'My Trips',
                  style: heading1Style,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                height: 50.0,
                decoration: BoxDecoration(
                  color: notWhite,
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  labelColor: primaryColor,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: false,
                  tabs: [
                    Text(
                      'Upcoming',
                      style: tabTitlestyle,
                    ),
                    Text(
                      'Finished',
                      style: tabTitlestyle,
                    ),
                    Text(
                      'Favorites',
                      style: tabTitlestyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    UpcomingTab(),
                    FinishedTab(),
                    FavoritesTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
