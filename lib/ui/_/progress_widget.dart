import 'package:flutter/material.dart';

class ProgressWidget extends StatelessWidget {
  final int position;
  final int total;
  final String question;

  const ProgressWidget(
      {Key? key,
      required this.position,
      required this.total,
      required this.question})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
            '${position + 1 == 1 && total == 1 ? '' : '${position + 1}/$total: '}$question'),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: LinearProgressIndicator(
            value: (position + 1) / total,
          ),
        )
      ],
    );
  }
}
