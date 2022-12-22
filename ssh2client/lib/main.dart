import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ssh2client/page_route.dart';
// import 'package:ssh2client/pages/conf/conf_page.dart';
// import 'package:ssh2client/pages/conf/project_conf_page.dart';
// import 'package:ssh2client/pages/conf/ssh_conf_page.dart';
import 'package:ssh2client/pages/home_page.dart';
// import 'package:ssh2client/pages/star_page.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

// Page<dynamic> Function(BuildContext, GoRouterState) _buildPage(
//     Widget child
// ) {
//   return (context, state) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       child: child,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child);
//       },
//     );
//   };
// }

final GoRouter _router = GoRouter(
  routes: $appRoutes,
  // routes: [
  //   GoRoute(
  //     name: 'home_page',
  //     path: '/',
  //     pageBuilder: _buildPage(const HomePage()),
  //     routes: [
  //       GoRoute(
  //           name: 'conf_page',
  //           path: 'conf',
  //           pageBuilder: _buildPage(const ConfPage()),
  //           routes: [
  //             GoRoute(
  //               name: 'conf_project_page',
  //               path: 'project',
  //               pageBuilder: (context, state) {
  //                 return CustomTransitionPage(
  //                   key: state.pageKey,
  //                   child: const ProjectConfPage(
  //                     // id: state.queryParams['id'],
  //                     id: 1,
  //                   ),
  //                   transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //                     return FadeTransition(opacity: animation, child: child);
  //                   },
  //                 );
  //               },
  //             ),
  //             GoRoute(
  //               name: 'conf_ssh_page',
  //               path: 'ssh',
  //               pageBuilder: _buildPage(const SshConfPage()),
  //             ),
  //           ]
  //       ),
  //       GoRoute(
  //         name: 'star_page',
  //         path: 'star',
  //         pageBuilder: _buildPage(const StarPage()),
  //       ),
  //     ],
  //   ),
  // ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),// 2021 有bug.
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
        );
      },
      child: const HomePage(),
    );
  }
}
