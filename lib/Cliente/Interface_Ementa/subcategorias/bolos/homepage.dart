import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/hamburger_provider.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bolos/lista_bolos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homepage_bolos extends StatelessWidget {
  const homepage_bolos({Key? key}) : super(key: key);

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
