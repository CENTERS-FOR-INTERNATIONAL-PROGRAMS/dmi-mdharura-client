import 'package:flutter/material.dart';
import 'package:m_dharura/ui/_/progress_widget.dart';

class SelectWidget extends StatelessWidget {
  final String question;
  final int position;
  final int total;
  final List<String> values;
  final List<String> options;
  final List<String> labels;
  final Function? onChanged;

  const SelectWidget(
      {Key? key,
      required this.question,
      required this.options,
      this.position = 0,
      this.total = 1,
      this.values = const [],
      this.labels = const [],
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProgressWidget(position: position, total: total, question: question),
        const SizedBox(
          height: 32,
        ),
        if (options.isNotEmpty)
          ...options.map((e) {
            int index = options.indexWhere((element) => e == element);

            if (index < 0) return Container();

            return GestureDetector(
              onTap: () {
                if (onChanged == null) return;
                onChanged!(options[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: values.contains(options[index])
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        child: Center(
                          child: Text(
                            labels.isNotEmpty
                                ? labels[index].toUpperCase()
                                : (index + 1).toString(),
                            style: values.contains(options[index])
                                ? const TextStyle(color: Colors.white)
                                : const TextStyle(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        options[index],
                        style: values.contains(options[index])
                            ? const TextStyle(color: Colors.white)
                            : const TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
