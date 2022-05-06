import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/hamburger_provider.dart';
import 'package:flutter/material.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/cart_screen.dart';
import 'package:provider/provider.dart';

class homepage2 extends StatefulWidget {
  const homepage2({Key? key}) : super(key: key);

  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {

  @override
  void initState() {
    super.initState();
  }

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

