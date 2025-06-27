// import 'package:flutter/material.dart';
// import 'package:tunely_app/core/services/api_service.dart';
// import 'package:tunely_app/data/model/playlist_model.dart';

// class PlaylistProvider extends ChangeNotifier {
//   final ApiService _apiService = ApiService();
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   String? _errorMessage;
//   String? get errorMessage => _errorMessage;


//   bool _isInitialized = false;
//   bool get isInitialized => _isInitialized;

//   Future<void> initializeData() async {
//     if (_isInitialized) return;
//     _isLoading = true;
//     _errorMessage = null;
//     notifyListeners();

//     try {
//       await fetchPopularPlaylists();
//       _isInitialized = true;
//     } catch (e) {
//       _errorMessage = "Veriler yüklenirken hata oluştu: \\n${e.toString()}";
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

  

//   // Hata mesajını temizle
//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Verileri yenile
//   Future<void> refreshData() async {
//     _isInitialized = false;
//     await initializeData();
//   }
// }