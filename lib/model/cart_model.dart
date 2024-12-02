class CartItem {
  final String name;
  final String imagePath;
  final int unitPrice;
  final int discount;
  int quantity;

  CartItem({
    required this.name,
    required this.imagePath,
    required this.unitPrice,
    required this.discount,
    this.quantity = 1,
  });
}
