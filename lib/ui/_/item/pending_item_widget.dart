import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/model/pending.dart';

class PendingItemWidget extends StatelessWidget {
  final Pending pending;
  final Function onDelete;

  const PendingItemWidget(
      {Key? key, required this.pending, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          pending.signalId,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle:
            Text('${pending.type.toUpperCase()} ${pending.subType.capitalize}'),
        trailing: Wrap(
          children: [
            ElevatedButton(
              onPressed: () async => await onDelete(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
              ),
              child: const Text('Delete'),
            ),
            const SizedBox(
              width: 16,
            ),
            ElevatedButton(
              onPressed: () async => await Get.toNamed(
                  '${Routes.kForm}${pending.type}/${pending.subType}',
                  arguments: {'signalId': pending.signalId}),
              child: const Text('Edit'),
            ),
          ],
        ),
      );
}
