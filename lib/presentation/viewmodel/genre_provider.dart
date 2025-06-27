import 'package:flutter/material.dart';
import 'package:tunely_app/data/models/genre_model.dart';
import 'package:tunely_app/domain/repositories/genre_repository.dart';
import 'package:tunely_app/domain/repositories/repository_factory.dart';

class GenreProvider extends ChangeNotifier {

  late final GenreRepository _genreRepository;

  GenreProvider({GenreRepository? genreRepository}){
    _genreRepository = genreRepository ?? RepositoryFactory().genreRepository;
  }

  GenreList? _genreList;
  bool _isLoading = false;
  String? _errorMessage;

  // İlk yükleme durumu
  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  GenreList? get genres => _genreList;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> initializeData() async {
    if (_isInitialized) return;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await fetchGenres();
      _isInitialized = true;
    } catch (e) {
      _errorMessage = "Veriler yüklenirken hata oluştu: \\n${e.toString()}";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchGenres() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response = await _genreRepository.fetchGenres();
      if (response.data.isNotEmpty) {
        _genreList = response;
        _errorMessage = null;
      } else {
        _genreList = GenreList(data: []);
        _errorMessage = "Tür bulunamadı";
      }
    }
    catch(e){
      _genreList = GenreList(data: []);
      _errorMessage = "Türler yüklenirken hata oluştu: \\n${e.toString()}";
    }
    finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> refreshData() async {
    _isInitialized = false;
    await initializeData();
  }
}