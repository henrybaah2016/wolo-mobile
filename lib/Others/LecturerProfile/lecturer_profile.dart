import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Models/user_experience_card_model.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

class LecturerProfile extends StatefulWidget {
  @override
  _LecturerProfileState createState() => _LecturerProfileState();
}

class _LecturerProfileState extends State<LecturerProfile> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: textFieldColor,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                Container(
                  color: theme.primaryColor,
                  width: double.infinity,
                  height: 250,
                ),
                Expanded(
                  child: TabBarView(children: [
                    FadedSlideAnimation(
                      AboutTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                    FadedSlideAnimation(
                      ChaptersTab(),
                      beginOffset: Offset(0, 0.3),
                      endOffset: Offset(0, 0),
                      slideCurve: Curves.linearToEaseOut,
                    ),
                  ]),
                ),
              ],
            ),
            PositionedDirectional(
              top: 100,
              start: 14,
              end: 14,
              child: Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 20,
                child: Container(
                  padding: EdgeInsetsDirectional.only(start: 16, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Jerry George',
                        style: theme.textTheme.headline6!.copyWith(
                          color: textColor,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'New jersey' + '         ',
                        style: theme.textTheme.subtitle2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Spacer(),
                          Text(
                            '  ' + '886',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            '       ' + '39',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 16),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '4.5',
                              style: theme.textTheme.caption!
                                  .copyWith(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            ' (125)',
                            style: theme.textTheme.caption!
                                .copyWith(color: theme.hintColor, fontSize: 16),
                          ),
                          Spacer(),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            locale.subscribed!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            locale.courses!,
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                          Text(
                            locale.averageRatings!,
                            style: theme.textTheme.caption!
                                .copyWith(color: theme.hintColor),
                          ),
                          Spacer(),
                        ],
                      ),
                      TabBar(
                        indicatorColor: Theme.of(context).primaryColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: theme.primaryColor,
                        unselectedLabelColor: theme.hintColor,
                        tabs: [
                          Tab(
                            text: locale.about,
                          ),
                          Tab(
                            text: locale.courses,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
                start: 30,
                top: 70,
                child: FadedScaleAnimation(
                  Image.asset(
                    Assets.image7,
                    height: 80,
                    width: 80,
                  ),
                )),
            PositionedDirectional(
              top: 30,
              start: 0,
              end: 0,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: theme.scaffoldBackgroundColor,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: textFieldColor,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Jerry',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec felis tellus. Mauris consectetur scelerisque risus nec mollis.\n\nNullam varius augue et sollicitudin feugiat. Donec sit amet ligula a lorem condimentum eleifend eu sit amet arcu.',
                      style: theme.textTheme.caption,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec felis tellus. Mauris consectetur scelerisque risus nec mollis.\n\nNullam varius augue et sollicitudin feugiat. Donec sit amet ligula a lorem condimentum eleifend eu sit amet arcu.',
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: GestureDetector(
                onTap: () {
                  //Navigator.pushNamed(context, PageRoutes.authorInfo);
                },
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 20,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.lecturerProfile);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.socialLinks!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
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
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                Assets.linkedIn,
                                scale: 2.5,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                Assets.bimbo,
                                scale: 2.5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChaptersTab extends StatefulWidget {
  @override
  _ChaptersTabState createState() => _ChaptersTabState();
}

class _ChaptersTabState extends State<ChaptersTab> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<UserExperienceCardModel> userExperienceList = [
      UserExperienceCardModel(locale.uxDesignDescription, Assets.uxDesignImage,
          'Jerry Geirge', 25.00, 4.5, 125),
      UserExperienceCardModel(locale.searchThree, Assets.image12,
          'Kelly Williamson', 35.00, 4.2, 136),
      UserExperienceCardModel(
          locale.searchFour, Assets.image13, 'Johnson Taylor', 42.00, 4.5, 105),
      UserExperienceCardModel(
          locale.searchFive, Assets.image14, 'Linda George', 45.00, 3.9, 206),
      UserExperienceCardModel(
          locale.searchSix, Assets.image12, 'Amenda Smith', 25.00, 4.9, 50),
    ];

    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Expanded(
          child: Container(
            color: textFieldColor,
            padding: EdgeInsets.all(8),
            child: Material(
              color: textFieldColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: ListView.builder(
                itemCount: userExperienceList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.courseInfo);
                      },
                      child: Container(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            120, 20, 20, 20),
                        margin: EdgeInsetsDirectional.only(
                            start: 40, end: 20, bottom: 20),
                        decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(userExperienceList[index].title!),
                            Text(userExperienceList[index].teacher,
                                style: theme.textTheme.subtitle2),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  '\$${userExperienceList[index].price}',
                                  textAlign: TextAlign.end,
                                  style: theme.textTheme.subtitle1!
                                      .copyWith(color: theme.hintColor),
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    userExperienceList[index]
                                        .ratings
                                        .toString(),
                                    style: theme.textTheme.caption!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                Spacer(),
                                // SizedBox(width: 8),
                                Text(
                                  '(${userExperienceList[index].reviews})',
                                  style: theme.textTheme.caption!
                                      .copyWith(color: theme.hintColor),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: 16,
                      top: 20,
                      bottom: 40,
                      child: FadedScaleAnimation(
                        Image.asset(
                          userExperienceList[index].image,
                          width: 120,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
