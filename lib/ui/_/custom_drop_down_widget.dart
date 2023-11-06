import 'package:flutter/material.dart';

class CustomDropDownWidget extends StatelessWidget {
  final Function(String?) onChanged;
  final String labelText;
  final String? value;
  final List<String> items;

  const CustomDropDownWidget({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.value,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.only(
        top: 8,
        left: 12,
        right: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (value != null)
            Text(
              labelText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          DropdownButton<String>(
            onChanged: onChanged,
            hint: Text(labelText),
            value: value,
            items: items
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(
                      e,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            underline: Container(),
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}
