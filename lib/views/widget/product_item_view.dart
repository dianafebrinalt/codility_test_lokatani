import 'package:codility_test_lokatani/model/species_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final SpeciesListData speciesData;
  const ProductItem(this.speciesData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("HAI HAI HAI");
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Image.network(
                  speciesData.defaultImage?.originalUrl ?? "https://perenual.com/storage/species_image/30_acer_palmatum_ao_shime_no_uchi/regular/Acer_palmatum_Ao_shime_no_uchi_3zz.jpg",
                  fit: BoxFit.cover,
                ),
              ),  
              const SizedBox(height: 8),
              Text(
                speciesData.commonName,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'avenir', 
                  fontWeight: FontWeight.w800
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      )
    );
  }
}
