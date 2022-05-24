import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Models/category_model.dart';
import 'package:kdemy/Models/search_model.dart';
import 'package:kdemy/Routes/routes.dart';
import '../Assets/assets.dart';
import '../Theme/colors.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    List<SubCategory> subCategories = [
      SubCategory(locale.physics, 68),
      SubCategory(locale.history, 53),
      SubCategory(locale.francais, 174),
      SubCategory(locale.chemistry, 103),
      SubCategory(locale.biology, 97),
    ];

    List<SearchModel> searches = [
      SearchModel(Assets.NewCourseTwo, locale.coursePreparedOne, 20.00),
      SearchModel(Assets.NewCourseTwo, locale.coursePreparedOne, 40.00),
      SearchModel(Assets.NewCourseTwo, locale.coursePreparedOne, 26.00),
      SearchModel(Assets.NewCourseTwo, locale.coursePreparedOne, 25.00),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        flexibleSpace: Image.asset(
          Assets.headerImage,
          fit: BoxFit.fill,
        ),
        backgroundColor: Colors.transparent,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Mathematics',
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),

            // Container(
            //   height: 164,
            //   margin: EdgeInsets.only(left:16,right:16,bottom:16),
            //   child: ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     itemCount: searches.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => Container(
            //       width: MediaQuery.of(context).size.width / 2.5,
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           FadedScaleAnimation(
            //             Image.asset(
            //               searches[index].image,
            //               height: 110,
            //               width: MediaQuery.of(context).size.width / 2.8,
            //             ),
            //           ),
            //           Text(
            //             searches[index].title!,
            //             maxLines: 2,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //           Text(
            //             '\GH${searches[index].price}',
            //             style: theme.textTheme.caption,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(left:16,right:16,bottom:16),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: searches.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                 return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadedScaleAnimation(
                        Image.asset(
                          searches[index].image,
                          height: 110,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:5,right:15),
                        child: Text(
                          searches[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:5),
                        child: Text(
                          '\GH${searches[index].price}',
                          style: theme.textTheme.caption,

                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Divider(thickness: 8),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Categories',
                style: theme.textTheme.subtitle1!
                    .copyWith(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              itemCount: subCategories.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PageRoutes.userExperience,
                  );
                },
                child: RichText(
                  text: TextSpan(
                    style: theme.textTheme.subtitle1!
                        .copyWith(color: textColor, height: 2),
                    children: [
                      TextSpan(text: subCategories[index].title),
                      TextSpan(
                          text: ' (${subCategories[index].noOfLessons})',
                          style: theme.textTheme.subtitle1!
                              .copyWith(color: theme.hintColor))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
