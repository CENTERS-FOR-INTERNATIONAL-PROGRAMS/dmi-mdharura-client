import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class AnalyticsApi extends BaseDio {
  Future<Response<BaseResponse>> retrieve(Map<String, dynamic> query) =>
      get('v3/analytics', queryParameters: query);
}
