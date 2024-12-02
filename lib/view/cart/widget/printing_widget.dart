// ignore_for_file: deprecated_member_use

import 'dart:typed_data';
import 'package:billing_system_app/model/cart_model.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;

Future<Uint8List> generateInvoicePdf(
    List<CartItem> cartItems, double itemsTotal, double taxes, double toBePaid) async {
  final pdf = pw.Document();


  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  "Hiba Hypermarket",
                  style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
              
              ],
            ),
            pw.SizedBox(height: 8),
            pw.Text("Date & Time: ${DateTime.now()}"),
            pw.SizedBox(height: 16),

            // Items List
            pw.Table.fromTextArray(
              headers: ["Item", "Price", "Quantity", "Subtotal"],
              data: cartItems
                  .map((item) => [
                        item.name,
                        (item.unitPrice.toStringAsFixed(2)),
                        "{item.quantity}",
                        ((item.unitPrice * item.quantity).toStringAsFixed(2)),
                      ])
                  .toList(),
            ),
            pw.Divider(),

            // Summary
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("Items Total: ${itemsTotal.toStringAsFixed(2)}"),
                  pw.Text("Taxes: ${taxes.toStringAsFixed(2)}"),
                  pw.Text("To be Paid: ${toBePaid.toStringAsFixed(2)}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  return pdf.save();
}
