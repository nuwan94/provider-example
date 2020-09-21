import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/models/product.dart';
import 'package:provider_example/store/store.dart';

class SingleProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    Product product = store.activeProduct;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
          actions: [
            Badge(
              showBadge: store.getCartQuantity() > 0,
              position: BadgePosition(top: 0, right: 2),
              animationType: BadgeAnimationType.fade,
              badgeContent: Text(
                store.getCartQuantity().toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black45,
                ),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(store.activeProduct.name,
              style: TextStyle(color: Colors.black45)),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Image(
              image: AssetImage("assets/images/${product.image}"),
              fit: BoxFit.fitHeight,
              height: 200,
            ),
            Row(
              children: [
                Text(
                  "Rs. ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
                Spacer(),
                Container(
                    child: Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: () => {store.addItemToCart(product)}),
                    Text(
                      product.quantity.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                    IconButton(
                        iconSize: 30,
                        icon: Icon(
                          Icons.remove,
                          color: Colors.red,
                        ),
                        onPressed: () => {store.removeItemFromCart(product)}),
                  ],
                ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              product.description,
              textAlign: TextAlign.justify,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ));
  }
}
