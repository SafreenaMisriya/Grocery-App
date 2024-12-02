import 'package:billing_system_app/constants/navigations/navigations.dart';
import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/view/bottom_bar/bottom_bar.dart';
import 'package:billing_system_app/widgets/custom_button.dart';
import 'package:billing_system_app/widgets/custom_text.dart';
import 'package:billing_system_app/widgets/mediaquery.dart';
import 'package:billing_system_app/widgets/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> imagePaths = [
    'https://img.freepik.com/free-photo/top-view-assortment-vegetables-grocery-bag_23-2148853338.jpg?t=st=1732988546~exp=1732992146~hmac=a247cb59932e57e263c6b52de7f44b7de766f5c83a48f7f9342aa20588592356&w=826', // Replace with your actual images
    'https://img.freepik.com/free-photo/vegetables_1398-810.jpg?t=st=1733038313~exp=1733041913~hmac=7835f826d135312f9a20474067c5452a2c1ce1b7a5a3fd7f186db68484351f77&w=826',
    'https://www.timeoutbahrain.com/cloud/timeoutbahrain/2021/09/16/9KkK7blg-onlineshopping-1200x800.jpg',
  ];

  int _currentIndex = 0; // Track the current index for the dot indicator

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  const BoxDecoration(
          color: AppColors.greenColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Carousel Slider
            CarouselSlider(
              items: imagePaths.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                          width: mediaquerywidth(0.75, context),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 280.0,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update the current index
                  });
                },
              ),
            ),
            const CustomSizedBoxHeight(0.05),
            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagePaths.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = entry.key;
                    });
                  },
                  child: Container(
                    width: mediaqueryheight(0.02, context),
                    height: mediaquerywidth(0.02, context),
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? AppColors.whiteColor
                          : AppColors.greycolor,
                    ),
                  ),
                );
              }).toList(),
            ),
            const CustomSizedBoxHeight(0.05),
            const CustomText(
              text: "Let's on find",
              size: 0.06,
              color: AppColors.whiteColor,
              weight: FontWeight.bold,
            ),
            const CustomText(
              text: "Lhe best grocery",
              size: 0.06,
              color: AppColors.whiteColor,
              weight: FontWeight.bold,
            ),

            const CustomSizedBoxHeight(0.06),
            CustomElevatedButton(
              backgroundColor: AppColors.whiteColor,
              onPressed: () {
                PageNavigations().push(const  BottomBar ());
              },
              text: 'Get Started',
              textColor: AppColors.greenColor,
            ),
          ],
        ),
      ),
    );
  }
}
