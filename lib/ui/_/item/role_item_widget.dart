import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/constant/unit.dart';
import 'package:m_dharura/helper/util.dart';
import 'package:m_dharura/model/role.dart';
import 'package:m_dharura/ui/_/item/unit_item_widget.dart';

class RoleItemWidget extends StatelessWidget {
  final Role role;
  final Function? onRemove, onRoleChanged, onStatusChanged;
  final bool showManage;

  const RoleItemWidget(
      {Key? key,
      required this.role,
      this.onStatusChanged,
      this.onRoleChanged,
      this.onRemove,
      this.showManage = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          color: role.status == 'blocked' ? Colors.grey.shade50 : Colors.white,
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                role.user.displayName,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Text(
                  '${role.status.capitalize} · ${role.spot} · ${Util.formatPhoneNumber(role.user.phoneNumber)}'),
              onLongPress: () async => await _onTap(context),
              onTap: () async =>
                  await Get.toNamed('${Routes.kHistory}${role.user.id}'),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () async => await _onTap(context),
              ),
            ),
            if (showManage) ...[
              UnitItemWidget(
                unit: role.unit,
                isPrimary: false,
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Added: ${Util.formatDate(
                        role.createdAt,
                        withTime: true,
                      )}'),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: () async =>
                          await Get.toNamed('${Routes.kUnit}${role.unit.id}'),
                      child: const Text('View'),
                    )
                  ],
                ),
              ),
            ],
          ],
        ),
      );

  _onTap(BuildContext context) async {
    await Get.bottomSheet(
      SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  role.user.displayName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  '${role.status.capitalize} · ${role.spot} · ${Util.formatPhoneNumber(role.user.phoneNumber)}',
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kHistory}${role.user.id}');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.history_outlined),
                title: Text(
                  'View history',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kHistory}${role.user.id}');
                },
              ),
              ListTile(
                leading: const Icon(Icons.call),
                title: Text(
                  'Call',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () async {
                  Get.back();

                  await Util.call(role.user.phoneNumber);
                },
              ),
              if (onRoleChanged != null)
                ListTile(
                  leading: const Icon(Icons.edit_outlined),
                  title: Text(
                    'Change role',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () async {
                    Get.back();

                    _onRole(context);
                  },
                ),
              if (onStatusChanged != null)
                SwitchListTile(
                  title: Text(
                    'Status',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text('Currently ${role.status}'),
                  value: role.status == 'active',
                  onChanged: (value) {
                    Get.back();

                    onStatusChanged!(value);
                  },
                ),
              if (onRemove != null) const Divider(),
              if (onRemove != null)
                ListTile(
                  title: Text(
                    'Remove',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.red,
                        ),
                  ),
                  onTap: () {
                    if (onRemove != null) {
                      Get.back();

                      onRemove!();
                    }
                  },
                ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  _onRole(BuildContext context) async {
    await Get.bottomSheet(
      SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  role.user.displayName,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: const Text(
                  'Select their new role',
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kHistory}${role.user.id}');
                },
              ),
              const Divider(),
              ...spots(role.unit.type)
                  .map(
                    (e) => ListTile(
                      leading: Icon(e == role.spot
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                      title: Text(
                        '$e${e == role.spot ? ' (Current)' : ''}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onTap: () async {
                        Get.back();

                        onRoleChanged!(e);
                      },
                    ),
                  )
                  .toList(),
              const Divider(),
              ListTile(
                title: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.red,
                      ),
                ),
                onTap: () => Get.back(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
