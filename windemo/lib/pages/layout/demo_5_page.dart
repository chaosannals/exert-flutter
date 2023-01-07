import 'package:flutter/material.dart';
import 'package:windemo/widgets/nav_scaffold.dart';

class LayoutDemo5Page extends StatefulWidget {
  const LayoutDemo5Page({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutDemo5PageState();
}

class _LayoutDemo5PageState extends State<LayoutDemo5Page> {
  final globalKey = GlobalKey<AnimatedListState>();
  final _words = <String>[];
  var counter = 4;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < counter; ++i) {
      _words.add("initial: $i"); // 被用作 ValueKey
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavScaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              IconButton(
                onPressed: () => onAdd(),
                icon: const Icon(Icons.add),
              ),
              Expanded(
                child: AnimatedList(
                  key: globalKey,
                  initialItemCount: _words.length,
                  // 每次删除或添加时，所有剩余组件都会被调用一次此方法。
                  itemBuilder: (BuildContext context, int index,
                      Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: buildItem(context, index),
                    );
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  // 此方法只是根据数据生成了一个显示用的项，可以说是无状态的。
  Widget buildItem(BuildContext context, int index) {
    var word = _words[index];
    return ListTile(
      key: ValueKey(word),
      title: Text(word),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => onRemove(context, index),
      ),
    );
  }

  void onAdd() {
    setState(() {
      var i = counter++;
      _words.add("no: $i"); // 被用作 ValueKey

      // 此处只需要保证 key 的数量，因为每次 _words 发生变化都是整个（itemBuilder 被遍历调用）重新生成。
      // 对照关系是通过各项 ValueKey 对应的。
      globalKey.currentState!.insertItem(_words.length - 1);
    });
  }

  void onRemove(BuildContext context, int index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        var item = buildItem(context, index); // 生成一个用于显示的组件（查了数组，所以要先于下一行的 removeAt）。
        _words.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1.0),
          ),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0.0,
            child: item,
          ),
        );
      });
    });
  }
}
