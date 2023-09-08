import 'package:cyber_atm_app/ui/home/function_view.dart';
import 'package:cyber_atm_app/ui/models/assets_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class MoneyWithDrawalView extends StatefulWidget {
  final cantidadBilletes;
  MoneyWithDrawalView({super.key, this.cantidadBilletes});

  @override
  State<MoneyWithDrawalView> createState() => _MoneyWithDrawalViewState();
}

class _MoneyWithDrawalViewState extends State<MoneyWithDrawalView> {
  List<int> cantidadBilletes = [];

  @override
  void initState() {
    super.initState();
    print(widget.cantidadBilletes);
    cantidadBilletes = widget.cantidadBilletes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/imgs/fondo2.jpg")),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      "assets/icons/ic_get_money.png",
                      width: 200,
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "¡Por favor retire su dinero!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                child: Swiper(
                  itemWidth: 400,
                  itemHeight: 268,
                  loop: true,
                  duration: 1200,
                  scrollDirection: Axis.vertical,
                  itemCount: AssetsBillsModel.generateBills().length,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 220,
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white.withOpacity(0.9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Image.asset(
                              AssetsBillsModel.generateBills()[index].image,
                              width: 360,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "${cantidadBilletes[index]}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FunctionView()),
                          (route) => false);
                    },
                    child: Text("Finalizar transacción"),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(160, 45)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
