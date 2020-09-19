import 'package:flutter/material.dart';
import 'package:roome_ui/utils/colors.dart';
import 'package:roome_ui/utils/styles.dart';

class Profiletab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amanda',
                        style: heading1Style,
                      ),
                      Text(
                        'View and edit profile',
                        style: subtitleStyle,
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/womanface.jpg'),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              ProfileTile(title: 'Change Profile', iconData: Icons.lock),
              ProfileTile(title: 'Invite Friends', iconData: Icons.people),
              ProfileTile(
                  title: 'Credits & Coupons', iconData: Icons.card_giftcard),
              ProfileTile(title: 'Help Center', iconData: Icons.help),
              ProfileTile(title: 'Payments', iconData: Icons.payment),
              ProfileTile(title: 'Settings', iconData: Icons.settings),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final title;
  final IconData iconData;
  final onTap;

  const ProfileTile({
    Key key,
    @required this.title,
    @required this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title ?? 'Change Password',
                style: titlestyle,
              ),
              Icon(
                iconData ?? Icons.lock,
                color: Colors.black45,
              )
            ],
          ),
        ),
        Divider(
          height: 30,
        )
      ],
    );
  }
}
