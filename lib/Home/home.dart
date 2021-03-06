import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/app_drawer.dart';
import 'package:kdemy/Components/categories_list.dart';
import 'package:kdemy/Components/textfield.dart';
import 'package:kdemy/Components/title_row.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Models/category_model.dart';
import 'package:kdemy/Models/search_model.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<TopCategory> topCategories = [
      TopCategory('Core Mathematics', '125', Assets.topCategory1),
      TopCategory('English Language', '221', Assets.topCategory2),
      TopCategory('Integrated Science', '201', Assets.topCategory4),
      TopCategory('Social Studies', '199', Assets.topCategory3),

    ];

    return Builder(
      builder: (BuildContext context) {
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }

        List<SearchModel> searches = [
          SearchModel(Assets.NewCourseTwo, locale.coursePreparedOne, 20.00),
          SearchModel(Assets.NewCourseFour, locale.coursePreparedFour, 40.00),
          SearchModel(Assets.NewCourseOne, locale.coursePreparedTwo, 26.00),
          SearchModel(Assets.NewCourseThree, locale.coursePreparedThree, 25.00),
        ];
        return Scaffold(
          backgroundColor: textFieldColor,
          drawer: AppDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: FadedScaleAnimation(
              Text(
                'Wolo',
                style: theme.textTheme.headline6,
              ),
            ),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.notifications);
                  },
                  child: Icon(
                    Icons.notifications,
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.notifications);
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: theme.scaffoldBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.woloIntroThree,
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  PositionedDirectional(
                    top: 144,
                    start: 16,
                    end: 16,
                    child: FadedScaleAnimation(
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: locale.introTextOne,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                TextSpan(
                                  text: '\n' + locale.introTextTwo!,
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 6,
                            child: FadedScaleAnimation(
                              TextButton(
                                child: Text(locale.getStarted!),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.search);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    bottom: -16,
                    width: MediaQuery.of(context).size.width,
                    child: FadedScaleAnimation(
                      TextFieldForkdemy(
                        readOnly: true,
                        onTap: () {
                          Navigator.pushNamed(context, PageRoutes.search);
                        },
                        prefixIcon: Icons.search,
                        color: Colors.white,
                        hintText: locale.searchForCourseTopic,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 12),
              TitleRow(
                locale.ongoingCourses,
                padding: EdgeInsets.only(top:16,right:16,left:16),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.ongoingCourses);
                },
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.lecturerInfo);
                    },
                    child: FadedScaleAnimation(
                      Container(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            120, 20, 20, 20),
                        margin: EdgeInsetsDirectional.only(start: 40, end: 20),
                        decoration: BoxDecoration(
                            color: theme.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(locale.courseTitle!),
                            Text('GH30.00', style: theme.textTheme.subtitle2),
                            Text(
                              '35 % ' + locale.complete!,
                              textAlign: TextAlign.end,
                              style: theme.textTheme.caption!
                                  .copyWith(color: theme.primaryColor),
                            ),
                            SizedBox(height: 4),
                            Container(
                              height: 4,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                theme.primaryColor,
                                theme.hintColor,
                              ], stops: [
                                0.3,
                                0.3
                              ])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    start: 16,
                    top: 20,
                    bottom: 20,
                    child: Image.asset(
                      Assets.courseCoverMath,
                      width: 130,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // if (_anchoredBanner != null)
              //   Container(
              //     width: _anchoredBanner!.size.width.toDouble(),
              //     height: _anchoredBanner!.size.height.toDouble(),
              //     child: AdWidget(ad: _anchoredBanner!),
              //   ),
              TitleRow(
                locale.topCategories,
                padding: EdgeInsets.only(left:16,right:16),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.categoryPage,
                      arguments: 'All Categories');
                },
              ),
              Container(
                margin: EdgeInsets.only(bottom:15),
                child: CategoriesList(
                  topCategories,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              TitleRow(
                'New Course',
                padding: EdgeInsets.only(left:16,right:16),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.categoryPage,
                      arguments: 'New Course');
                },
              ),

              Container(
                height: 164,
                margin: EdgeInsets.only(left:16,right:16,bottom:16),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: searches.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadedScaleAnimation(
                          Image.asset(
                            searches[index].image,
                            height: 110,
                            width: MediaQuery.of(context).size.width / 2.8,
                          ),
                        ),
                        Text(
                          searches[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '\GH${searches[index].price}',
                          style: theme.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ),


            ],
          ),
        );
      },
    );
  }
}
