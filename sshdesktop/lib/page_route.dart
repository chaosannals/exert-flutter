import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sshdesktop/pages/home_page.dart';
import 'package:sshdesktop/pages/project/detail_page.dart';
import 'package:sshdesktop/pages/project/list_page.dart';
import 'package:sshdesktop/pages/ssh/detail_page.dart';
import 'package:sshdesktop/pages/ssh/list_page.dart';

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
    TypedGoRoute<ProjectListPageRoute>(
      path: 'project',
      routes: [
        TypedGoRoute<ProjectPageRoute>(
          path: ':id',
        ),
      ],
    ),
    TypedGoRoute<SshListPageRoute>(
      path: 'ssh',
      routes: [
        TypedGoRoute<SshPageRoute>(
          path: ':id',
        ),
      ],
    ),
  ],
)
class HomePageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const HomePage());
  }
}

class ProjectListPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const ProjectListPage());
  }
}

class ProjectPageRoute extends GoRouteData {
  final int id;

  ProjectPageRoute(this.id);

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const ProjectPage());
  }
}

class SshListPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const SshListPage());
  }
}

class SshPageRoute extends GoRouteData {
  final int id;

  SshPageRoute(this.id);

  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const SshPage());
  }
}
