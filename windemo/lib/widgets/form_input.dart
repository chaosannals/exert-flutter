import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// 自定义输入需要处理很多事件和游标，以下 FormInput 不完整示例。
/// 可以参考 package:flutter/widgets.dart 的 EditableText
class FormInput extends StatelessWidget {
  final String value;
  final void Function(String) onChanged;

  const FormInput({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onKey: (focusNode, event) {
          print(
              "c: ${event.character} k: ${event.logicalKey} ${LogicalKeyboardKey.delete}");

          if (event.isKeyPressed(LogicalKeyboardKey.backspace) ||
              event.isKeyPressed(LogicalKeyboardKey.delete)) {
            if (value.isNotEmpty) {
              onChanged(value.substring(0, value.length - 1));
            }
            return KeyEventResult.handled;
          }

          if (event.character != null) {
            onChanged(value + event.character!);
            return KeyEventResult.handled;
          }

          // print("k: ${event.logicalKey} ${LogicalKeyboardKey.delete}");

          return KeyEventResult.ignored;
        },
        child: Builder(
          builder: (context) {
            final FocusNode focusNode = Focus.of(context);
            final bool hasFocus = focusNode.hasFocus;
            final Border border = hasFocus
                ? Border.all()
                : Border.all(color: const Color(0xFFFFFFFF));

            return GestureDetector(
              onTap: () {
                if (!hasFocus) {
                  focusNode.requestFocus();
                  // FocusScope.of(context).requestFocus(focusNode);
                  SystemChannels.textInput.invokeMethod<void>('TextInput.show');
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: border,
                ),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF000000),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
