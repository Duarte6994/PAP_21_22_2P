import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/petiscos/petiscos_provider.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/petiscos/lista_petiscos.dart';
import 'package:flutter/material.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sandes/cart_screen.dart';
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
          debugShowCheckedModeBanner: false,
          home: const CartScreen(),
        );
      }),

    );
  }
}
