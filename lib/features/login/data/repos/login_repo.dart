import 'package:complet_project/core/networking/api_service.dart';
import 'package:complet_project/features/login/data/models/login_request_body.dart';
import 'package:complet_project/features/login/data/models/login_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(LoginRequestBody body) async {
    try {
      final response = await _apiService.login(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
