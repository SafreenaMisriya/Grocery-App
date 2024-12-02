import 'package:billing_system_app/constants/navigations/navigations.dart';
import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/main.dart';
import 'package:billing_system_app/model/cart_model.dart';
import 'package:billing_system_app/view/product_details/product_details.dart';
import 'package:flutter/material.dart';
import '../../category/category_view.dart';
class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: bestsellinggrid(),
    );
  }
}

Widget bestsellinggrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      childAspectRatio: 3 / 4,
    ),
    itemBuilder: (context, index) {
      final item = sellingItems[index];
      return bestSellingItem(
          item['name']!, item['image']!, item['amount']!, item['damount']!,context);
    },
    itemCount: 4,
  );
}

Widget bestSellingItem(
    String name, String imagePath, int amount, int damount,BuildContext context ){
  return GestureDetector(
    onTap: () {
      PageNavigations().push(ProductDetailsScreen(discount: damount, image: imagePath, name: name, price: amount));
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    '₹ ${amount.toString()}',
                    
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    '₹ ${damount.toString()}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 2,
            right: 6,
            child: CircleAvatar(
              backgroundColor: AppColors.greenColor,
              child: IconButton(
                  icon: const Icon(
                    Icons.shopping_bag,
                    size: 23,
                    color: AppColors.whiteColor,
                  ),
                  onPressed: () {
                    cartNotifier.addToCart(CartItem(
                        name: name,
                        imagePath: imagePath,
                        unitPrice: amount,
                        discount: damount,
                        quantity: 1,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Item Added to Cart'),
                                ),
                              );
                  } // Trigger the add-to-cart logic
                  ),
            ),
          ),
        ],
      ),
    ),
  );
}
