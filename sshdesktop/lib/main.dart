import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sshdesktop/page_route.dart';
import 'package:sshdesktop/pages/error_page.dart';
import 'package:sshdesktop/pages/home_page.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(800, 500),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return CupertinoApp.router(
          routerConfig: _router,
          title: 'SSH Desktop',
          theme: const CupertinoThemeData(
            brightness: Brightness.light,
            primaryColor: CupertinoColors.activeBlue,
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
