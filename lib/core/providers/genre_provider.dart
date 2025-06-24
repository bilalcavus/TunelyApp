import 'package:flutter/material.dart';
import 'package:tunely_app/core/services/api_service.dart';
import 'package:tunely_app/model/genre_model.dart';

class GenreProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  GenreList? _genreList;
  bool _isLoading = false;
  String? _errorMessage;


  GenreList? get genres => _genreList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchGenres() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.fetchGenres();
      if (response.data.isNotEmpty) {
        _genreList = response;
        _errorMessage = null;
      } else {
        _genreList = GenreList(data: []);
        _errorMessage = "No genres found";
      }
    }
    catch(e){
      _errorMessage = e.toString();
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }  
}