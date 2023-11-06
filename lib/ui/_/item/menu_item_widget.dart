import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItemWidget extends StatelessWidget {
  final String route;
  final String title;
  final String subtitle;
  final Widget icon;
  final bool isForm;
  const MenuItemWidget({
    Key? key,
    required this.route,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isForm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.lightGreen.shade300,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListTile(
        onTap: () async => await Get.toNamed(route),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        title: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen,
                  ),
            ),
          ],
        ),
        subtitle: Text(
          subtitle,
        ),
        trailing: ElevatedButton(
          onPressed: () async => await Get.toNamed(route),
          child: Text(isForm ? 'Start' : 'View'),
        ),
      ),
    );
  }
}
