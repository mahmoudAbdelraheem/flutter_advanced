import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/helpers/extentions.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_advanced/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/shared_pref_helper.dart';
import 'core/helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //! to fix the screenutil issue (text being hidden) in production mode
  await ScreenUtil.ensureScreenSize();
  await checkUserLoggedIn();

  runApp(DocApp(appRouter: AppRouter()));
}

Future<void> checkUserLoggedIn() async {
  String userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  isUserLoggedIn = !userToken.isNullOrEmpty();
}

// to run release version use this command
// flutter run --release -t lib/main_production.dart --flavor production
// to build andriod apk use this command
// flutter build apk --release -t lib/main_production.dart --flavor production
// flutter build apk --flavor Production -t lib/main_production.dart