
import 'package:flutter/material.dart';

import '../../../constants/themes/appcolors.dart';
import '../../../model/cart_model.dart';
import '../../../view_model/cart_viewmodel.dart';

Card listtilecart(CartItem item, CartNotifier cartNotifier) {
  return Card(
                          color: Colors.green[100],
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      item.imagePath,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.green[200]),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                if (item.quantity > 1) {
                                                  item.quantity--;
                                                  cartNotifier.updateItem(item);
                                                }
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              item.quantity.toString(),
                                              style: const TextStyle(fontSize: 16),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                item.quantity++;
                                                cartNotifier.updateItem(item);
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "₹${(item.unitPrice * item.quantity).toStringAsFixed(2)}",
                                        style: const TextStyle(
                                          color: AppColors.greenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const SizedBox(width: 8.0),
                                      if (item.discount > 0)
                                        Text(
                                          "₹${(item.discount * item.quantity).toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                        IconButton(
                  onPressed: () {
                    cartNotifier.removeItem(item); // Call the method to remove item
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: AppColors.whiteColor,
                  ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
}

