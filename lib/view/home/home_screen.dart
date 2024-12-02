import 'package:billing_system_app/constants/navigations/navigations.dart';
import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/view/home/widget/grid_widget.dart';
import 'package:billing_system_app/widgets/mediaquery.dart';
import 'package:flutter/material.dart';

import '../../widgets/sizedbox.dart';
import '../category/category_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: AppColors.whiteColor,
        ),
        title: const Text(
          "Hiba Hypermarket",
          style: TextStyle(color: AppColors.whiteColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.notifications,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar Section
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: SearchBar(
                        leading: Icon(Icons.search),
                        hintText: "Search...",
                      ),
                    ),
                    const CustomSizedBoxWidth(0.05),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(Icons.filter_list,
                          color: AppColors.whiteColor),
                    )
                  ],
                ),
              ),
            ),
            const CustomSizedBoxHeight(0.04),
            Image.network(
              "https://img.freepik.com/free-vector/grocery-store-sale-banner-template_23-2151089846.jpg?t=st=1733061781~exp=1733065381~hmac=1cf9ab1b47c9c9f8c187d13cb3db2a33432628e86bff03590c9e902bcfc0c7d5&w=1380",
            ),

            const SizedBox(height: 16),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 100.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  categoryItem("Fruits", "assets/icons/fruits.png", context),
                  categoryItem(
                      "Vegetables", "assets/icons/vegetables.png", context),
                  categoryItem("Grocery", "assets/icons/grocery.png", context),
                  categoryItem("Beverages", "assets/icons/drinks.png", context),
                  categoryItem("Edible Oil", "assets/icons/oil.png", context),
                ],
              ),
            ),

            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Best Selling",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const BestSellingScreen(),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(String label, String icon, BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageNavigations().push(const CategoryView());
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              fit: BoxFit.cover,
              height: mediaqueryheight(0.055, context),
              width: mediaquerywidth(0.12, context),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
