import 'package:m_dharura/model/user.dart';

class TaskFormItem {
  String title;
  DateTime? date;
  User? user;
  Function? onClick;

  TaskFormItem({
    required this.title,
    required this.date,
    required this.user,
    required this.onClick,
  });
}
