import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sshdesktop/pages/home_page.dart';
import 'package:sshdesktop/pages/project_page.dart';
import 'package:sshdesktop/pages/ssh_page.dart';

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
    TypedGoRoute<ProjectPageRoute>(
      path: 'project',
    ),
    TypedGoRoute<SshPageRoute>(
      path: 'ssh',
    ),
  ],
)
class HomePageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const HomePage());
  }
}

class ProjectPageRoute extends GoRouteData {
  late final int id;
  
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const ProjectPage());
  }
}

class SshPageRoute extends GoRouteData {
  late final int id;
  
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const SshPage());
  }
}
