import 'dart:math';
import 'package:background_sms/background_sms.dart';
import 'package:cyber_atm_app/ui/auth/login.dart';
import 'package:cyber_atm_app/ui/models/bills_model.dart';
import 'package:cyber_atm_app/ui/views/moneywithdrawal_view.dart';
import 'package:cyber_atm_app/ui/views/withdrawalcode_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmountView extends StatefulWidget {
  final String tipo;
  final String cuenta;
  AmountView({super.key, required this.tipo, required this.cuenta});

  @override
  State<AmountView> createState() => _AmountViewState();
}

class _AmountViewState extends State<AmountView> {
  String otraCantidadARetirar = "";
  bool isKeyboardVisible = false;
  bool isOtherValue = false;
  String codigo = "";
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

  Future<void> enviarcodigo(telefono, codigo) async {
    print("Enviando codigo");
    print(telefono);
    print(codigo);
    SmsStatus result = await BackgroundSms.sendMessage(
        phoneNumber: telefono,
        message: "Este su codigo para retirar efectivo: $codigo");
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }

  String generarCodigo() {
    String code = "";
    for (int i = 0; i < 3; i++) {
      int random = Random().nextInt(100);
      if (random >= 0 && random < 10) {
        code = "${code}0${random.toString()}";
      } else {
        code = code + random.toString();
      }
    }
    return code;
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
                                        otraCantidadARetirar,
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                monto: 20000,
                                                                codigo: codigo,
                                                              )));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(20000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                  monto: 50000,
                                                                  codigo:
                                                                      codigo)));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(50000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                  monto: 100000,
                                                                  codigo:
                                                                      codigo)));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(100000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                  monto: 200000,
                                                                  codigo:
                                                                      codigo)));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(200000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                monto: 300000,
                                                                codigo: codigo,
                                                              )));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(300000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                  monto: 500000,
                                                                  codigo:
                                                                      codigo)));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(500000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                              onTap: () {
                                                if (widget.tipo !=
                                                    "Con tarjeta") {
                                                  codigo = generarCodigo();
                                                  enviarcodigo(
                                                      widget.cuenta, codigo);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WithdrawalCodeView(
                                                                monto: 1000000,
                                                                codigo: codigo,
                                                              )));
                                                } else {
                                                  var monto = BillsModel()
                                                      .retirar(1000000);
                                                  print(monto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MoneyWithDrawalView(
                                                                cantidadBilletes:
                                                                    monto,
                                                              )));
                                                }
                                              },
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
                                        Keyboard(
                                          tipo: widget.tipo,
                                          cantidadARetirar:
                                              otraCantidadARetirar,
                                          onNumberPressed: (int num) {
                                            push(num);
                                          },
                                          onClearPressed: (bool isClear) {
                                            borrar();
                                          },
                                          onContinuePressed: (String code) {
                                            enviarcodigo(widget.cuenta, code);
                                            codigo = code;
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : Container()
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
  late BillsModel billsModel;
  late List<int> cantidadBilletes;
  final cantidadARetirar;
  final tipo;
  final cuenta;
  final Function(int) onNumberPressed;
  final Function(bool) onClearPressed;
  final Function(String) onContinuePressed;
  Keyboard(
      {Key? key,
      required this.onNumberPressed,
      required this.onClearPressed,
      required this.onContinuePressed,
      this.tipo,
      this.cuenta,
      this.cantidadARetirar})
      : super(key: key);

  int num = 0;
  bool isClear = false;
  bool isContinue = false;

  String generarCodigo() {
    String code = "";
    for (int i = 0; i < 3; i++) {
      int random = Random().nextInt(100);
      if (random >= 0 && random < 10) {
        code = "${code}0${random.toString()}";
      } else {
        code = code + random.toString();
      }
    }
    return code;
  }

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
                            num = 1;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            num = 2;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "2",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            num = 3;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                                (route) => false);
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
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
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
                            num = 4;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "4",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            num = 5;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "5",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            num = 6;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "6",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            isClear = true;
                            onClearPressed(isClear);
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
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
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
                            num = 7;
                            onNumberPressed(num);
                          },
                          child: Text(
                            "7",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.transparent),
                              side: MaterialStatePropertyAll<BorderSide>(
                                  BorderSide(width: 2, color: Colors.black54))),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              num = 8;
                              onNumberPressed(num);
                            },
                            child: Text(
                              "8",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                side: MaterialStatePropertyAll<BorderSide>(
                                    BorderSide(
                                        width: 2, color: Colors.black54)))),
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              num = 9;
                              onNumberPressed(num);
                            },
                            child: Text(
                              "9",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                side: MaterialStatePropertyAll<BorderSide>(
                                    BorderSide(
                                        width: 2, color: Colors.black54)))),
                      ),
                      Container(
                        width: 155,
                        height: 70,
                        margin: EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AmountView(
                                          tipo: tipo, cuenta: cuenta)),
                                  (route) => false);
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
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                side: MaterialStatePropertyAll<BorderSide>(
                                    BorderSide(
                                        width: 2, color: Colors.black54)))),
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
                              num = 0;
                              onNumberPressed(num);
                            },
                            child: Text(
                              "0",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                side: MaterialStatePropertyAll<BorderSide>(
                                    BorderSide(
                                        width: 2, color: Colors.black54)))),
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
                            ),
                          ),
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
                              isContinue = true;
                              if (tipo != "Con tarjeta") {
                                var code = generarCodigo();
                                onContinuePressed(code);
                                int cantidadDinero =
                                    int.parse(cantidadARetirar);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WithdrawalCodeView(
                                              monto: cantidadDinero,
                                              codigo: code,
                                            )));
                              } else {
                                cantidadBilletes =
                                    BillsModel().retirar(cantidadARetirar);
                                print(cantidadBilletes);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MoneyWithDrawalView(
                                              cantidadBilletes:
                                                  cantidadBilletes,
                                            )));
                              }
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
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Colors.transparent),
                                side: MaterialStatePropertyAll<BorderSide>(
                                    BorderSide(
                                        width: 2, color: Colors.black54)))),
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
