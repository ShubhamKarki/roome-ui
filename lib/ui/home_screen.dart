import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roome_ui/provider/homeModel.dart';
import 'package:roome_ui/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: whiteColor,
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: Container(
            child: model.currentTab,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          iconSize: 22,
          elevation: 5,
          selectedIconTheme: IconThemeData(size: 25),
          unselectedItemColor: grey,
          unselectedIconTheme: IconThemeData(
            color: primaryColor,
          ),
          backgroundColor: whiteColor,
          currentIndex: model.currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Explore'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              title: Text('Trips'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              title: Text('Profile'),
            ),
          ],
          onTap: (index) {
            model.tabNavigationBar(index);
          },
        ),
      ),
    );
  }
}
