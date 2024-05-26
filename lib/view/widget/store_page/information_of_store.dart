import 'package:flutter/material.dart';
import 'package:wael/core/constant/color.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo(
      {super.key,
      required this.image,
      required this.name,
      required this.categories,
      required this.address,
      required this.telephone,
      required this.phone,
      required this.description});
  final String image;
  final String name;
  final List categories;
  final String address;
  final String telephone;
  final String phone;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(3), // Border width
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(50), // Image radius
                child: Image.network(image),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 22,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '. Category: $categories ',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Address: $address',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Telephone: $telephone',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Phone: $phone',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. $description',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class SkeletonizerCategoryInfo extends StatelessWidget {
  const SkeletonizerCategoryInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(3), // Border width
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(50), // Image radius
                child: Image.asset("assets/images/image_store_adidas.png"),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Adidas",
            style: TextStyle(
                fontSize: 22,
                color: AppColor.blue,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '. Category: name ',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Address: address',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Telephone: telephone',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. Phone: phone',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '. description',
            maxLines: null,
            overflow: TextOverflow.clip,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
