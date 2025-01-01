import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/app_router.dart';
import 'package:flutter_advanced/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  //! to fix the screenutil issue (text being hidden) in production mode
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(appRouter: AppRouter()));
}
