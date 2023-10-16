import 'package:codility_test_lokatani/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SunlightCategoryView extends StatefulWidget {
  const SunlightCategoryView({ Key? key }) : super(key: key);

  @override
  State<SunlightCategoryView> createState() => _SunlightCategoryViewState();
}

class _SunlightCategoryViewState extends State<SunlightCategoryView> {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final List<String> sunlightCategories = ['Full Sun', 'Part Shade', 'Filtered Shade', 'Part sun/Part shade']; 

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sunlightCategories
            .map((sunlightCategory) => Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                child: Container (
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.green
                      ),
                      color: homePageController.selectedSunlightCategory.value == sunlightCategory.toLowerCase() ? Colors.green : Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      sunlightCategory,
                      style: TextStyle(
                        color: homePageController.selectedSunlightCategory.value == sunlightCategory.toLowerCase() ? Colors.white : Colors.green,
                        fontFamily: 'avenir', 
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ), 
                  ),
                onTap: () {
                  setState(() {
                    if (homePageController.selectedSunlightCategory.value == sunlightCategory.toLowerCase()) {
                      homePageController.selectedSunlightCategory.value = "";
                    } else {
                      homePageController.selectedSunlightCategory.value = sunlightCategory.toLowerCase();
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