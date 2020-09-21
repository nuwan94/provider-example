import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/screens/cart.dart';
import 'package:provider_example/screens/product_list.dart';
import 'package:provider_example/screens/single_product.dart';
import 'package:provider_example/screens/user.dart';
import 'package:provider_example/store/store.dart';
import 'package:provider_example/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Store(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Example',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
          '/profile': (context) => UserScreen(),
          '/product': (context) => SingleProductScreen()
        },
      ),
    );
  }
}
