import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class RoleApi extends BaseDio {
  Future<Response<BaseResponse>> retrieve(Map<String, dynamic> query) =>
      get('v1/role', queryParameters: query);

  Future<Response<BaseResponse>> update(
          String roleId, Map<String, dynamic> data) =>
      put('v1/role/$roleId', data: data);

  Future<Response<BaseResponse>> remove(String roleId) =>
      delete('v1/role/$roleId');
}
