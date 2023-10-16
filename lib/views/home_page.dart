import 'package:codility_test_lokatani/controller/home_page_controller.dart';
import 'package:codility_test_lokatani/views/widget/product_item_view.dart';
import 'package:codility_test_lokatani/views/widget/sunlight_category_view.dart';
import 'package:codility_test_lokatani/views/widget/watering_category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../model/species_list_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController homePageController = Get.put(HomePageController());

 List<String> selectedSunlightCategory = [];
  @override
  Widget build(BuildContext context) {
    // final filterList = list.where((product) {
    //  return selectedSunlightCategory.isEmpty || (selectedSunlightCategory == product);
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Greenhouse Jakarta",
          style: TextStyle(
            fontFamily: 'avenir', 
            fontWeight: FontWeight.w800
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sunlight",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            const SunlightCategoryView(),
            const SizedBox(height: 5),
            const Text(
              "Watering",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            const WateringCategoryView(),
            const SizedBox(height: 10),
            Expanded(
                child: Obx(() {
                  if (homePageController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var newProductList = <SpeciesListData>[];
                    if (homePageController.selectedWateringCategory.isEmpty && homePageController.selectedWateringCategory.isEmpty) {
                      newProductList = homePageController.productList;
                    } else if (homePageController.selectedWateringCategory.isEmpty && homePageController.selectedWateringCategory.isNotEmpty) {
                      newProductList = homePageController.productList.where((i) => i.watering.toLowerCase() == homePageController.selectedWateringCategory.value.toLowerCase() && i.sunlight.contains(homePageController.selectedSunlightCategory.value.toLowerCase())).toList();
                    } else {
                      if (homePageController.selectedWateringCategory.isNotEmpty) {
                        newProductList = homePageController.productList.where((i) => i.watering.toLowerCase() == homePageController.selectedWateringCategory.value).toList();
                      } else {
                        newProductList = homePageController.productList.where((i) => i.sunlight.contains(homePageController.selectedSunlightCategory.value)).toList();
                      }
                    }
                    return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: newProductList.length,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductItem( 
                          plantSameWateringImage: newProductList.where((i) => i.watering == homePageController.productList[index].watering && i.sunlight.contains(homePageController.productList[index].sunlight.first)).toList(),
                          speciesData: newProductList[index],
                        );
                      },
                      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                    );
                  }
                }
              ),
            )
          ]
        ),
      ),
    );
  }
}