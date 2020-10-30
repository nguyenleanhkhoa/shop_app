import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Cart.dart';

class CartProvider with ChangeNotifier {
  var mapCart = new Map<String, CartItem>();
  get getMap {
    return {...mapCart};
  }

  int get itemCount {
    print(mapCart.length);
    return mapCart.length;
  }

  double get totalAmount {
    var total = 0.0;
    mapCart.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title) {
    print(productId);

    if (mapCart.containsKey(productId)) {
      mapCart.update(
        productId,
        (existValue) => CartItem(
            id: existValue.id,
            title: existValue.title,
            price: existValue.price,
            quantity: existValue.quantity + 1),
      );
    } else {
      mapCart.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    mapCart.remove(productId);
    print(mapCart.length);
    notifyListeners();
  }

  void clearCart() {
    mapCart = {};
    notifyListeners();
  }
}
