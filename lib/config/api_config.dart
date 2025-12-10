/// API Configuration for Zykoon App
class ApiConfig {
  ApiConfig._();

  // Base URL - Replace with your actual API URL
  // For development: http://localhost:8000/api
  // For production: https://api.zykoon.com/api
  static const String baseUrl = 'http://localhost:8000/api';

  // Timeout configurations
  static const Duration connectionTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Duration sendTimeout = Duration(seconds: 15);
}

