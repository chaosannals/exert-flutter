import 'package:flutter/material.dart';

class ToolItem {
  IconData icon;

  ToolItem(this.icon);
}

class ToolIndexPane extends StatelessWidget {
  final List<ToolItem> tools;
  final ValueChanged<int> onClickItem;

  const ToolIndexPane(this.tools, {Key? key, required this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        //runAlignment: WrapAlignment.center,
        //crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: tools.asMap().keys.map((i) {
          var item = tools[i];
          return FractionallySizedBox(
            widthFactor: 0.33,
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((status) {
                        return status.contains(MaterialState.pressed)
                            ? Colors.grey
                            : Colors.white;
                      }),
                      backgroundColor:
                          MaterialStateProperty.resolveWith((status) {
                        return status.contains(MaterialState.pressed)
                            ? Colors.lightBlue
                            : Colors.blue;
                      }),
                    ),
                    child: Icon(
                      item.icon,
                      size: 50,
                    ),
                    onPressed: () {
                      onClickItem(i);
                    },
                  ),
                ),
              ),
            ),
          );
        }).toList());
  }
}
