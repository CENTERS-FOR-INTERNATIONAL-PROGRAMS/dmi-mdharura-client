import 'dart:convert';

import 'package:m_dharura/constant/env.dart';
import 'package:m_dharura/helper/base_response.dart';
import 'package:m_dharura/helper/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

_parseAndDecode(String response) {
  return BaseResponse.fromJson(jsonDecode(response));
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class BaseDio with DioMixin implements Dio {
  BaseDio() {
    httpClientAdapter = HttpClientAdapter();

    transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;

    interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));

    interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      try {
        String token = await Session.token();

        options.headers['authorization'] = 'Bearer $token';
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      // try {
      //   String? token = await FirebaseMessaging.instance.getToken();

      //   if (token != null) {
      //     options.headers['app-token'] = token;
      //   }
      // } catch (e) {
      //   if (kDebugMode) {
      //     print(e);
      //   }
      // }

      try {
        var packageInfo = await PackageInfo.fromPlatform();

        options.headers['app-id'] = kAppId;
        options.headers['app-name'] = packageInfo.appName;
        options.headers['app-package-name'] = packageInfo.packageName;
        options.headers['app-version'] = packageInfo.version;
        options.headers['app-build-number'] = packageInfo.buildNumber;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }

      handler.next(options);
    }, onResponse: (response, handler) {
      handler.next(response);
    }, onError: (error, handler) async {
      if (error.response?.statusCode == 401) await Session.logout();

      handler.next(error);
    }));
  }

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: kBaseApiUrl,
        followRedirects: false,
        connectTimeout: const Duration(
          seconds: 60,
        ),
        sendTimeout: const Duration(
          seconds: 60,
        ),
        receiveTimeout: const Duration(
          seconds: 60,
        ),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
      );
}
