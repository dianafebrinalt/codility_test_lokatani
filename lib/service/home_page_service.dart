import 'dart:math';

import 'package:codility_test_lokatani/model/species_list_model.dart';
import 'package:codility_test_lokatani/service/http_base_client.dart';
import 'package:codility_test_lokatani/service/http_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageService {
  static var client = http.Client();

  static Future<SpeciesListResponse?> fetchProducts() async {
    String apiKey = "sk-2hvq652a19908f2bc2456";
    String page = "1";
    String apiUrl = "https://perenual.com/api/species-list?key=${apiKey}&page=${page}";
    var response = await client.get(Uri.parse(
        apiUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return speciesListResponseFromJson(jsonString);
    } else {
      return null;
    }
  }
}