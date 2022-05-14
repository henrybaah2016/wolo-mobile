import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Components/textfieldforauthscreens.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
         child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:50,bottom: 30),
                child: Image.asset('assets/wolo_logo_update.png',
                  scale: 3.5,
                ),
              ),
              Text(
                locale.signUpWithEmail!,
                style: theme.textTheme.subtitle1!.copyWith(
                    color: theme.hintColor, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldForAuthScreens(
                      hintText: locale.firstName,
                      margin: EdgeInsets.only(left: 32, right: 4, top: 4,bottom: 4),
                    ),
                  ),
                  Expanded(
                    child: TextFieldForAuthScreens(
                      hintText: locale.lastName,
                      margin: EdgeInsets.only(right: 32, left: 4, top: 4,bottom:4),
                    ),
                  ),
                ],
              ),
              TextFieldForAuthScreens(
                hintText: locale.school,
              ),
              TextFieldForAuthScreens(
                hintText: locale.phoneNumber,
              ),

              TextFieldForAuthScreens(
                hintText: locale.emailAddress,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFieldForAuthScreens(
                      hintText: locale.createPassword,
                      margin: EdgeInsets.only(left: 32, right: 4, top: 4),
                    ),
                  ),
                  Expanded(
                    child: TextFieldForAuthScreens(
                      hintText: locale.confirmPassword,
                      margin: EdgeInsets.only(right: 32, left: 4, top: 4),
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: locale.signUp,
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.home);
                },
              ),

              RichText(
                text: TextSpan(
                    text: locale.alreadyRegistered,
                    style: theme.textTheme.subtitle1!.copyWith(color: textColor),
                    children: [

                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushNamed(context, PageRoutes.signIn);
                          },
                          text: ' ' + locale.signInNow!,
                          style: theme.textTheme.subtitle1!
                              .copyWith(color: theme.primaryColor))
                    ]),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
