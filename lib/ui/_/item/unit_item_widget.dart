import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/constant/routes.dart';
import 'package:m_dharura/model/unit.dart';

class UnitItemWidget extends StatelessWidget {
  final Unit unit;
  final bool isPrimary;
  final Function? onRemove;
  final Function? onStateChanged;

  const UnitItemWidget(
      {Key? key,
      required this.unit,
      this.isPrimary = true,
      this.onRemove,
      this.onStateChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        color: unit.state == 'test' ? Colors.grey.shade50 : Colors.white,
      ),
      child: ListTile(
        title: Text(
          unit.name,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          '${unit.state.capitalize} · ${unit.type}${unit.type == 'Health facility' ? ' · MFL ${unit.code}' : ''}',
        ),
        onLongPress: () async => _onTap(context),
        onTap: () async => await Get.toNamed('${Routes.kUnit}${unit.id}'),
        trailing: isPrimary
            ? IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () async => await _onTap(context),
              )
            : null,
      ),
    );
  }

  _onTap(BuildContext context) async {
    await Get.bottomSheet(
      SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  unit.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                subtitle: Text(
                  '${unit.state.capitalize} · ${unit.type}${unit.type == 'Health facility' ? ' · MFL ${unit.code}' : ''}',
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kUnit}${unit.id}');
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.open_in_new_outlined),
                title: Text(
                  'Open in new tab',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kUnit}${unit.id}');
                },
              ),
              ListTile(
                leading: const Icon(Icons.stacked_bar_chart),
                title: Text(
                  'View dashboard',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () async {
                  Get.back();

                  await Get.toNamed('${Routes.kDashboard}${unit.id}');
                },
              ),
              if (unit.parent != null)
                ListTile(
                  leading: const Icon(Icons.call_made),
                  title: Text(
                    'View parent level',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () async {
                    Get.back();

                    await Get.toNamed('${Routes.kUnit}${unit.parent}');
                  },
                ),
              if (onStateChanged != null)
                SwitchListTile(
                  title: Text(
                    'State',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text('Currently in ${unit.state}'),
                  value: unit.state == 'live',
                  onChanged: (value) {
                    Get.back();

                    onStateChanged!(value);
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
                    Get.back();

                    onRemove!();
                  },
                ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
