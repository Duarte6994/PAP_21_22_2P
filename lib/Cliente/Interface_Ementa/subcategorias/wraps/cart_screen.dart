import 'package:badges/badges.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/wraps/modelo_wraps.dart';
import 'package:pap_projeto/Cliente/Interface_Ementa/subcategorias/wraps/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../estilos/style.dart';
import 'wraps_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart  = Provider.of<CartProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Builder(builder: (BuildContext context){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                centerTitle: false,
                elevation: 0,
                title: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/ic_launcher.png'),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset('assets/images/menu.svg'),
                  ),
                  SizedBox(width: 20.0)
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.all(5),
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
                        text: '| O MEU PEDIDO |',
                        size: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height:50),
                    FutureBuilder(
                        future:cart.getData() ,
                        builder: (context , AsyncSnapshot<List<Cart>> snapshot){
                          if(snapshot.hasData){

                            if(snapshot.data!.isEmpty){
                              return Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    Text('Your cart is empty 😌' ,style: Theme.of(context).textTheme.headline5),
                                    SizedBox(height: 20,),
                                    Text('Explore products and shop your\nfavourite items' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.subtitle2)

                                  ],
                                ),
                              );
                            }else {
                              return Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index){
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
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
                                                    height: 100,
                                                    width: 100,
                                                    image: AssetImage(snapshot.data![index].image.toString()),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Text(snapshot.data![index].productName.toString() ,
                                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                            ),
                                                            InkWell(
                                                                onTap: (){
                                                                  dbHelper!.delete(snapshot.data![index].id!);
                                                                  cart.removerCounter();
                                                                  cart.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));
                                                                },
                                                                child: Icon(Icons.delete))
                                                          ],
                                                        ),

                                                        SizedBox(height: 5,),
                                                        Text(snapshot.data![index].unitTag.toString() +" "+r"$"+ snapshot.data![index].productPrice.toString() ,
                                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                        ),
                                                        SizedBox(height: 5,),
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: InkWell(
                                                            onTap: (){


                                                            },
                                                            child:  Container(
                                                              height: 35,
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.green,
                                                                  borderRadius: BorderRadius.circular(5)
                                                              ),
                                                              child:  Padding(
                                                                padding: const EdgeInsets.all(4.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    InkWell(
                                                                        onTap: (){

                                                                          int quantity =  snapshot.data![index].quantity! ;
                                                                          int price = snapshot.data![index].initialPrice!;
                                                                          quantity--;
                                                                          int? newPrice = price * quantity ;

                                                                          if(quantity > 0){
                                                                            dbHelper!.updateQuantity(
                                                                                Cart(
                                                                                    id: snapshot.data![index].id!,
                                                                                    productId: snapshot.data![index].id!.toString(),
                                                                                    productName: snapshot.data![index].productName!,
                                                                                    initialPrice: snapshot.data![index].initialPrice!,
                                                                                    productPrice: newPrice,
                                                                                    quantity: quantity,
                                                                                    unitTag: snapshot.data![index].unitTag.toString(),
                                                                                    image: snapshot.data![index].image.toString())
                                                                            ).then((value){
                                                                              newPrice = 0 ;
                                                                              quantity = 0;
                                                                              cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                            }).onError((error, stackTrace){
                                                                              print(error.toString());
                                                                            });
                                                                          }

                                                                        },
                                                                        child: Icon(Icons.remove , color: Colors.white,)),
                                                                    Text( snapshot.data![index].quantity.toString(), style: TextStyle(color: Colors.white)),
                                                                    InkWell(
                                                                        onTap: (){
                                                                          int quantity =  snapshot.data![index].quantity! ;
                                                                          int price = snapshot.data![index].initialPrice!;
                                                                          quantity++;
                                                                          int? newPrice = price * quantity ;

                                                                          dbHelper!.updateQuantity(
                                                                              Cart(
                                                                                  id: snapshot.data![index].id!,
                                                                                  productId: snapshot.data![index].id!.toString(),
                                                                                  productName: snapshot.data![index].productName!,
                                                                                  initialPrice: snapshot.data![index].initialPrice!,
                                                                                  productPrice: newPrice,
                                                                                  quantity: quantity,
                                                                                  unitTag: snapshot.data![index].unitTag.toString(),
                                                                                  image: snapshot.data![index].image.toString())
                                                                          ).then((value){
                                                                            newPrice = 0 ;
                                                                            quantity = 0;
                                                                            cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice!.toString()));
                                                                          }).onError((error, stackTrace){
                                                                            print(error.toString());
                                                                          });
                                                                        },
                                                                        child: Icon(Icons.add , color: Colors.white,)),

                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
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
                              );
                            }

                          }
                          return Text('') ;
                        }),
                    Consumer<CartProvider>(builder: (context, value, child){
                      return Visibility(
                        visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                        child: Column(
                          children: [
                            ReusableWidget(title: 'Total', value: r'$'+value.getTotalPrice().toStringAsFixed(2),)
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ) ,
            ),
          );
        }
        )
    );
  }
}


class ReusableWidget extends StatelessWidget {
  final String title , value ;
  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: Theme.of(context).textTheme.subtitle2,),
          Text(value.toString() , style: Theme.of(context).textTheme.subtitle2,)
        ],
      ),
    );
  }
}