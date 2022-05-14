import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/app_drawer.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Components/text_field_for_profile.dart';
import 'package:kdemy/Locale/locales.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          locale.profile!,
          style: theme.textTheme.headline6,
        ),
      ),
      body: FadedSlideAnimation(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 70,
                        color: theme.primaryColor,
                      ),
                      PositionedDirectional(
                        start: 130,
                        top: 0,
                        child: Image.asset(
                          Assets.profileImage,
                          scale: 2.3,
                        ),
                      ),
                      PositionedDirectional(
                          end: 125,
                          top: 0,
                          child: CircleAvatar(
                            backgroundColor: theme.scaffoldBackgroundColor,
                            radius: 16,
                            child: Icon(
                              Icons.camera_alt,
                              color: theme.primaryColor,
                              size: 16,
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 0, right: 12),
                    child: EntryField(
                      label: locale.firstName,
                      prefixIcon: Icon(
                        Icons.person,
                        color: theme.primaryColor,
                      ),
                      initialValue: 'Sam Smith',
                      // isCollapsed: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 0, right: 12),
                    child: EntryField(
                      label: locale.emailAddress,
                      prefixIcon: Icon(
                        Icons.mail,
                        color: theme.primaryColor,
                      ),
                      initialValue: 'samsmith@mail.com',
                      // isCollapsed: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 0, right: 12),
                    child: EntryField(
                      label: locale.contactNumber,
                      prefixIcon: Icon(
                        Icons.call,
                        color: theme.primaryColor,
                      ),
                      initialValue: '+1 987 654 3210',
                      // isCollapsed: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12, bottom: 12, left: 0, right: 12),
                    child: EntryField(
                      label: locale.dateOfBirth,
                      prefixIcon: Icon(
                        Icons.card_giftcard,
                        color: theme.primaryColor,
                      ),
                      initialValue: '23rd Dec, 1990',
                      suffixIcon: Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                      ),
                      // isCollapsed: true,
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
            CustomButton(
              borderRadius: BorderRadius.zero,
              margin: EdgeInsets.zero,
              text: locale.updateProfile,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
