import 'package:codility_test_lokatani/model/species_list_model.dart';
import 'package:codility_test_lokatani/service/home_page_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var productList = <SpeciesListData>[].obs;
  var productResponse = SpeciesListResponse;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await HomePageService.fetchProducts();
      if (products != null) {
        productList.value = products.data;
        var data = productList.where((i) => i.sunlight.contains(Sunlight.FILTERED_SHADE)).toList();
        print("APA AJA KAH : $data");
      }
    } finally {
      isLoading(false);
    }
  }
}