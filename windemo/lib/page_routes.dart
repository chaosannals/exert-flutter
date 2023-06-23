import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:windemo/pages/anima/demo_1_page.dart';
import 'package:windemo/pages/anima/demo_2_page.dart';
import 'package:windemo/pages/anima/demo_3.page.dart';
import 'package:windemo/pages/anima/list_page.dart';
import 'package:windemo/pages/form/demo_1_page.dart';
import 'package:windemo/pages/form/list_page.dart';
import 'package:windemo/pages/home_page.dart';
import 'package:windemo/pages/layout/demo_1_page.dart';
import 'package:windemo/pages/layout/demo_2_page.dart';
import 'package:windemo/pages/layout/demo_3_page.dart';
import 'package:windemo/pages/layout/demo_4_page.dart';
import 'package:windemo/pages/layout/demo_5_page.dart';
import 'package:windemo/pages/layout/demo_6_page.dart';
import 'package:windemo/pages/layout/list_page.dart';

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
    TypedGoRoute<LayoutDemoListPageRoute>(
      path: 'layout',
      routes: [
        TypedGoRoute<LayoutDemo1PageRoute>(path: '1'),
        TypedGoRoute<LayoutDemo2PageRoute>(path: '2'),
        TypedGoRoute<LayoutDemo3PageRoute>(path: '3'),
        TypedGoRoute<LayoutDemo4PageRoute>(path: '4'),
        TypedGoRoute<LayoutDemo5PageRoute>(path: '5'),
        TypedGoRoute<LayoutDemo6PageRoute>(path: '6'),
      ],
    ),
    TypedGoRoute<AnimationListPageRoute>(
      path: 'animation',
      routes: [
        TypedGoRoute<AnimaDemo1PageRoute>(
          path: '1',
        ),
        TypedGoRoute<AnimaDemo2PageRoute>(
          path: '2',
        ),
        TypedGoRoute<AnimaDemo3PageRoute>(
          path: '3',
        ),
      ],
    ),
    TypedGoRoute<FormListPageRoute>(
      path: 'form',
      routes: [
        TypedGoRoute<FormDemo1PageRoute>(
          path: '1',
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

////////////////////////////////////////////////////////////////////////////
class LayoutDemoListPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemoListPage());
  }
}

class LayoutDemo1PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo1Page());
  }
}

class LayoutDemo2PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo2Page());
  }
}

class LayoutDemo3PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo3Page());
  }
}

class LayoutDemo4PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo4Page());
  }
}

class LayoutDemo5PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo5Page());
  }
}

class LayoutDemo6PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const LayoutDemo6Page());
  }
}

/////////////////////////////////////////////////////////////////////////////
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

class AnimaDemo3PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const AnimaDemo3Page());
  }
}

////////////////////////////////////////////////////////////////////////////
class FormListPageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const FormListPage());
  }
}

class FormDemo1PageRoute extends GoRouteData {
  @override
  Page<dynamic> buildPage(BuildContext context, GoRouterState state) {
    return _buildPage(state, const FormDemo1Page());
  }
}
