import 'package:dio/dio.dart';
import 'package:m_dharura/helper/base_dio.dart';
import 'package:m_dharura/helper/base_response.dart';

class TaskApi extends BaseDio {
  Future<Response<BaseResponse>> create(Map<String, dynamic> data) => post('v1/task', data: data);

  Future<Response<BaseResponse>> retrieve(Map<String, dynamic> query) => get('v1/task', queryParameters: query);

  Future<Response<BaseResponse>> downloadTasks(Map<String, dynamic> query) => get('v1/task/download', queryParameters: query);

  Future<Response<BaseResponse>> updateForm(String signalId, String type, String subType, dynamic data, {String? version}) =>
      put('${version ?? 'v1'}/task/$signalId/$type/$subType', data: data);

  Future<Response<BaseResponse>> reportPmebs(String unitId, Map<String, dynamic> data) => post('v1/task/pmebs/$unitId', data: data);

  Future<Response<BaseResponse>> requestPmebs(String signalId, String unitId, Map<String, dynamic> data) =>
      put('v1/task/$signalId/pmebs/request/$unitId', data: data);
}
