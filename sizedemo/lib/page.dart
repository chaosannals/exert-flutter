import 'package:flutter/widgets.dart';

class MyRoute extends PageRoute {
  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;
  @override
  final bool opaque;
  @override
  final Color? barrierColor;
  @override
  final String? barrierLabel;
  @override
  final bool maintainState;

  MyRoute({
    required this.builder,
    this.transitionDuration = const Duration(microseconds: 44),
    this.opaque = true,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
     return FadeTransition( 
       opacity: animation,
       child: builder(context),
     );
  }
}
