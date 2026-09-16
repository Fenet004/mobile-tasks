
void main() {
  Product product1 = Product('Chair', 'A tool used to sit on', 9.99);
  Product product2 = Product('Stick', 'A tool used to hit someone with', 5.00);

  ProductManager manager = ProductManager();
  manager.addProduct(product1);
  manager.addProduct(product2);
  manager.viewAllProducts();
  manager.viewProduct('Chair');
  manager.editProduct('Chair', 'Chair', 'a tool to sit on', 8.99);
  manager.viewAllProducts();
  manager.deleteProduct('Chair');
  manager.viewAllProducts();
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
    print('Product added successfully.');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available');
      return;
    }

    print('\nAll Products:');
    for (Product product in products) {
      print('${product.name}, ${product.description}, ${product.price}');
    }
  }

  void viewProduct(String name) {
    for (Product product in products) {
      if (product.name == name) {
        print('${product.name}, ${product.description}, ${product.price}');
        return;
      }
    }

    print('Product "$name" not found.');
  }

  void editProduct(String currName, String newName, String newDescription, double newPrice) {
    for (Product product in products) {
      if (product.name == currName) {
        product.name = newName;
        product.description = newDescription;
        product.price = newPrice;

        print('Product edited successfully.');
        return;
      }
    }

    print('Product "$currName" not found.');
  }

  void deleteProduct(String name) {
    int index = products.indexWhere((product) => product.name == name);

    if (index == -1) {
      print('Product "$name" not found.');
      return;
    }

    products.removeAt(index);
    print('Product deleted successfully.');
  }
}