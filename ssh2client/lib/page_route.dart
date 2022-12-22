import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ssh2client/pages/conf/conf_page.dart';
import 'package:ssh2client/pages/conf/project_conf_page.dart';
import 'package:ssh2client/pages/conf/ssh_conf_page.dart';
import 'package:ssh2client/pages/home_page.dart';
import 'package:ssh2client/pages/star_page.dart';

// 提供生成器定位 <filename>.g.dart
part 'page_route.g.dart';

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
  path: '/',
  routes: [
    TypedGoRoute<ConfPageRoute>(path: 'conf', routes: [
      TypedGoRoute<ProjectConfPageRoute>(path: 'project/:id'),
      TypedGoRoute<SshConfPageRoute>(path: 'ssh'),
    ]),
    TypedGoRoute<StarPageRoute>(
      path: 'star',
    ),
  ],
)
class HomePageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const HomePage());
  }
}

class ConfPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const ConfPage());
  }
}

class ProjectConfPageRoute extends GoRouteData {
  final int id;

  const ProjectConfPageRoute({
    required this.id,
  });

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: ProjectConfPage(
        id: id,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}

class SshConfPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const SshConfPage());
  }
}

class StarPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const StarPage());
  }
}
