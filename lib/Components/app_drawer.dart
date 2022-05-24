import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<String?> _menuList = [
      locale.home,
      locale.ongoingCourses,
      locale.bookmarked,
      locale.support,
      locale.shareApp,
      locale.changeLanguage,
      locale.logout
    ];
    var theme = Theme.of(context);
    return Drawer(
      child: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
              alignment: Alignment.center,
              padding:
                  EdgeInsets.only(top: 60, bottom: 24, left: 34, right: 16),
              color: theme.primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.profile);
                },
                leading: CircleAvatar(
                  radius: 34,
                  child: Image.asset(
                    Assets.profileImage,
                  ),
                ),
                title: Text(
                  'Sam Smith',
                  style: theme.textTheme.headline6,
                ),
                subtitle: Text(
                  locale.viewProfile!,
                  style: theme.textTheme.subtitle2!.copyWith(height: 1.5),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                itemCount: _menuList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: index == 0
                            ? () {
                                Navigator.pushNamed(context, PageRoutes.home);
                              }
                            : index == 1
                                ? () {
                                    Navigator.pushNamed(
                                        context, PageRoutes.ongoingCourses);
                                  }
                                : index == 2
                                    ? () {
                                        Navigator.pushNamed(
                                            context, PageRoutes.bookmarked);
                                      }
                                    : index == 3
                                        ? () {
                                            Navigator.pushNamed(
                                                context, PageRoutes.support);
                                          }
                                        : index == 4
                                            ? () {}
                                            : index == 5
                                                ? () {
                                                    Navigator.pushNamed(
                                                        context,
                                                        PageRoutes
                                                            .changeLanguage);
                                                  }
                                                : () {
                                                    Navigator.pushNamed(context,
                                                        PageRoutes.signIn);
                                                  },
                        child: Text(
                          _menuList[index]!,
                          style: theme.textTheme.headline6!
                              .copyWith(color: textColor),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  );
                }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 0),
              child: Text(
                locale.followUs!,
                style: theme.textTheme.headline6!.copyWith(color: textColor),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Row(
                children: [
                  Image.asset(
                    Assets.facebook,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    Assets.twitter,
                    scale: 2.5,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    Assets.youtube,
                    scale: 2.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
