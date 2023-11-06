import 'package:flutter/material.dart';
import 'package:m_dharura/ui/_/progress_widget.dart';

enum InputType {
  kText,
  kInt,
  kDouble,
}

class InputWidget extends StatelessWidget {
  final String question;
  final String? hintText;
  final int position;
  final int total;
  final String? value;
  final Function? onChanged;
  final InputType inputType;
  final int? lines;
  final TextCapitalization? textCapitalization;

  const InputWidget({
    Key? key,
    required this.question,
    required this.value,
    this.hintText,
    this.position = 0,
    this.total = 1,
    this.onChanged,
    this.inputType = InputType.kText,
    this.lines,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(
        text: inputType != InputType.kText && value == 'null' ? null : value);

    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProgressWidget(position: position, total: total, question: question),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: onChanged == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Text(value == null ? '' : value.toString()),
                )
              : TextField(
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                  ),
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.sentences,
                  minLines: lines ?? (inputType != InputType.kText ? 1 : 4),
                  maxLines: lines ?? (inputType != InputType.kText ? 1 : 8),
                  readOnly: onChanged == null,
                  onChanged: (value) {
                    if (onChanged == null) return;

                    if (inputType != InputType.kText) {
                      try {
                        onChanged!(inputType == InputType.kInt
                            ? int.parse(value)
                            : double.parse(value));
                      } catch (e) {
                        onChanged!(null);
                      }
                    } else {
                      onChanged!(value);
                    }
                  },
                  controller: controller,
                  keyboardType: inputType != InputType.kText
                      ? TextInputType.number
                      : TextInputType.multiline,
                ),
        ),
      ],
    );
  }
}
