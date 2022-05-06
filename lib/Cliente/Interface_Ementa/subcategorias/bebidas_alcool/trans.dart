import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/bebalcool_provider.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/lista_bebalcool.dart';
import 'package:flutter/material.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/cart_screen.dart';
import 'package:provider/provider.dart';

class homepage2 extends StatelessWidget {
  const homepage2({Key? key}) : super(key: key);

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
          home: const CartScreen(),
        );
      }),

    );
  }
}
