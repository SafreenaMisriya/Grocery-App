
import 'package:billing_system_app/main.dart';
import 'package:billing_system_app/view/cart/view_cart.dart';
import 'package:billing_system_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/themes/app_borders.dart';
import '../../constants/themes/appcolors.dart';
import '../profile/profile_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    currentIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomePage(),
      const Center(child: Text('Favorite Screen'),),
      cartScreen(cartNotifier),
        const ProfileScreen(),
    ];

    return Scaffold(
      body:  ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (newIndex) {
                currentIndex.value = newIndex;
                FocusScope.of(context).unfocus();
              },
              itemBuilder: (context, index) {
                return pages[index];
              },
            );
          },
        ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ValueListenableBuilder<int>(
          valueListenable: currentIndex,
          builder: (context, selectedIndex, _) {
            return ClipRRect(
              borderRadius: AppBorders.mediumBorderRadius,
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  currentIndex.value = index;
                  pageController.jumpToPage(index);
                },
                selectedItemColor: AppColors.greenColor,
                unselectedItemColor: AppColors.greycolor,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Cart',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
