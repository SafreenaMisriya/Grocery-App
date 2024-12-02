import 'package:billing_system_app/constants/themes/appcolors.dart';
import 'package:billing_system_app/view/cart/widget/cart_widget.dart';
import 'package:billing_system_app/view/cart/widget/listtile_cart.dart';
import 'package:billing_system_app/view/cart/widget/printing_widget.dart';
import 'package:billing_system_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import '../../model/cart_model.dart';
import '../../view_model/cart_viewmodel.dart';

Widget cartScreen(CartNotifier cartNotifier) {
  return ValueListenableBuilder<List<CartItem>>(
    valueListenable: cartNotifier,
    builder: (context, cartItems, child) {
      double itemsTotal = cartItems.fold(
          0, (sum, item) => sum + (item.unitPrice * item.quantity));
      double totalDiscount = cartItems.fold(
          0,
          (sum, item) =>
              sum + ((item.discount - item.unitPrice) * item.quantity));
      double taxes = 4.0; // Example tax calculation (optional)

      double toBePaid = itemsTotal + taxes;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Your Cart"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: listtilecart(item, cartNotifier),
                      );
                    },
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSummaryRow(
                          "Items Total", "₹${itemsTotal.toStringAsFixed(2)}"),
                      buildSummaryRow("Total Discount",
                          "- ₹${totalDiscount.toStringAsFixed(2)}"),
                      buildSummaryRow("Taxes", "₹${taxes.toStringAsFixed(2)}"),
                      const Divider(),
                      buildSummaryRow(
                        "To be Paid",
                        "₹${toBePaid.toStringAsFixed(2)}",
                        isBold: true,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total savings ₹${totalDiscount.toStringAsFixed(2)}",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          CustomElevatedButton(
                              backgroundColor: AppColors.greenColor,
                              textColor: AppColors.whiteColor,
                              onPressed: () async {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.green,
                                    content: Text('Payment successful'),
                                  ),
                                );
                                final pdfData = await generateInvoicePdf(
                                    cartItems, itemsTotal, taxes, toBePaid);
                                await Printing.layoutPdf(
                                  onLayout: (format) => pdfData,
                                );
                              },
                              text: 'Proceed to Buy')
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
