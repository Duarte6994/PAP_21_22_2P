import 'package:pap_projeto/teste/cart_provider.dart';
import 'package:pap_projeto/teste/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const ProductListScreen(),
        );
      }),

    );
  }
}
