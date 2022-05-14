import 'package:flutter/material.dart';
import 'package:kdemy/Auth/ForgotPassword/reset_password.dart';
import 'package:kdemy/Auth/SignIn/sign_in.dart';
import 'package:kdemy/Auth/SignUp/sign_up.dart';
import 'package:kdemy/Home/category_page.dart';
import 'package:kdemy/Home/home.dart';
import 'package:kdemy/Locale/change_language.dart';
import 'package:kdemy/Others/Bookmarked/bookmarked.dart';
import 'package:kdemy/Others/CourseInfo/course_info.dart';
import 'package:kdemy/Others/LectureInfo/lecture_info.dart';
import 'package:kdemy/Others/LecturerProfile/lecturer_profile.dart';
import 'package:kdemy/Others/Notifications/notifications.dart';
import 'package:kdemy/Others/OngoingCourses/ongoing_courses.dart';
import 'package:kdemy/Others/Profile/profile.dart';
import 'package:kdemy/Others/Search/search.dart';
import 'package:kdemy/Others/Support/support.dart';
import 'package:kdemy/UserExperence/user_experience.dart';

class PageRoutes {
  static const String signIn = 'signIn';
  static const String signUp = 'sign_up';
  static const String resetPassword = 'reset_password';
  static const String home = 'home';
  static const String search = 'search';
  static const String categoryPage = 'category_page';
  static const String userExperience = 'userExperience';
  static const String bookmarked = 'bookmarked';
  static const String notifications = 'notifications';
  static const String profile = 'profile';
  static const String support = 'support';
  static const String ongoingCourses = 'ongoingCourses';
  static const String courseInfo = 'courseInfo';
  static const String lecturerProfile = 'lecturerProfile';
  static const String lecturerInfo = 'lecturerInfo';
  static const String changeLanguage = 'changeLanguage';

  Map<String, WidgetBuilder> routes() {
    return {
      signIn: (context) => SignInUI(),
      signUp: (context) => SignUpUI(),
      resetPassword: (context) => ResetPassword(),
      home: (context) => HomePage(),
      search: (context) => SearchPage(),
      categoryPage: (context) => CategoryPage(),
      userExperience: (context) => UserExperiencePage(),
      bookmarked: (context) => Bookmarked(),
      notifications: (context) => Notifications(),
      profile: (context) => Profile(),
      support: (context) => Support(),
      ongoingCourses: (context) => OngoingCourses(),
      courseInfo: (context) => CourseInfo(),
      lecturerProfile: (context) => LecturerProfile(),
      lecturerInfo: (context) => LectureInfo(),
      changeLanguage: (context) => SelectLanguage(),
    };
  }
}
