import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
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
)
class HomePageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const HomePage());
  }
}
