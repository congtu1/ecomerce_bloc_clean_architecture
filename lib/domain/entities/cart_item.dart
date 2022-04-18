class CartItemEntity {
  final int id;
  final String name;
  final String image;
  final double price;
  final int amount;
  final int paymentStt;

  CartItemEntity(
      this.id, this.name, this.image, this.price, this.amount, this.paymentStt);
}
