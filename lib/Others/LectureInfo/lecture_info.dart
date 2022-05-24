import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Others/LectureInfo/controls.dart';
import 'package:kdemy/Others/LectureInfo/data_manager.dart';
import 'package:kdemy/Others/LectureInfo/mock_data.dart';
import 'package:kdemy/Theme/colors.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class LectureInfo extends StatefulWidget {
  @override
  _LectureInfoState createState() => _LectureInfoState();
}

class _LectureInfoState extends State<LectureInfo> {
  late FlickManager flickManager;
  late DataManager dataManager;
  List<String> urls = (mockData["items"] as List)
      .map<String>((item) => item["trailer_url"])
      .toList();

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
          urls[0],
        ),
        onVideoEnd: () {
          dataManager.skipToNextVideo(Duration(seconds: 5));
        });

    dataManager = DataManager(flickManager: flickManager, urls: urls);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  skipToVideo(String url) {
    flickManager.handleChangeVideo(VideoPlayerController.network(url));
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    return VisibilityDetector(
        key: ObjectKey(flickManager),
    onVisibilityChanged: (visibility) {
    if (visibility.visibleFraction == 0 && this.mounted) {
    flickManager.flickControlManager?.autoPause();
    } else if (visibility.visibleFraction == 1) {
    flickManager.flickControlManager?.autoResume();
    }
    },
       child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: textFieldColor,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [

                    Container(
                      height: 230,
                      child: FlickVideoPlayer(
                        flickManager: flickManager,
                        preferredDeviceOrientationFullscreen: [
                          DeviceOrientation.portraitUp,
                          DeviceOrientation.landscapeLeft,
                          DeviceOrientation.landscapeRight,
                        ],
                        flickVideoWithControls: FlickVideoWithControls(
                          controls: CustomOrientationControls(dataManager: dataManager),
                        ),
                        flickVideoWithControlsFullscreen: FlickVideoWithControls(
                          videoFit: BoxFit.fitWidth,
                          controls: CustomOrientationControls(dataManager: dataManager),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        FadedSlideAnimation(
                          CurriculumTab(),
                          beginOffset: Offset(0, 0.3),
                          endOffset: Offset(0, 0),
                          slideCurve: Curves.linearToEaseOut,
                        ),
                        FadedSlideAnimation(
                          OverviewTab(),
                          beginOffset: Offset(0, 0.3),
                          endOffset: Offset(0, 0),
                          slideCurve: Curves.linearToEaseOut,
                        ),
                        FadedSlideAnimation(
                          InstructorTab(),
                          beginOffset: Offset(0, 0.3),
                          endOffset: Offset(0, 0),
                          slideCurve: Curves.linearToEaseOut,
                        ),
                      ]),
                    ),
                  ],
                ),
                PositionedDirectional(
                  top: 231,
                  start: 0,
                  end: 0,
                  child: Material(
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
                            'Integrated Science (for SHS 2)',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: textColor,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                'by George Kwesi Amoah',
                                style:
                                Theme.of(context).textTheme.subtitle2!.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 70,
                                height: 30,
                                margin: EdgeInsets.only(left: 5, right: 5),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: theme.primaryColor,
                                    minimumSize: Size(double.infinity, 52),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(5.0),
                                      side: BorderSide(color: theme.primaryColor),
                                    ),elevation: 0,
                                  ),
                                  onPressed: () {

                                  },
                                  child: Text('Buy',
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ),
                              ),

                            ],
                          ),
                          TabBar(
                            indicatorColor: Theme.of(context).primaryColor,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelColor: theme.primaryColor,
                            unselectedLabelColor: theme.hintColor,
                            tabs: [

                              Tab(
                                text: 'Curriculum',
                              ),
                              Tab(
                                text: 'Overview',
                              ),
                              Tab(
                                text: 'Instructor',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
    );

  }
}

class Curriculum {
  String? title;
  String subtitle;

  Curriculum(this.title, this.subtitle);
}
class CurriculumTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<Curriculum> chapterOne = [
      Curriculum('Lecture 1.1: Acid, Base & Salt I', '30 ' + 'mins'),
      Curriculum('Lecture 1.2: Acid, Base & Salt II','30' + 'mins'),
      Curriculum('Lecture 1.3: Acid, Base & Salt III', '33 ' + 'mins'),
      Curriculum('Lecture 1.4: Salts I', '30 ' + 'mins'),
      Curriculum(' Lecture 1.5: Salt II ( Solubility of Salt)', '33 ' + 'mins'),
      Curriculum(' Lecture 1.6: Salt III (pH Indicators)', '15 ' + 'mins'),
      Curriculum('Lecture 1.7: Acid, Base & Salt (Notes)', '01 ' + 'hr'),
      Curriculum('Quiz 1.1: ABS Quiz ( 10 Ques.) 10 questions', '10' + 'hr'),
    ];

    List<Curriculum> chapterTwo = [
      Curriculum('Lecture 2.1: Soil Conservation I', '29' + 'mins'),
      Curriculum('Lecture 2.2: Soil Conservation II','30' + 'mins'),
      Curriculum('Lecture 2.3: Soil Conservation II', '30' + 'mins'),
      Curriculum('Lecture 2.4: Soil Conservation II', '27' + 'mins'),
      Curriculum('Lecture 2.5: Soil Conservation (Revised)', '48' + 'mins'),
      Curriculum('Lecture 2.6: Soil Conservation (Notes)', '01' + 'hr'),
      Curriculum('Quiz 2.1: Soil Conservation (Quiz)', '05' + 'questions'),
    ];
    return SingleChildScrollView(

      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 140,
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 0),
              color: textFieldColor,
              padding: EdgeInsets.all(8),
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Row(
                        children: [
                          Text(
                            '1.0 ACID, BASE & SALTS',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.download_sharp,
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 0, left: 10),
                          physics: BouncingScrollPhysics(),
                          itemCount: chapterOne.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                '${index + 1}' + '.',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                    color: Theme.of(context).primaryColor),
                              ),
                              title: Text(
                                chapterOne[index].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 14),
                              ),
                              subtitle: Text(
                                chapterOne[index].subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 12),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 15, bottom: 0),
              color: textFieldColor,
              padding: EdgeInsets.all(8),
              child: Material(
                color: Theme.of(context).scaffoldBackgroundColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 16),
                      child: Row(
                        children: [
                          Text(
                            '2.0 SOIL CONSERVATION',
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.download_sharp,
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: 0, left: 10),
                          physics: BouncingScrollPhysics(),
                          itemCount: chapterTwo.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                '${index + 1}' + '.',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                    color: Theme.of(context).primaryColor),
                              ),
                              title: Text(
                                chapterTwo[index].title!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 14),
                              ),
                              subtitle: Text(
                                chapterTwo[index].subtitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(fontSize: 12),
                              ),
                            );
                          }),
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


