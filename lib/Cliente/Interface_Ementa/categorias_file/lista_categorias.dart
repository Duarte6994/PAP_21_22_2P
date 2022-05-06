import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bolos/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/petiscos/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sandes/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sumos_aguas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/tostas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/wraps/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/categorias_file/profile_menu.dart';
import '../categorias_file/profilepic.dart';
import '../subcategorias/cafes/homepage.dart';

class lista_categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black,
        size: 30),
      ),
      body: SingleChildScrollView(
      child:   Column(
          children: [
            ProfilePic(),
          SizedBox(height: 20),
          Text("My Coffee",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontFamily: 'Varela'
            ),),
          SizedBox(height: 10),
          Text("Sub-Categorias",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Varela',
              color: Colors.orange,
            ),),
          SizedBox(height: 40),
          Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          ProfileMenu(
            text: "Bebidas Alcoólicas",
            icon: "assets/Icons/bebalcool.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_bebalcool(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Bolos",
            icon: "assets/Icons/outros.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_bolos(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Cafés",
            icon: "assets/Icons/cafeicon.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_cafes(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Hamburgers",
            icon: "assets/Icons/hamburger.jpg",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_hamburger(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Sumos - Águas",
            icon: "assets/Icons/bebidas.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepagesumos_aguas(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Petiscos",
            icon: "assets/Icons/petiscos.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_petiscos(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Sandes",
            icon: "assets/Icons/sandes.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_sandes(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Tostas",
            icon: "assets/Icons/tosta.jpg",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_tostas(),
                ),
              );
            },
          ),
          ProfileMenu(
            text: "Wraps",
            icon: "assets/Icons/wrap.png",
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_wraps(),
                ),
              );
            },
          ),
        ],
      ),
      ),
    );
  }
}
