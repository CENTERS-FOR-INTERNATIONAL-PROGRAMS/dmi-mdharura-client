import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade200,
      height: 1,
      thickness: 1,
    );
  }
}
