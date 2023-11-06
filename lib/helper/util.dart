import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:m_dharura/helper/base_response.dart';

class Util {
  static url(String url) async {
    try {
      await canLaunchUrl(Uri.parse(url))
          ? await launchUrl(Uri.parse(url))
          : throw 'Oops! Retry';
    } catch (e) {
      toast(e);
    }
  }

  static call(String? phoneNumber) async {
    Util.url('tel:$phoneNumber');
  }

  static sms(String phoneNumber, String message) async {
    try {
      var compressedMessage = message.replaceAll('"', '\'');

      await Util.url('sms:$phoneNumber?body=$compressedMessage');
    } catch (e) {
      try {
        await Clipboard.setData(ClipboardData(text: message));

        toast('Message copied. Open SMS app and send to $phoneNumber');
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  static String toast(
    e, {
    show = true,
    String? title,
    TextButton? button,
  }) {
    String message = 'Oops! Retry';

    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.sendTimeout:
          message = 'Request took too long. Retry';
          break;
        case DioExceptionType.receiveTimeout:
          message = 'Response took too long. Retry';
          break;
        case DioExceptionType.cancel:
          message = 'Request cancelled. Retry';

          show = false;

          break;
        case DioExceptionType.connectionTimeout:
          message = 'Connection timeout. Retry';
          break;
        case DioExceptionType.badCertificate:
          message = 'Bad certificate. Retry';
          break;
        case DioExceptionType.badResponse:
          if (e.response?.data is BaseResponse) {
            try {
              message =
                  '${(e.response?.data as BaseResponse?)?.error?.message}';
            } catch (e) {
              message = 'Bad response. Retry';
            }
          } else {
            message = 'Bad response. Retry';
          }
          break;
        case DioExceptionType.connectionError:
          message = 'Connection error. Retry';
          break;
        case DioExceptionType.unknown:
          message = 'Unknown error. Retry';
          break;
      }
    } else if (e is PlatformException) {
      message = e.message ?? e.toString();
    } else {
      message = e.toString();
    }

    if (kDebugMode) {
      print('Toast: $e');
    }

    if (show && !Get.isSnackbarOpen) {
      if (title == null && button == null) {
        Get.rawSnackbar(
          message: message,
          snackPosition: SnackPosition.TOP,
          mainButton: button,
          backgroundColor: Colors.black,
        );
      } else {
        Get.snackbar(
          title ?? 'Notification',
          message,
          snackPosition: SnackPosition.TOP,
          mainButton: button,
          colorText: Colors.white,
          backgroundColor: Colors.black,
          margin: EdgeInsets.zero,
          borderRadius: 0,
        );
      }
    }

    return message;
  }

  static String formatPhoneNumber(String? phoneNumber) => phoneNumber == null
      ? ''
      : phoneNumber.startsWith('+254')
          ? '0${phoneNumber.substring(4)}'
          : phoneNumber;

  static String formatDate(DateTime? dateTime,
          {bool withTime = false, bool timeOnly = false}) =>
      dateTime == null
          ? ''
          : timeOnly
              ? DateFormat('h:mm aaa').format(dateTime.toLocal())
              : DateFormat('EEE d MMM yyyy${withTime ? '  h:mm aaa' : ''}')
                  .format(dateTime.toLocal());

  static String toTime(int? hour) => hour == null
      ? ''
      : '${hour == 0 ? 12 : hour - 11 < 1 ? hour : hour - 12 == 0 ? 12 : hour - 12}:00 ${hour < 11 ? 'AM' : 'PM'}';

  static String toDay(int day) =>
      ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][day];
}
