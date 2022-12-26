import 'package:flutter/material.dart';
import 'package:sizedemo/widgets/circle_layout.dart';
import 'package:sizedemo/widgets/nav_scaffold.dart';

class ContentItem extends StatelessWidget {
  final String text;

  final double childSize;

  const ContentItem(this.text, this.childSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(childSize / 2.0),
      child: InkWell(
        radius: childSize / 2.0,
        customBorder: CircleBorder(),
        onTap: () {},
        child: Container(
          width: childSize,
          height: childSize,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePage extends StatefulWidget {
  const CirclePage({super.key});

  @override
  State<StatefulWidget> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  List<String> customLayoutId = ["0", "1", "2", "3"].toList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double childSize = 66;
    return NavScaffold(
      body: Center(
        child: CustomMultiChildLayout(
          delegate: CircleLayoutDelegate(customLayoutId,
              childSize: Size(childSize, childSize),
              center: Offset(
                size.width / 2,
                size.height / 2,
              )),
          children: [
            for (var item in customLayoutId)
              LayoutId(id: item, child: ContentItem(item, childSize))
          ],
        ),
      ),
    );
  }
}
