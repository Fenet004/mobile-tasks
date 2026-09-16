import 'dart:io';

void main() {

  ProductManager manager = ProductManager();

  String menu = '''
    #####Menu######
    Enter only the numbers below for the associated service you want:
    1. Add Product.
    2. View All Products.
    3. Search Specific Product by name.
    4. Edit Product.
    5. Delete Product by name.
    6. Exit
  ''';
  
  bool alwaysShow = true;

  while (alwaysShow) {

    print(menu);
    int? num = int.tryParse(stdin.readLineSync()!);

    if (num == null) {
      print('Please enter a valid number.');
      continue;
    }

    switch (num) {
      case 1:
        print('Enter the name of the product: ');
        String name = stdin.readLineSync()!;
        print('Write a short description for your product: ');
        String description = stdin.readLineSync()!;
        print('Enter the price: ');
        double? price = double.tryParse(stdin.readLineSync()!);

        if (price == null) {
          print('Please enter a valid price.');
          break;
        }
        
        manager.addProduct(Product(name, description, price));
        break;

      case 2:
        manager.viewAllProducts();
        break;
      
      case 3:
        print('Enter the name of the product you want to view: ');
        String name = stdin.readLineSync()!;
        manager.viewProduct(name);
        break;

      case 4:
        print('Enter the name of the product you want to edit: ');
        String currName = stdin.readLineSync()!;
        print('Enter the new name you want to give the product: ');
        String newName = stdin.readLineSync()!;
        print('Enter the new description of the product: ');
        String newDescription = stdin.readLineSync()!;
        print('Enter the new price of the product: ');
        double? newPrice = double.tryParse(stdin.readLineSync()!);

        if (newPrice == null) {
          print('Please enter a valid price.');
          break;
        }

        manager.editProduct(currName, newName, newDescription, newPrice);
        break;

      case 5:
        print('Enter the name of the product you wish to delete: ');
        String name = stdin.readLineSync()!;
        manager.deleteProduct(name);
        break;
      
      case 6:
        alwaysShow = false;
        break;

      default:
        print('Please enter a valid number from the menu.');
        break;
    }
  } 
  print('Exiting...');
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
    print('''
      ------------------------------------

    ''');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available');
      print('''
      ------------------------------------
      
    ''');
      return;
    }

    print('\nAll Products:');
    for (Product product in products) {
      print('''
Name:        ${product.name}
Description: ${product.description}
Price:       ${product.price}''');
      print('''
      ------------------------------------
      
      ''');
    }
     
  }

  void viewProduct(String name) {
    for (Product product in products) {
      if (product.name.toLowerCase() == name.toLowerCase()) {
        print('''
Name:        ${product.name}
Description: ${product.description}
Price:       ${product.price}''');
         print('''
      ------------------------------------
      
    ''');
        return;
      }
    }

    print('Product "$name" not found.');
     print('''
      ------------------------------------
      
    ''');
  }

  void editProduct(String currName, String newName, String newDescription, double newPrice) {
    for (Product product in products) {
      if (product.name.toLowerCase() == currName.toLowerCase()) {
        product.name = newName;
        product.description = newDescription;
        product.price = newPrice;

        print('Product edited successfully.');
         print('''
      ------------------------------------
      
    ''');
        return;
      }
    }

    print('Product "$currName" not found.');
     print('''
      ------------------------------------
      
    ''');
  }

  void deleteProduct(String name) {
    int index = products.indexWhere((product) => product.name.toLowerCase() == name.toLowerCase());

    if (index == -1) {
      print('Product "$name" not found.');
       print('''
      ------------------------------------
      
    ''');
      return;
    }

    products.removeAt(index);
    print('Product deleted successfully.');
     print('''
      ------------------------------------
      
    ''');
  }
}