class Overview {
  String? title;
  String subtitle;
  String subtitleTwo;
  Overview(this.title, this.subtitle, this.subtitleTwo);
}

class OverviewTab extends StatefulWidget {
  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    List<Overview> ov = [
      Overview('1.0: Acid Base & Salt', '8' + ' Lectures', '1' + ' Quiz'),
      Overview('2.0: Soil Conservation', '7' + ' Lectures', '2' + ' Quiz'),
      Overview('3.0: Water', '7' + 'Lectures', '1' + ' Quiz'),
      Overview('4.0: Hydrological Cycle', '4' + ' Lectures', '1' + ' Quiz'),
      Overview('5.0: General Principles of Farm Animal Production', '5' + ' Lectures', '3' + ' Quiz'),
      Overview('6.0: Execretory System', '5' + ' Lectures', '1' + ' Quiz'),
      Overview('7.0: Reproduction & Growth in Mammals', '5' + ' Lectures', '1' + ' Quiz'),
      Overview('8.0: Electrical Energy', '6' + ' Lectures', '1' + ' Quiz'),
      Overview('9.0: Electronics', '7' + ' Lectures', '1' + ' Quiz'),
      Overview('10.0: Sound Energy', '4' + ' Lectures', '1' + ' Quiz'),
      Overview('11.0: Electrical Energy', '5' + ' Lectures', '2' + ' Quiz'),
      Overview('12.0: Nuclear', '5' + ' Lectures', '1' + ' Quiz'),
      Overview('13.0: Circulatory System', '7' + ' Lectures', '1' + ' Quiz'),
      Overview('14.0: Magnetism', '4' + ' Lectures', '1' + ' Quiz'),
      Overview('15.0: Force, Motion & Pressure', '8' + ' Lectures', '4' + ' Quiz'),
      Overview('16.0: Endogenous technology', '1' + ' Lectures', '1' + ' Quiz'),
      Overview('17.0: Safety in the Community', '6' + ' Lectures', '1' + ' Quiz'),
    ];

    return Column(
      children: [
        SizedBox(
          height: 160,
        ),
        Expanded(
          child: Container(
            color: textFieldColor,
            padding: EdgeInsets.all(8),
            child: Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 16),
                    child: Row(
                      children: [
                        Text(
                          '78 Lectures',
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontSize: 12,
                              ),
                        ),
                        Spacer(),
                        Text(
                          locale.allLectures!,
                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontSize: 12,
                                color: Theme.of(context).primaryColor,
                              ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 70, left: 10),
                        physics: BouncingScrollPhysics(),
                        itemCount: ov.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Theme.of(context).hintColor,
                                  width: double.infinity,
                                  height: 1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    ov[index].title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    'Description of each of the topic treated in this course is put here  for the studentb to have a generak overview of the topics and what the teacher covers.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                          color: textColor,
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        ov[index].subtitleTwo!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                            color: Theme.of(context)
                                                .primaryColor,
                                            fontSize: 12),
                                      ),
                                      Spacer(),
                                      Text(
                                        ov[index].subtitle!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class InstructorTab extends StatefulWidget {
  @override
  _InstructorTabState createState() => _InstructorTabState();
}

class InstructorItems {
  final String? title;
  final Icon icon;

  InstructorItems(this.title, this.icon);
}

class _InstructorTabState extends State<InstructorTab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List<InstructorItems> _InstructorItems = [
      InstructorItems(
          locale.courseDescription,
          Icon(
            Icons.info,
            color: Theme.of(context).primaryColor,
          )),
      InstructorItems(
          locale.shareThisCourse,
          Icon(
            Icons.share,
            color: Theme.of(context).primaryColor,
          )),
      InstructorItems(
          locale.addToBookmark,
          Icon(
            Icons.bookmark,
            color: Theme.of(context).primaryColor,
          )),
      InstructorItems(
          locale.reviewThisCourse,
          Icon(
            Icons.thumb_up,
            color: Theme.of(context).primaryColor,
          )),
      InstructorItems(
          locale.viewSimilarCourses,
          Icon(
            Icons.table_view_rounded,
            color: Theme.of(context).primaryColor,
          )),
    ];
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        color: textFieldColor,
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 80),
        child: Column(
          children: [
            SizedBox(
              height: 160,
            ),
            Material(
              color: Theme.of(context).scaffoldBackgroundColor,
              elevation: 5,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: _InstructorItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: _InstructorItems[index].icon,
                          title: Text(
                            _InstructorItems[index].title!,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
