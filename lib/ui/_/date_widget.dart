import 'package:flutter/material.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/ui/_/progress_widget.dart';

class DateWidget extends StatelessWidget {
  final String question;
  final String? hintText;
  final int position;
  final int total;
  final DateTime? value;
  final Function(DateTime?)? onChanged;

  const DateWidget({
    Key? key,
    required this.question,
    required this.value,
    this.hintText,
    this.position = 0,
    this.total = 1,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProgressWidget(position: position, total: total, question: question),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: GestureDetector(
            onTap: () async {
              if (onChanged == null) return;

              var selectedDateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year - 10),
                lastDate: DateTime.now(),
                initialDatePickerMode: DatePickerMode.day,
              );

              if (selectedDateTime != null) onChanged!(selectedDateTime);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                value == null && hintText != null
                    ? hintText!
                    : Util.formatDate(value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
