class ProductEntity {
  final int id;
  final int idShop;
  final int idCategory;
  final String name;
  final String description;
  final double price;
  final String thumbnail;
  final String image;

  ProductEntity(this.id, this.idShop, this.idCategory, this.name,
      this.description, this.price, this.thumbnail, this.image);
}
