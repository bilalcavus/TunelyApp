import 'package:tunely_app/core/helper/dio_helper.dart';
import 'package:tunely_app/model/genre_model.dart';

class ApiService{
  final DioHelper _dioHelper = DioHelper();

  Future<GenreList> fetchGenres() async {
    final response = await _dioHelper.dioGet('/genre');
    if (response is List<Map<String, dynamic>>) {
      return GenreList.fromJson({'data': response});
    }
    else if (response is Map<String, dynamic>) {
      return GenreList.fromJson(response);
    } else {
      throw Exception('Failed to load genres');
    }
  }


}