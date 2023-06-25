import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormStringField extends FormField<String> {
  FormStringField({
    super.key,
    required TextEditingController controller,
    required TextStyle style,
  }) : super(
          builder: (state) {
            FormStringFieldState s = state as FormStringFieldState;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF00000)),
                borderRadius: BorderRadius.all(Radius.circular(1.w)),
              ),
              padding: EdgeInsets.all(4.w),
              margin: EdgeInsets.all(4.w),
              child: EditableText(
                  controller: controller,
                  focusNode: s.focusNode,
                  style: style,
                  cursorColor: s.cursorColor,
                  backgroundCursorColor: s.backgroundCursorColor),
            );
          },
        );

  @override
  FormFieldState<String> createState() => FormStringFieldState();
}

class FormStringFieldState extends FormFieldState<String> {
  FocusNode focusNode = FocusNode();
  Color cursorColor = const Color(0xFF4499FF);
  Color backgroundCursorColor = const Color(0xFF000000);
}
