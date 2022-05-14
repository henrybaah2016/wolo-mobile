import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Auth/ForgotPassword/reset_password.dart';
import 'package:kdemy/Auth/ForgotPassword/reset_password.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Components/textfieldforauthscreens.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

import '../ForgotPassword/reset_password.dart';
import '../ForgotPassword/reset_password.dart';

class SignInUI extends StatefulWidget {
  @override
  _SignInUIState createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Expanded(
                  flex: 2,
                  child: Image.asset('assets/wolo_logo_update.png',
                    scale: 3.5,
                  ),
                ),

                Text(
                  'Sign in with Email Address',
                  style: theme.textTheme.subtitle1!.copyWith(
                      color: theme.hintColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldForAuthScreens(
                  hintText: locale.emailAddress,
                  color: textFieldColor,
                ),
                TextFieldForAuthScreens(
                  hintText: locale.password,
                  suffixText: locale.forgot,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 32),
                      child: new Row(
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.pushNamed(context, PageRoutes.resetPassword);
                                },
                                text: 'Forgot Password?',
                                style: theme.textTheme.subtitle1!
                                    .copyWith(color: theme.primaryColor)),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),

                CustomButton(
                  text: locale.signIn,
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.home);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: locale.notRegisteredYet,
                      style:
                          theme.textTheme.subtitle1!.copyWith(color: textColor),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, PageRoutes.signUp);
                            },
                            text: ' ' + locale.signUpNow!,
                            style: theme.textTheme.subtitle1!
                                .copyWith(color: theme.primaryColor))
                      ]),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
