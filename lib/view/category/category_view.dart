import 'package:billing_system_app/constants/navigations/navigations.dart';
import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/view/home/widget/grid_widget.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> sellingItems = [
  {
    'name': 'Orange, 1kg',
    'image':
        'https://img.freepik.com/free-photo/orange-white-white_144627-16571.jpg?t=st=1733062191~exp=1733065791~hmac=5b5a349682a61470750877ab3fc1c43d32ec8900add8c4a563b9ff8c456f3c1c&w=740',
    'amount': 40,
    'damount': 80
  },
  {
    'name': 'Sunflower Oil, 1Lr',
    'image':
        'https://as2.ftcdn.net/v2/jpg/02/09/90/03/1000_F_209900393_G5OLeEWQB2OUu2D1u5yVFOrpHaOg0oA6.jpg',
    'amount':  160,
    'damount':  200
  },
  {
    'name': 'Honey ,1 Lr',
    'image':
        'https://img.freepik.com/free-photo/glass-jar-full-honey-with-honey-spoon_23-2148173092.jpg?uid=R143973590&ga=GA1.1.1665061409.1697998385&semt=ais_hybrid',
    'amount':  260,
    'damount':  300
  },
  {
    'name': 'Tomato , 1Kg',
    'image':
        'https://img.freepik.com/free-photo/tomatoes_1232-1910.jpg?t=st=1733069173~exp=1733072773~hmac=46ecffcd93e48ebe6e50e3df1b92fde72dbdffdc497ef3022d0caee20ece1cc9&w=996',
    'amount':  50,
    'damount':  80
  },
   {
    'name': 'Bread , 500 g',
    'image':
        'https://img.freepik.com/free-photo/front-view-sweet-patties-delicious-baked-dough-tea-dark-space_140725-79481.jpg?t=st=1733068329~exp=1733071929~hmac=eba08d596b784663cca249125ab6905958aaef161dacc31f957f0df2135c3bdb&w=996',
    'amount':  60,
    'damount':  80
  },
   {
    'name': 'Ghee , 1 Lr',
    'image':
        'https://img.freepik.com/free-photo/tasty-pineapple-still-life_23-2151605414.jpg?t=st=1733067624~exp=1733071224~hmac=5b56b52db33b3b2c61ba096fdad55de21b94fbd647c0ca09ebe0d36e323edb2a&w=1060',
    'amount': 540,
    'damount':  620
  },
   {
    'name': 'Dal , 1Kg',
    'image':
        'https://img.freepik.com/free-photo/soybean-seeds-wooden-floor-hemp-sacks-food-nutrition-concept_1150-26312.jpg?t=st=1733067787~exp=1733071387~hmac=883e127d6921a4766101ed37183a3580a045e41bbffc9c98df6edf85440a4989&w=996',
    'amount':  80,
    'damount':  100
  },
   {
    'name': 'Rasberries , 250g',
    'image':
        'https://img.freepik.com/free-photo/fresh-red-raspberries-white-bowl-white-surface_114579-21086.jpg?t=st=1733067895~exp=1733071495~hmac=9f014115744d25dc5fb66a73f9f17f086c61e9c1e424032ba034eecc1fc46ea5&w=996',
    'amount': 150,
    'damount':  180
  },
   {
    'name': 'kiwi-juice , 1 Pc',
    'image':
        'https://img.freepik.com/free-photo/bottle-kiwi-juice-put-dark-floor_1150-28148.jpg?uid=R143973590&ga=GA1.1.1665061409.1697998385&semt=ais_hybrid',
    'amount':  60,
    'damount':  80
  },
   {
    'name': 'Ladies Finger , 250g',
    'image':
        'https://as1.ftcdn.net/v2/jpg/07/15/29/66/1000_F_715296690_JRaWpNwQLCwqo6vBP8qC76xyfszBvffM.jpg',
    'amount': 40,
    'damount':  70
  },
   
];

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        leading: IconButton(
            onPressed: () => PageNavigations().pop(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.whiteColor,
            )),
        title: const Text(
          'All Products',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: sellinggrid(),
      ),
    );
  }
}

Widget sellinggrid() {
  return GridView.builder(
    shrinkWrap: true,
   
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
    itemCount: sellingItems.length,
  );
}
