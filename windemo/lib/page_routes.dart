import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:windemo/pages/anima/demo_1_page.dart';
import 'package:windemo/pages/anima/demo_2_page.dart';
import 'package:windemo/pages/anima/list_page.dart';
import 'package:windemo/pages/home_page.dart';

part 'page_routes.g.dart';

Page<dynamic> _buildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

@TypedGoRoute<HomePageRoute>(
  path: "/",
  routes: [
    TypedGoRoute<AnimationListPageRoute>(
      path: 'animation',
      routes: [
        TypedGoRoute<AnimaDemo1PageRoute>(
          path: '1',
        ),
        TypedGoRoute<AnimaDemo2PageRoute>(
          path: '2',
        ),
      ],
    )
  ],
)
class HomePageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const HomePage());
  }
}

class AnimationListPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const AnimationListPage());
  }
}

class AnimaDemo1PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const AnimaDemo1Page());
  }
}

class AnimaDemo2PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const AnimaDemo2Page());
  }
}
