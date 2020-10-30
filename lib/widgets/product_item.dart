import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/product_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Product>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productProvider.id,
            );
          },
          child: Image.network(
            productProvider.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, productProvider, child) => IconButton(
              onPressed: () {
                productProvider.toggleFavoriteStatus();
              },
              icon: Icon(
                  productProvider.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Theme.of(context).accentColor),
            ),
          ),
          backgroundColor: Colors.black38,
          title: Text(
            productProvider.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cartProvider.addItem(productProvider.id, productProvider.price,
                  productProvider.title);
            },
            color: Theme.of(context).accentColor,
            icon: Icon(
              Icons.shopping_bag,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
