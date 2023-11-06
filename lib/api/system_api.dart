import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class SystemApi extends BaseDio {
  Future<Response<BaseResponse>> ping() => get('v1/system');
}
