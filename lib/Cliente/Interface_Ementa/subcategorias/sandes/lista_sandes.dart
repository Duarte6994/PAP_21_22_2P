import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/modelo_hamburger.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/hamburger_provider.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/cart_screen.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/hamburgers/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../estilos/style.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  List<String> productName = ['Sandes de Delícias' , 'Pão com Manteiga' , 'Sandes de Atum'] ;
  List<int> productPrice = [1, 2, 2 ] ;
  List<String> productUnit = ['' , '' , ''] ;
  List<String> productImage = [
    'assets/Icons/sandes.png' ,
    'assets/Icons/sandes.png' ,
    'assets/Icons/sandes.png' ,
  ] ;

  DBHelper? dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/Icons_launcher/ic_launcher.png'),
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset('assets/images/SVG/menu.svg'),
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Center(
              child: Badge(
                showBadge: true,
                badgeContent: Consumer<CartProvider>(
                  builder: (context, value , child){
                    return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                  },
                ),
                animationType: BadgeAnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                child: Icon(Icons.shopping_cart_outlined,
                color: Colors.black),
              ),
            ),
          ),
          SizedBox(width: 20.0)
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15),
              child: PrimaryText(
                text: 'My Coffee',
                size: 29,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: PrimaryText(
                text: 'Sandes',
                size: 25,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          SizedBox(height:50),
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image(
                                height: 80,
                                width: 80,
                                image: AssetImage(productImage[index].toString()),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 15),
                                    Text(productName[index].toString() ,
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(productUnit[index].toString() + productPrice[index].toString() + r"€"+ " ",
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 10,),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: (){
                                          print(index);
                                          print(index);
                                          print(productName[index].toString());
                                          print( productPrice[index].toString());
                                          print( productPrice[index]);
                                          print('1');
                                          print(productUnit[index].toString());
                                          print(productImage[index].toString());
                                          dbHelper!.insert(
                                              Cart(
                                                  id: index,
                                                  productId: index.toString(),
                                                  productName: productName[index].toString(),
                                                  initialPrice: productPrice[index],
                                                  productPrice: productPrice[index],
                                                  quantity: 1,
                                                  unitTag: productUnit[index].toString(),
                                                  image: productImage[index].toString())
                                          ).then((value){

                                            cart.addTotalPrice(double.parse(productPrice[index].toString()));
                                            cart.addCounter();

                                            final snackBar = SnackBar(backgroundColor: Colors.white,content: Text('Foi adicionado um item no teu pedido!',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Varela',
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black
                                              ),), duration: Duration(seconds: 2),);

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                          }).onError((error, stackTrace){
                                            print("error"+error.toString());
                                            final snackBar = SnackBar(backgroundColor: Colors.white ,content: Text('Este item já foi adicionado no teu carrinho, a quantidade só pode ser mudada no pedido!',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Varela',
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black

                                            ),), duration: Duration(seconds: 2));

                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                          });
                                        },
                                        child:  Container(
                                          height: 45,
                                          width: 160,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey,
                                              borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: const Center(
                                            child:  Text('Adicionar ao pedido' ,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Varela',
                                                  fontSize: 15,
                                                  ),),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,)
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
            ),
        ],
      ),
    );
  }
}
