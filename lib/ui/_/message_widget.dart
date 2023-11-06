import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_dharura/ui/_/responsive_widget.dart';

class MessageWidget extends ResponsiveWidget {
  final String title, subtitle, description;
  final bool adjust;

  MessageWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.description,
      this.adjust = true})
      : super(key: key);

  @override
  bool get shouldAdjust => adjust;

  @override
  Widget? tablet() => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  right: 32, left: 32, top: 64, bottom: 16),
              child: Center(
                child: Text(
                  subtitle,
                  style:
                      Theme.of(screen.context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(screen.context).primaryColor,
                          ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 32, left: 32, bottom: 48),
              child: Center(
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 32, left: 32, bottom: 32),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Go back'),
                ),
              ),
            )
          ],
        ),
      );
}
