import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmountView extends StatefulWidget {
  final String tipo;
  final String codigo;
  AmountView({super.key, required this.tipo, required this.codigo});

  @override
  State<AmountView> createState() => _AmountViewState();
}

class _AmountViewState extends State<AmountView> {
  String otraCantidadARetirar = "";
  bool isKeyboardVisible = false;
  bool isOtherValue = false;
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$ ");
  push(int num) {
    int tam = otraCantidadARetirar.length;
    setState(() {
      if (tam < 10) {
        otraCantidadARetirar = otraCantidadARetirar + num.toString();
      }
    });
  }

  borrar() {
    int tam = otraCantidadARetirar.length;
    setState(() {
      if (tam > 0) {
        otraCantidadARetirar = otraCantidadARetirar.substring(0, tam - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Retiro de Efectivo",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 28,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/imgs/fondo2.jpg")),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Image.asset(
                        "assets/icons/ic_money.png",
                        width: 200,
                        height: 120,
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Seleciona el valor a retirar",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            isOtherValue != false
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 190,
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      margin: EdgeInsets.only(bottom: 20),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Text(
                                                      numberFormat
                                                          .format(20000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      numberFormat
                                                          .format(50000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 9),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Text(
                                                      numberFormat
                                                          .format(100000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      numberFormat
                                                          .format(200000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 9),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Text(
                                                      numberFormat
                                                          .format(300000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      numberFormat
                                                          .format(500000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 9),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Text(
                                                      numberFormat
                                                          .format(1000000),
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  isOtherValue = true;
                                                  isKeyboardVisible = true;
                                                });
                                              },
                                              child: SizedBox(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "Otro Valor",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_ios_rounded,
                                                      size: 28,
                                                    ),
                                                    Container(
                                                      width: 8,
                                                      height: 50,
                                                      color: Colors.black,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                            isKeyboardVisible != false
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isKeyboardVisible =
                                                  !isKeyboardVisible;
                                              isOtherValue = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons
                                                .keyboard_double_arrow_down_rounded,
                                            size: 30,
                                          ),
                                        ),
                                        Keyboard(),
                                      ],
                                    ),
                                  )
                                : Container(
                                    // width: MediaQuery.of(context).size.width,
                                    // height: 50,
                                    // child: Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: [
                                    //     IconButton(
                                    //       onPressed: () {
                                    //         setState(() {
                                    //           isKeyboardVisible =
                                    //               !isKeyboardVisible;
                                    //         });
                                    //       },
                                    //       icon: Icon(
                                    //         Icons
                                    //             .keyboard_double_arrow_up_rounded,
                                    //         size: 30,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.02,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  "Si no es correcta presione",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Borrar o Corregir",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[900],
                ),
              ),
            ],
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imgs/bg_keyboard.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 130,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[600],
                                      border: Border.all(
                                          width: 1.5, color: Colors.black45),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.close_rounded,
                                      size: 34,
                                      color: Colors.red[600],
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.black54,
                                            blurRadius: 10.0)
                                      ]),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Cancelar",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amber[600],
                                      border: Border.all(
                                          width: 1.5, color: Colors.black45),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.arrow_back_ios_rounded,
                                      size: 34,
                                      color: Colors.amber[600],
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.black54,
                                            blurRadius: 10.0)
                                      ]),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Borrar",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "7",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "8",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "9",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.5, color: Colors.black45),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.horizontal_rule_rounded,
                                      size: 34,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.black54,
                                            blurRadius: 10.0)
                                      ]),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Corregir",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Text(
                            "0",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {},
                          child: Text(
                            "",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            //Funcion
                          },
                          child: Row(
                            children: [
                              RotatedBox(
                                quarterTurns: 130,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.lightGreen[600],
                                      border: Border.all(
                                          width: 1.5, color: Colors.black45),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Icon(Icons.circle_outlined,
                                      size: 34,
                                      color: Colors.lightGreen[600],
                                      shadows: <Shadow>[
                                        Shadow(
                                            color: Colors.black54,
                                            blurRadius: 10.0)
                                      ]),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Continuar",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
