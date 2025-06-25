import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/core/helper/current_flavor.dart';
import 'package:flutter_starter_template/core/helper/extension.dart';
import 'package:flutter_starter_template/core/local/secure_storage_helper.dart';
import 'package:flutter_starter_template/core/local/shared_prefrence.dart';
import 'package:flutter_starter_template/core/network/api_sevices/dio_factory.dart';
import 'package:flutter_starter_template/core/network/api_sevices/refresh_token_model.dart';
import 'package:flutter_starter_template/core/network/urls/api_constants%20.dart';
import 'package:flutter_starter_template/core/routing/screens_names.dart';
import 'package:flutter_starter_template/main_development.dart';
import 'package:flutter_starter_template/main_production.dart';

class ApiServices {
  final DioFactory dioFactory;
  late final Dio dio;

  ApiServices(this.dioFactory) {
    dio = DioFactory.getDio();
  }

  BuildContext? get currentContext =>
      CurrentFlavor.isDev
          ? navigatorKeyDev.currentContext
          : navigatorKeyPro.currentContext;

  Future<List> get({
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? local,
    String? token,
  }) async {
    try {
      final response = await dio.get(
        baseUrl,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            'Authorization': await AppSecureStorageHelper.getToken(
              SharedPrefKeys.token,
            ),
            'local': local ?? "",
          },
        ),
      );
      return response.data;
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getMap({
    required String baseUrl,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    String? local,
  }) async {
    try {
      final response = await dio.get(
        baseUrl,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Authorization': await AppSecureStorageHelper.getToken(
              SharedPrefKeys.token,
            ),
            'local': local ?? "",
          },
        ),
      );

      return response.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        final newToken = await refreshToken();
        if (!newToken.isNullOrEmpty()) {
          return await getMap(
            baseUrl: baseUrl,
            queryParameters: queryParameters,
            data: data,
            local: local,
            token: newToken,
          );
        } else {
          currentContext?.pushNamedAndRemoveUntil(
            ScreensNames.login,
            predicate: (route) => false,
          );
        }
      }
      log("GET Map Error: $e");
      rethrow;
    }
  }

  Future<Response<dynamic>> post({
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
    String? token,
  }) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers:
              headers ??
              {
                'Authorization': await AppSecureStorageHelper.getToken(
                  SharedPrefKeys.token,
                ),
              },
        ),
      );
      return response;
    } on DioException catch (e) {
      log("POST Error: $e");
      rethrow;
    }
  }

  Future<Response<dynamic>> patch({
    required String baseUrl,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
    String? token,
  }) async {
    try {
      final response = await dio.patch(
        baseUrl,
        data: data,
        queryParameters: queryParameters ?? {},
        options: Options(
          headers:
              headers ??
              {
                'Authorization': await AppSecureStorageHelper.getToken(
                  SharedPrefKeys.token,
                ),
              },
        ),
      );
      return response;
    } on DioException catch (e) {
      log("PATCH Error: $e");

      rethrow;
    }
  }

  Future<Response<dynamic>> put({
    required String baseUrl,
    Map<String, dynamic>? patamerters,
    Map<String, dynamic>? data,
  }) async {
    try {
      final response = await dio.put(
        baseUrl,
        queryParameters: patamerters,
        data: data,
        options: Options(
          headers: {
            'Authorization': await AppSecureStorageHelper.getToken(
              SharedPrefKeys.token,
            ),
          },
        ),
      );
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<void> deleteById({
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    required String token,
    required String baseUrl,
  }) async {
    try {
      await dio.delete(
        baseUrl,
        data: data,
        queryParameters: queryParameters ?? {},
        options: Options(headers: {'Authorization': token}),
      );
    } on DioException catch (e) {
      log("DELETE Error: $e");
      _handleDioError(e);
    }
  }

  Future<String?> refreshToken() async {
    try {
      final response = await post(
        baseUrl: ApiConstants.refreshTokenUrl,
        data: {
          "refreshToken": await AppSecureStorageHelper.getToken(
            SharedPrefKeys.refreshToken,
          ),
        },
      );

      final newToken = RefreshTokenModel.fromJson(response.data);
      await AppSecureStorageHelper.saveToken(
        SharedPrefKeys.token,
        "bearer ${newToken.accessToken}",
      );
      await AppSecureStorageHelper.saveToken(
        SharedPrefKeys.refreshToken,
        newToken.refreshToken,
      );
      log("Access token ${newToken.accessToken}");
      log("Refresh token ${newToken.refreshToken}");
      return newToken.accessToken;
    } on DioException catch (e) {
      if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
        await AppSecureStorageHelper.deleteToken(SharedPrefKeys.refreshToken);
        await AppSecureStorageHelper.deleteToken(SharedPrefKeys.token);

        if (currentContext != null) {
          Navigator.pushNamedAndRemoveUntil(
            currentContext!,
            ScreensNames.login,
            (route) => false,
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Handles Dio errors and extracts server error messages
  void _handleDioError(DioException e) {
    if (e.response != null) {
      // Extract the error message from the server response
      final errorMessage =
          e.response?.data['message'] ?? 'An unknown error occurred';
      throw Exception(errorMessage); // Throw the error message
    } else {
      // Handle network or other Dio errors
      throw Exception(e.message ?? 'An unknown error occurred');
    }
  }
}
