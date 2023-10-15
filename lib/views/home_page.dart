import 'package:codility_test_lokatani/controller/home_page_controller.dart';
import 'package:codility_test_lokatani/views/widget/product_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController homePageController = Get.put(HomePageController());

  final List<String> sunlightCategories = ['Full Sun', 'Part Shade', 'Filtered Shade', 'Part Sun/Shade'];
  final List<String> wateringCategories = ['Frequent', 'Average'];

 List<String> selectedSunlightCategory = [];
  @override
  Widget build(BuildContext context) {
    // final filterList = list.where((product) {
    //  return selectedSunlightCategory.isEmpty || (selectedSunlightCategory == product);
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Kind of Plant",
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: sunlightCategories
                  .map((sunlightCategory) => FilterChip(
                    selected: !selectedSunlightCategory.isEmpty,
                    padding: const EdgeInsets.all(8),
                    label: Text(
                      sunlightCategory,
                      style: const TextStyle(
                        fontFamily: 'avenir', 
                        fontWeight: FontWeight.w800,
                        fontSize: 12
                      ),
                    ),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSunlightCategory = selectedSunlightCategory;
                        }
                      });
                    },
                  )
                ).toList(),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Watering",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: wateringCategories
                .map((sunlightCategory) => FilterChip(
                  padding: const EdgeInsets.all(5),
                  label: Text(
                    sunlightCategory,
                    style: const TextStyle(
                        fontFamily: 'avenir', 
                        fontWeight: FontWeight.w800,
                        fontSize: 12
                      ),
                    ),
                    onSelected: (selected) {
                              
                    },
                )
              ).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
              child: Obx(() {
                if (homePageController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: homePageController.productList.length,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    itemBuilder: (context, index) {
                      return ProductItem(homePageController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                }
              }),
            )
        ]),
      ),
    );
  }
}