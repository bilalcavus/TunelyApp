// import 'package:tunely_app/core/helper/dio_helper.dart';
// import 'package:tunely_app/data/datasources/genre_remote_datasource.dart';
// import 'package:tunely_app/data/models/genre_model.dart';

// class GenreRemoteDatasourceImpl implements GenreRemoteDataSource {
//   final DioHelper dioHelper;
//   GenreRemoteDatasourceImpl(this.dioHelper);

//   @override
//   Future<GenreList> fetchGenres() async {
//      try {
//       final response = await dioHelper.dioGet('/genre');
      
//       if (response is Map<String, dynamic> && response.containsKey('error')) {
//         throw Exception(response['error']);
//       }
      
//       if (response is List<Map<String, dynamic>>) {
//         return GenreList.fromJson({'data': response});
//       }
//       else if (response is Map<String, dynamic>) {
//         return GenreList.fromJson(response);
//       } else {
//         throw Exception('Geçersiz veri formatı');
//       }
//     } catch (e) {
//       throw Exception('Türler yüklenirken hata oluştu: ${e.toString()}');
//     }
//   }
  
// }