import 'dart:math';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'data_manager.dart';

class CustomOrientationControls extends StatelessWidget {
  const CustomOrientationControls(
      {Key? key, this.iconSize = 24, this.fontSize = 12, this.dataManager})
      : super(key: key);
  final double iconSize;
  final double fontSize;
  final DataManager? dataManager;

  @override
  Widget build(BuildContext context) {
    FlickVideoManager flickVideoManager =
    Provider.of<FlickVideoManager>(context);
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;

    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Container(color: Colors.black38),
          ),
        ),
        Positioned.fill(
          top: 20,
          left: 0,
          right: 0,
          child: FlickAutoHideChild(
            child: FlickSeekVideoAction(
              child:Container(

                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: theme.scaffoldBackgroundColor,
                            size: 24,
                          )),
                      Spacer(),

                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: theme.scaffoldBackgroundColor,
                                size: 24,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_border,
                                color: theme.scaffoldBackgroundColor,
                                size: 24,
                              ))
                        ],
                      ),
                      //Spacer(),

                    ],
                  )
              )
            ),
          ),
        ),
        Positioned.fill(
          top: 40,
          left: 0,
          right: 0,
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: flickVideoManager.nextVideoAutoPlayTimer != null
                    ? FlickAutoPlayCircularProgress(
                  colors: FlickAutoPlayTimerProgressColors(
                    backgroundColor: Colors.white30,
                    color: Colors.transparent,
                  ),
                )
                    : FlickAutoHideChild(
                  child: Row(
                    children: [
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            dataManager!.skipToPreviousVideo();
                          },
                          icon: Icon(
                            Icons.fast_rewind,
                            color: theme.scaffoldBackgroundColor,
                            size: 24,
                          )),
                      Spacer(),
                     // Spacer(),
                      FlickPlayToggle(size: 24),
                      Spacer(),
                     // Spacer(),
                      IconButton(
                          onPressed: () {
                            dataManager!.skipToNextVideo();

                          },
                          icon: Icon(
                            Icons.fast_forward_rounded,
                            color: theme.scaffoldBackgroundColor,
                            size: 24,
                          )),
                      Spacer(),
                    ],
                  ),

                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 60,
          left: 0,
          right: 0,
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            margin:EdgeInsets.only(bottom:10),
                            child: FlickCurrentPosition(
                              fontSize: 14,

                            ),
                          ),

                          Spacer(),
                          Container(
                            margin:EdgeInsets.only(bottom:10),
                            child: FlickTotalDuration(
                              fontSize: 14,
                            ),
                          ),

                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            margin:EdgeInsets.only(left: 5,right: 15,bottom:10),
                            child:FlickFullScreenToggle(
                              enterFullScreenChild: (
                                  Icon(
                                        Icons.filter_center_focus_sharp,
                                        color: theme.scaffoldBackgroundColor,
                                      )
                              ),
                              exitFullScreenChild: (
                                  Icon(
                                        Icons.fullscreen_exit,
                                        color: theme.scaffoldBackgroundColor,
                                      )

                              ),
                              //size: iconSize,
                            ),

                          ),
                          
                        ],
                      ),
                      FlickVideoProgressBar(
                        flickProgressBarSettings: FlickProgressBarSettings(
                          height: 5,
                          handleRadius: 2,
                          curveRadius: 2,
                          backgroundColor: Theme.of(context).hintColor,
                          bufferedColor: Colors.white38,
                          playedColor: Theme.of(context).primaryColor,
                          handleColor: Theme.of(context).primaryColor,
                          padding: EdgeInsets.symmetric(vertical: 0),

                        ),
                      ),

                    ],
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     Row(
                  //       children: <Widget>[
                  //         Container(
                  //           margin:EdgeInsets.only(left: 5,right: 5),
                  //           child:Icon(
                  //             Icons.arrow_back_ios_outlined,
                  //             color: theme.scaffoldBackgroundColor,
                  //           ),
                  //
                  //         ),
                  //         FlickCurrentPosition(
                  //           fontSize: fontSize,
                  //         ),
                  //         Text(
                  //           ' / ',
                  //           style: TextStyle(
                  //               color: Colors.white, fontSize: fontSize),
                  //         ),
                  //         FlickTotalDuration(
                  //           fontSize: fontSize,
                  //         ),
                  //       ],
                  //     ),
                  //     Expanded(
                  //       child: Container(),
                  //     ),
                  //     Container(
                  //       margin:EdgeInsets.only(left: 5,right: 5),
                  //       child:FlickFullScreenToggle(
                  //         enterFullScreenChild: (
                  //             Icon(
                  //                 Icons.aspect_ratio,
                  //                 size:24
                  //
                  //             )
                  //         ),
                  //         exitFullScreenChild: (
                  //             Icon(
                  //                 Icons.fullscreen_exit,
                  //                 size:24
                  //
                  //             )
                  //         ),
                  //         //size: iconSize,
                  //       ),
                  //
                  //     ),
                  //
                  //
                  //   ],
                  // ),

                  // LinearPercentIndicator(
                  //   backgroundColor: Theme.of(context).hintColor,
                  //   width: MediaQuery.of(context).size.width,
                  //   lineHeight: 4.0,
                  //   percent: 0.4,
                  //   progressColor: Theme.of(context).primaryColor,
                  //   //padding: EdgeInsets.symmetric(horizontal: 0),
                  // ),

                ],
              ),
            ),
          ),
        ),


      ],
    );
  }
}