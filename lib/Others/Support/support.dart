import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/app_drawer.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Components/textfield.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Theme/colors.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: textFieldColor,
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          locale.support!,
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
                  Center(
                    child: FadedScaleAnimation(
                      Image.asset(
                        Assets.logo,
                        scale: 2.5,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        locale.needHelp!,
                        style: theme.textTheme.subtitle1!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        'Fragment park, Near World Trade building, Melbourne, Australia.',
                        style: theme.textTheme.subtitle2!.copyWith(
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.connectUs!,
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: theme.primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '+1 987 654 3210',
                              style: theme.textTheme.subtitle1!.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: theme.primaryColor,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'help@kdemmy.com',
                              style: theme.textTheme.subtitle1!.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    margin: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          locale.writeUsDirectly!,
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.mail,
                              color: theme.primaryColor,
                            ),
                            Expanded(
                              child: TextFieldForkdemy(
                                hintText: locale.yourMessage,
                                color: theme.scaffoldBackgroundColor,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                underline: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: textFieldColor,
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              borderRadius: BorderRadius.zero,
              margin: EdgeInsets.zero,
              text: locale.submit,
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
