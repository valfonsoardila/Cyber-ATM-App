// ignore_for_file: depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, avoid_print, prefer_const_constructors

import 'dart:math';

import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:cyber_atm_app/ui/home/monto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'componets.dart';
import 'package:background_sms/background_sms.dart';

class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  String numCuenta = "";
  Permission p = Permission.sms;
  push(int num) {
    int tam = numCuenta.length;
    setState(() {
      if (tam < 10) {
        numCuenta = numCuenta + num.toString();
      }
    });
  }

  borrar() {
    int tam = numCuenta.length;
    setState(() {
      if (tam > 0) {
        numCuenta = numCuenta.substring(0, tam - 1);
      }
    });
  }

  String codigo() {
    String codexx = "";
    for (int i = 0; i < 3; i++) {
      int random = Random().nextInt(100);
      if (random >= 0 && random < 10) {
        codexx = "${codexx}0${random.toString()}";
      } else {
        codexx = codexx + random.toString();
      }
    }
    return codexx;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fondo(
        contenido: [
          const Align(
              alignment: AlignmentDirectional(-0.95, -0.90),
              child: Logo(
                w: 200.0,
                h: 80.0,
              )),
          const Align(
              alignment: AlignmentDirectional(0, -0.60),
              child: TextoTipo1(
                texto: "Ingrese numero de cuenta",
              )),
          Align(
              alignment: const AlignmentDirectional(0, -.25),
              child: TextoTipo1(
                texto: numCuenta,
                tam: 30,
              )),
          const Align(
              alignment: AlignmentDirectional(-.2, .18),
              child: TextoTipo2(
                texto: "si no es correcta Preciona               ó           ",
              )),
          const Align(
              alignment: AlignmentDirectional(.33, .18),
              child: TextoTipo3(
                texto: "Borrar",
                tam: 16,
              )),
          const Align(
              alignment: AlignmentDirectional(.78, .18),
              child: TextoTipo3(
                texto: "Corregir",
                tam: 16,
              )),
          Align(
              alignment: const AlignmentDirectional(-.85, .18),
              child: Container(
                color: Colors.red[800],
                width: 7,
                height: 14,
              )),
          //primera fila-
          Align(
              alignment: AlignmentDirectional(0, 1),
              child: PermissionWidget(p)),
          Teclado(
            btn0: () {
              push(0);
            },
            btn1: () {
              push(1);
            },
            btn2: () {
              push(2);
            },
            btn3: () {
              push(3);
            },
            btn4: () {
              push(4);
            },
            btn5: () {
              push(5);
            },
            btn6: () {
              push(6);
            },
            btn7: () {
              push(7);
            },
            btn8: () {
              push(8);
            },
            btn9: () {
              push(9);
            },
            btnContinuar: () {
              String cod = codigo();
              enviarcodigo(numCuenta, "Su codigo de retiro temporal es: $cod");
              if (numCuenta.length == 10) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Monto(
                              tipo: "nequi",
                              codigo: cod,
                            )));
              } else {
                showCupertinoDialog(
                    context: context, builder: (_) => _buildAlertDialog());
              }
            },
            btncancelar: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainView()),
                  (route) => false);
            },
            btnborrar: () {
              borrar();
            },
          ),
          //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
        ],
      ),
    );
  }

  Widget _buildAlertDialog() {
    return CupertinoAlertDialog(
      title: const Text('Alerta'),
      content: const Text("Numero de ceunta invalido"),
      actions: <Widget>[
        TextButton(
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ],
    );
  }

  Future<void> enviarcodigo(telefono, codigo) async {
    SmsStatus result =
        await BackgroundSms.sendMessage(phoneNumber: telefono, message: codigo);
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }
  }
}
