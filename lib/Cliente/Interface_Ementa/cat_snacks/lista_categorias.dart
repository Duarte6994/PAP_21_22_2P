import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sandes/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/tostas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/wraps/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/cat_snacks/profile_menu.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/cat_snacks/profilepic.dart';

class cat_snacks extends StatelessWidget {
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
          children: [ProfilePic(),
          SizedBox(height: 20),
          Text("My Coffee",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                fontFamily: 'Varela'
            ),),
          SizedBox(height: 10),
          Text("Snacks - Sub-Categorias",
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
