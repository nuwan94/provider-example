import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/store/store.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        title: Text('Checkout', style: TextStyle(color: Colors.black45)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              store.clearCart();
            },
            icon: Icon(
              Icons.clear_all,
              color: Colors.black45,
            ),
          )
        ],
      ),
      body: Column(children: [
        ...store.cart.map((item) {
          return Container(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage("assets/images/${item.image}"),
                  width: 50,
                  height: 50,
                ),
                Text(
                  "${item.name} x ${item.quantity}",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "${(item.price * item.quantity).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ));
        }),
        (store.cart.length > 0)
            ? Column(
                children: [
                  Divider(
                    color: Colors.black45,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(fontSize: 24, color: Colors.black45),
                        ),
                        Text(
                          "Rs. ${store.getCartTotal().toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _scaffoldKey.currentState.showSnackBar(
                        SnackBar(
                            content: Text("Redirecting to payment gateway...")),
                      );
                    },
                    color: Colors.blue,
                    child:
                        Text("Checkout", style: TextStyle(color: Colors.white)),
                  )
                ],
              )
            : Container(
                height: 200,
                child: Center(child: Text("Cart is empty.")),
              ),
      ]),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.all(32),
      //           child: _CartList(),
      //         ),
      //       ),
      //       // _CartTotal()
      //     ],
      //   ),
      // ),
    );
  }
}

// class _CartList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var itemNameStyle = Theme.of(context).textTheme.headline6;
//     // This gets the current state of CartModel and also tells Flutter
//     // to rebuild this widget when CartModel notifies listeners (in other words,
//     // when it changes).
//     var cart = context.watch<CartModel>();

//     return ListView.builder(
//       itemCount: cart.items.length,
//       itemBuilder: (context, index) => ListTile(
//         leading: Icon(Icons.done),
//         title: Text(
//           cart.items[index].name,
//           style: itemNameStyle,
//         ),
//       ),
//     );
//   }
// }

// class _CartTotal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var hugeStyle =
//         Theme.of(context).textTheme.headline1.copyWith(fontSize: 48);

//     return SizedBox(
//       height: 200,
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Another way to listen to a model's change is to include
//             // the Consumer widget. This widget will automatically listen
//             // to CartModel and rerun its builder on every change.
//             //
//             // The important thing is that it will not rebuild
//             // the rest of the widgets in this build method.
//             Consumer<CartModel>(
//                 builder: (context, cart, child) =>
//                     Text('\$${cart.totalPrice}', style: hugeStyle)),
//             SizedBox(width: 24),
//             FlatButton(
//               onPressed: () {
//                 Scaffold.of(context).showSnackBar(
//                     SnackBar(content: Text('Buying not supported yet.')));
//               },
//               color: Colors.white,
//               child: Text('BUY'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
