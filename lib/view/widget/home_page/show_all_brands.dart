import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';
import 'package:wael/core/services/brand_service.dart';
import 'package:wael/view/widget/home_page/brand.dart';
import 'package:wael/view/widget/loading.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              'All Brands',
              style: TextStyle(
                color: AppColor.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder(
              future: BrandService.getAllBrands(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Loading();
                final brandData = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    itemCount: brandData.length,
                    itemBuilder: (context, index) {
                      return Brand(
                          onTap: () {},
                          name: brandData[index].name,
                          imageUrl: brandData[index].image);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
