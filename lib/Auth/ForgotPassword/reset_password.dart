import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kdemy/Assets/assets.dart';
import 'package:kdemy/Components/custombutton.dart';
import 'package:kdemy/Components/textfieldforauthscreens.dart';
import 'package:kdemy/Locale/locales.dart';
import 'package:kdemy/Routes/routes.dart';
import 'package:kdemy/Theme/colors.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                  'Enter your new password to reset',
                  style: theme.textTheme.subtitle1!.copyWith(
                      color: theme.hintColor, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldForAuthScreens(
                  hintText: locale.newPassword,
                  color: textFieldColor,
                ),

                TextFieldForAuthScreens(
                  hintText: locale.confirmPassword,
                  color: textFieldColor,
                ),
                CustomButton(
                  text: 'Reset Password',
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutes.signIn);
                  },
                ),
                SizedBox(
                  height: 10,
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
