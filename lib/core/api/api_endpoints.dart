import 'dart:io';

import 'package:flutter/foundation.dart';

class ApiEndpoints {
  ApiEndpoints._();

  static const bool isPhysicalDevice = false; //physical device add garda function true halne

  static const String compIpAddress = "192.168.1.1"; //if physical device add garne ho bhane laptop ko ip halne

  static String get baseUrl{
    if (isPhysicalDevice){
      return 'http://$compIpAddress:3000/api/v1';
    }
    if (kIsWeb) {
      return 'http://localhost:3000/api/v1';  
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000/api/v1';
    } else if (Platform.isIOS) {
      return 'http://localhost:3000/api/v1';
    } else {
      return 'http://localhost:3000/api/v1';
    }

  }

  // Base URL - change this for production. Defaults to localhost for simulators/web.
  // For Android emulator use: 'http://10.0.2.2:3000/api/v1'
  // For iOS Simulator use: 'http://localhost:3000/api/v1'
  // For Physical Device use your computer's IP: 'http://192.168.x.x:3000/api/v1'
  // static const String baseUrl = 'http://localhost:3000/api/v1';
  // static const String androidEmulatorBaseUrl = 'http://10.0.2.2:3000/api/v1';

  // Increased timeouts to 60s to account for slower dev servers.
  static const Duration connectionTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  // ============ Batch Endpoints ============
  static const String batches = '/batches';
  static String batchById(String id) => '/batches/$id';

  // ============ Category Endpoints ============
  static const String categories = '/categories';
  static String categoryById(String id) => '/categories/$id';

  // ============ Student Endpoints ============
  static const String students = '/students';
  static const String studentLogin = '/students/login';
  static const String studentRegister = '/students/register';
  static String studentById(String id) => '/students/$id';
  static String studentPhoto(String id) => '/students/$id/photo';

  // ============ Item Endpoints ============
  static const String items = '/items';
  static String itemById(String id) => '/items/$id';
  static String itemClaim(String id) => '/items/$id/claim';

  // ============ Comment Endpoints ============
  static const String comments = '/comments';
  static String commentById(String id) => '/comments/$id';
  static String commentsByItem(String itemId) => '/comments/item/$itemId';
  static String commentLike(String id) => '/comments/$id/like';
}
