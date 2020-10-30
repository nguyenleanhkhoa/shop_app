import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cartProvider.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                      child: Text('Order now'),
                      onPressed: () {
                        orderProvider.addOrder(
                            cartProvider.mapCart.values.toList(),
                            cartProvider.totalAmount);
                        cartProvider.clearCart();
                        print(orderProvider.listOrder.length);
                      },
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.mapCart.length,
                itemBuilder: (ctx, index) => CartItem(
                    cartProvider.mapCart.values.toList()[index].toString(),
                    cartProvider.mapCart.keys.toList()[index],
                    cartProvider.mapCart.values.toList()[index].price,
                    cartProvider.mapCart.values.toList()[index].quantity,
                    cartProvider.mapCart.values.toList()[index].title),
              ),
            )
          ],
        ));
  }
}
