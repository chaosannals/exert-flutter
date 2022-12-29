import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:windemo/page_routes.dart';
import 'package:windemo/pages/error_page.dart';
import 'package:windemo/pages/home_page.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: $appRoutes,
  errorPageBuilder: (context, state) => CustomTransitionPage(
    key: state.pageKey,
    child: ErrorPage(error: state.error),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(800, 500),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
          title: 'Windows Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
