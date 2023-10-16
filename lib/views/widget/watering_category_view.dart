import 'package:codility_test_lokatani/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WateringCategoryView extends StatefulWidget {
  const WateringCategoryView({ Key? key }) : super(key: key);

  @override
  State<WateringCategoryView> createState() => _WateringCategoryViewState();
}

class _WateringCategoryViewState extends State<WateringCategoryView> {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final List<String> wateringCategories = ['Frequent', 'Average'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: wateringCategories
            .map((wateringCategory) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                child: Container (
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.green
                      ),
                      color: homePageController.selectedWateringCategory.value == wateringCategory.toLowerCase() ? Colors.green : Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      wateringCategory,
                      style: TextStyle(
                        color: homePageController.selectedWateringCategory.value == wateringCategory.toLowerCase() ? Colors.white : Colors.green,
                        fontFamily: 'avenir', 
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ), 
                  ),
                onTap: () {
                  setState(() {
                    if (homePageController.selectedWateringCategory.value == wateringCategory.toLowerCase()) {
                      homePageController.selectedWateringCategory.value = "";
                    } else {
                      homePageController.selectedWateringCategory.value = wateringCategory.toLowerCase();
                    }
                  });
                },
              ),
            )
            ).toList(),
        )
    );
  }
}