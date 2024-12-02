import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/widgets/custom_button.dart';
import 'package:billing_system_app/widgets/mediaquery.dart';
import 'package:billing_system_app/widgets/sizedbox.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../model/cart_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String image;
  final int price;
  final int discount;
  final String name;

  const ProductDetailsScreen({
    super.key,
    required this.discount,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    width: double.infinity,
                    height: mediaqueryheight(0.4, context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      // Add to favorite action
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '₹ ${price.toString()}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CustomSizedBoxWidth(0.06),
                  Text(
                    '₹ ${discount.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              const CustomSizedBoxHeight(0.02),
              const Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  Icon(Icons.star_half, color: Colors.orange, size: 18),
                  SizedBox(width: 8),
                  Text('(4.5)', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lorem ipsum dolor sit amet consectetur. '
                'Malesuada purus et odio urna velit ut ultrices suspendisse eget...',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomElevatedButton(
                  width: mediaquerywidth(0.5, context),
                  backgroundColor: AppColors.greenColor,
                  textColor: Colors.white,
                  onPressed:  () {
                      cartNotifier.addToCart(CartItem(
                          name: name,
                          imagePath: image,
                          unitPrice: price,
                          discount: discount,
                          quantity: 1,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor: Colors.green,
                                    content: Text('Item Added to Cart'),
                                  ),
                                );
                    } , text: "Add to Cart"),
              ),
             
              const SizedBox(height: 10),
              // Add Similar Products Widget here
            ],
          ),
        ),
      ),
    );
  }
}
