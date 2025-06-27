import 'package:dio/dio.dart';

class DioHelper {
  //DIO INTERCEPTER
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://api.deezer.com",
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<dynamic> dioGet(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.get(endpoint, queryParameters: queryParams);
      
      // HTTP status code kontrolü
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        return _handleHttpError(response.statusCode!, response.data);
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> dioPost(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.post(endpoint, data: data, options: Options(validateStatus: (status) {
        return status != null && status < 500;
      }));

      // Başarılı yanıt durumunda veriyi döndür
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return _handleHttpError(response.statusCode!, response.data);
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> dioPut(String endpoint, dynamic data) async {
    try {
      Response response = await _dio.put(endpoint, data: data, options: Options(validateStatus: (status) {
        return status != null && status < 500;
      }));

      // Başarılı yanıt durumunda veriyi döndür
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        return _handleHttpError(response.statusCode!, response.data);
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Future<dynamic> dioDelete(String endpoint) async {
    try {
      Response response = await _dio.delete(endpoint);
      
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data;
      } else {
        return _handleHttpError(response.statusCode!, response.data);
      }
    } catch (e) {
      return _handleError(e);
    }
  }

  Map<String, dynamic> _handleHttpError(int statusCode, dynamic data) {
    String message = 'HTTP Hata: $statusCode';
    
    if (data != null) {
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        message = data['message'];
      } else if (data is String) {
        message = data;
      }
    }
    
    return {
      'error': message,
      'statusCode': statusCode,
      'data': data,
    };
  }

  Map<String, dynamic> _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return {'error': 'Bağlantı zaman aşımına uğradı (15 saniye)'};
        case DioExceptionType.receiveTimeout:
          return {'error': 'Yanıt zaman aşımına uğradı (15 saniye)'};
        case DioExceptionType.sendTimeout:
          return {'error': 'Gönderim zaman aşımına uğradı (15 saniye)'};
        case DioExceptionType.badResponse:
          if (error.response != null) {
            return _handleHttpError(error.response!.statusCode!, error.response!.data);
          }
          return {'error': 'Hatalı yanıt: ${error.response?.statusCode}'};
        case DioExceptionType.cancel:
          return {'error': 'İstek iptal edildi'};
        case DioExceptionType.connectionError:
          return {'error': 'İnternet bağlantısı hatası. Lütfen bağlantınızı kontrol edin.'};
        case DioExceptionType.unknown:
          if (error.error != null) {
            return {'error': 'Bilinmeyen hata: ${error.error.toString()}'};
          }
          return {'error': 'Bilinmeyen bir hata oluştu'};
        default:
          return {'error': 'Bilinmeyen bir hata oluştu'};
      }
    }
    return {'error': 'Bilinmeyen bir hata oluştu: ${error.toString()}'};
  }
}