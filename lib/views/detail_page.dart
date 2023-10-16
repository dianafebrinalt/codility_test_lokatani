import 'package:codility_test_lokatani/model/species_list_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final SpeciesListData speciesData;
  final List<SpeciesListData> plantSameWateringImage;
  const DetailPage({required this.speciesData, required this.plantSameWateringImage, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          speciesData.commonName,
          style: const TextStyle(
            fontFamily: 'avenir', 
            fontWeight: FontWeight.w800
          ),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 200,
                    child: Image.network(
                      speciesData.defaultImage?.originalUrl ?? "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/regular/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg"
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text(
              "Scientific Name",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            Row(
              children: List.generate(speciesData.scientificName.length, (index) {
                final isLast = index + 1 == speciesData.scientificName.length;
                return Text(
                  '${speciesData.scientificName[index]}${isLast ? '' : ', '} ',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.normal,
                  ),
                );
              })
            ),
            const SizedBox(height: 10),
            const Text(
              "Other Name",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            Row(
              children: List.generate(speciesData.otherName.length, (index) {
                final isLast = index + 1 == speciesData.otherName.length;
                return Text(
                  '${speciesData.otherName[index]}${isLast ? '' : ', '} ',
                  style: const TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.normal,
                  ),
                );
              })
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.cyclone_outlined),
                SizedBox(width: 5),
                Text(
                  "Cycle",
                  style: TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.w800,
                    fontSize: 15
                  ),
                )
              ],
            ),
            Text(
              speciesData.cycle,
              style: const TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.water_drop_rounded),
                SizedBox(width: 5),
                Text(
                  "Watering",
                  style: TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.w800,
                    fontSize: 15
                  ),
                )
              ],
            ),
            Text(
              speciesData.watering,
              style: const TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.sunny),
                SizedBox(width: 5),
                Text(
                  "Sunlight",
                  style: TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.w800,
                    fontSize: 15
                  ),
                )
              ],
            ),
            Row(
              children: List.generate(speciesData.sunlight.length, (index) {
                final isLast = index + 1 == speciesData.sunlight.length;
                return Text(
                  '${speciesData.sunlight[index]}${isLast ? '' : ', '} ',
                  style: const TextStyle(
                    fontFamily: 'avenir', 
                    fontWeight: FontWeight.normal,
                  ),
                );
              })
            ),
            const SizedBox(height: 20),
            const Text(
              "Similar Plants",
              style: TextStyle(
                fontFamily: 'avenir', 
                fontWeight: FontWeight.w800,
                fontSize: 15
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: plantSameWateringImage.length > 3 ? 3 : plantSameWateringImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          child: ClipRRect(borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              plantSameWateringImage[index].defaultImage?.originalUrl ?? "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/regular/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg"
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          plantSameWateringImage[index].commonName,
                          style: const TextStyle(
                            fontFamily: 'avenir', 
                            fontWeight: FontWeight.normal,
                            fontSize: 10
                          ),
                        )
                      ]
                    ),
                  );      
                }
              )
            ),
          ]
        ),
      ),
    );
  }
}