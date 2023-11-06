import 'package:flutter/material.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/user.dart';

class TaskFormItemWidget extends StatelessWidget {
  final String title;
  final DateTime? date;
  final User? user;
  final Function? onClick;
  final String? actionText;

  const TaskFormItemWidget(
      {Key? key,
      required this.title,
      required this.date,
      required this.user,
      required this.onClick,
      this.actionText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Wrap(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    date == null
                        ? Container()
                        : Text(
                            Util.formatDate(
                              date,
                              withTime: true,
                            ),
                          ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: user == null
                          ? Text(
                              'Pending',
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          : GestureDetector(
                              onTap: () => Util.call(user!.phoneNumber),
                              child: Text(
                                '${user!.displayName}, ${Util.formatPhoneNumber(user!.phoneNumber)}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              if (onClick != null)
                const SizedBox(
                  width: 16,
                ),
              if (onClick != null)
                ElevatedButton(
                  onPressed: () async => await onClick!(),
                  style: actionText != null
                      ? ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                        )
                      : const ButtonStyle(),
                  child: Text(actionText ?? 'View'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
