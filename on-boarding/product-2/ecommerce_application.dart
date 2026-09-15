void main() {
  Product product1 = Product('chair', 'a tool to sit on', 9.99);
  print(product1.name);
  print(product1.description);
  print(product1.price);
  
}

class Product {
  String _name;
  String _description;
  double _price;

  Product(this._name, this._description, this._price);

  String get name => _name;
  String get description => _description;
  double get price => _price;

  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set price(double price) => _price = price;
}

class ProductManager {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
    print('Product added successfully');
  }

  void viewAllProducts() {
    print(products);
  }

  void viewProduct(String name) {
    print(products.where((product) => product.name == name));
  }

  void editProduct(String currName, String newName, String newDescription, double newPrice) {
    Product item = products.firstWhere((product) => product.name == currName);
    item.name = newName;
    item.description = newDescription;
    item.price = newPrice;
    print('Item edited successfully');
  }

  void deleteProduct(String name) {
    Product item = products.firstWhere((product) => product.name == name);
    products.remove(item);
    print('Product deleted successfully');
  }

}