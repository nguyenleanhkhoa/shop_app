import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/Order.dart';

class OrderProvider with ChangeNotifier {
  List<OrderItem> listOrder = [];
  List<OrderItem> get getOrder {
    return [...listOrder];
  }

  void addOrder(List<CartItem> listCartProduct, double total) {
    listOrder.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        product: listCartProduct,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
