import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/hamburger_provider.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/cafes/lista_cafes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage_cafes extends StatelessWidget {
  const homepage_cafes({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (BuildContext context){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductListScreen(),
        );
      }),

    );
  }
}
