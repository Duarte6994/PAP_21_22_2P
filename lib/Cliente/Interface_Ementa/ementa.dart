import 'package:flutter/material.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/carrosel_imagens/carrosel.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bebidas_alcool/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/bolos/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/cafes/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/estilos/colors.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/petiscos/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sandes/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/sumos_aguas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/tostas/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/wraps/homepage.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/appbar_add.dart';
import 'cat_bebidas/lista_categorias.dart';
import 'cat_snacks/lista_categorias.dart';
import 'categorias_file/lista_categorias.dart';

class ementa extends StatefulWidget {
  @override
  _ementaState createState() => _ementaState();
}

class _ementaState extends State<ementa> {
  int selectedFoodCard = 0;

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Color(0xFFFDAE47),
        elevation: 0.0,
        centerTitle: true,
        title: Text('My Coffee',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Varela',
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: null,
          icon: Image.asset('assets/Icons_launcher/ic_launcher.png'),
          iconSize: 23,
        )
      ),
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: appbar_add(),
            child: Container(height: 0),
          ),
          ListView(
            children: [
              SizedBox(width: 10,),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Destaques",
                        style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Varela'
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    carrossel(),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Categorias",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Varela'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 10.0,
                                  width: 20.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                ),
                                avatarWidget("sandes", "Snacks",),
                                avatarWidget1("bebidas", "Bebidas"),
                                avatarWidget2("outros", "Bolos"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Sub-Categorias",
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Varela'
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => lista_categorias()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Listar Tudo',
                                style: TextStyle(
                                  fontFamily: 'Varela',
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 40.0,
                                  width: 20.0,
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                  ),
                                ),
                                categoryListTile("assets/Icons/hamburger.jpg", "Hamburgers"),
                                categoryListTile1("assets/Icons/sandes.png", "Sandes"),
                                categoryListTile2("assets/Icons/cafeicon.png", "Cafés"),
                                categoryListTile3("assets/Icons/bebidas.png", "Sumos"),
                                categoryListTile4("assets/Icons/beb_alcool.png", "Petiscos"),
                                categoryListTile5("assets/Icons/bebalcool.png", "Beb. Álcool"),
                                categoryListTile6("assets/Icons/tosta.png", "Tostas"),
                                categoryListTile7("assets/Icons/wrap.png", "Wraps"),
                                categoryListTile8("assets/Icons/outros.png", "Bolos"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }

  Widget categoryListTile(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/hamburger.jpg'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                        color: Colors.orange,
                        width: 2,
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_hamburger(),
                      ),
                    ),
                  },
                ),
              ),
              Text(name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile1(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/sandes.png'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                        color: Colors.orange,
                        width: 2
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_sandes(),
                      ),
                    ),
                  },
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile2(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/cafeicon.png'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                        color: Colors.orange,
                        width: 2
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_cafes(),
                      ),
                    ),
                  },
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile3(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/bebidas.jpg'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                        color: Colors.orange,
                        width: 2
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepagesumos_aguas(),
                      ),
                    ),
                  },
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile4(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/petiscos.png'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                        color: Colors.orange,
                        width: 2
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_petiscos(),
                      ),
                    ),
                  },
                ),
              ),
              Text(
                name,
                style: TextStyle(
                    fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile5(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/bebalcool.png',),
                        fit: BoxFit.contain,
                    ),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    ),
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_bebalcool(),
                      ),
                    ),
                  },
                ),
              ),
              Text(name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile6(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/tosta.jpg'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_tostas(),
                      ),
                    ),
                  },
                ),
              ),
              Text(name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile7(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/wrap.png'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_wraps(),
                      ),
                    ),
                  },
                ),
              ),
              Text(name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget categoryListTile8(String img, String name) {
    return Container(
      margin: EdgeInsets.only(right: 22, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(left: 0),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/Icons/outros.png'),
                        fit: BoxFit.contain
                    ),
                    border: Border.all(
                      color: Colors.orange,
                      width: 2,
                    )
                ),
                child: InkWell(
                  onTap: () => {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => homepage_bolos(),
                      ),
                    ),
                  },
                ),
              ),
              Text(name,
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container avatarWidget(String img, String name)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(15)),
          color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Container(
            margin: EdgeInsets.only(left: 0),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/Icons/sandes.png'),
                    fit: BoxFit.contain
                ),
                border: Border.all(
                    color: Colors.black,
                    width: 2
                )
            ),
           child: InkWell(
             onTap: () => {
               Navigator.push(context,
                 MaterialPageRoute(
                   builder: (context) => cat_snacks(),
                 ),
               ),
             },
           ),
         ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => cat_snacks(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          Text(name, style: TextStyle(
              fontSize: 16,
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }
  Container avatarWidget1(String img, String name)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(left: 0),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/Icons/bebidas.png'),
                    fit: BoxFit.contain
                ),
                border: Border.all(
                    color: Colors.black,
                    width: 2
                )
            ),
            child: InkWell(
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => cat_bebidas(),
                  ),
                ),
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => cat_bebidas(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          Text(name, style: TextStyle(
              fontSize: 16,
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700
          ),)
        ],
      ),
    );
  }
  Container avatarWidget2(String img, String name)
  {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color(0xfff1f3f6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: EdgeInsets.only(left: 0),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/Icons/outros.png'),
                    fit: BoxFit.contain
                ),
                border: Border.all(
                    color: Colors.black,
                    width: 2
                )
            ),
            child: InkWell(
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => homepage_bolos(),
                  ),
                ),
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => homepage_bolos(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          Text(name, style: TextStyle(
              fontSize: 16,
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700
          ),
          ),
        ],
      ),
    );
  }
}