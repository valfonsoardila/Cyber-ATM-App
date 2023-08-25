import 'package:cyber_atm_app/ui/home/codigo.dart';
import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'componets.dart';

class MonntoPersonalizado extends StatefulWidget {
  final String codigo;
  const MonntoPersonalizado({super.key, required this.codigo});

  @override
  State<MonntoPersonalizado> createState() => _MonntoPersonalizadoState();
}

class _MonntoPersonalizadoState extends State<MonntoPersonalizado> {
  String montoSF = "";
  int montoCF = 0;
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$ ");
  push(int num) {
    int tam = montoSF.length;
    setState(() {
      if (tam < 7) {
        montoSF = montoSF + num.toString();
        montoCF = int.parse(montoSF);
      }
    });
  }

  borrar() {
    int tam = montoSF.length;
    setState(() {
      if (tam > 0) {
        montoSF = montoSF.substring(0, tam - 1);
        if (tam == 1) {
          montoCF = 0;
        } else {
          montoCF = int.parse(montoSF);
        }
      }
    });
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
                texto: "Ingrese el Valor del Retiro",
              )),
          const Align(
              alignment: AlignmentDirectional(-.46, -.53),
              child: TextoTipo2(
                texto: "El monto maximo por transaccion es",
                tam: 12,
              )),

          Align(
              alignment: const AlignmentDirectional(.62, -.53),
              child: TextoTipo3(
                texto: numberFormat.format(2700000),
                tam: 12,
              )),
          Align(
              alignment: const AlignmentDirectional(0, -.20),
              child: TextoTipo1(
                texto: numberFormat.format(montoCF),
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
              int valor;
              if (montoSF.isEmpty) {
                valor = 0;
              } else {
                valor = int.parse(montoSF);
              }

              if (valor <= 2700000) {
                if (montoSF.length <= 13 && montoSF.length >= 5) {
                  if (valor % 10000 != 0) {
                    showCupertinoDialog(
                        context: context,
                        builder: (_) => _buildAlertDialog(
                            "El monto debe ser un valor cerrado ",
                            "\n Multlipo de 10"));
                    setState(() {
                      montoCF = 0;
                      montoSF = "";
                    });
                  } else {
                    showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text('Alerta'),
                              content: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    const TextSpan(text: "\n"),
                                    TextSpan(
                                        text: numberFormat.format(montoCF),
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    const TextSpan(text: "\n"),
                                    const TextSpan(
                                        text:
                                            "¿Esta seguro que desea retirar esa cantidad?",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black))
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                    child: const Text(
                                      "Aceptar",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Codigo(
                                                    monto: montoCF,
                                                    codigo: widget.codigo,
                                                  )));
                                    }),
                                TextButton(
                                    child: const Text(
                                      "Cancelar",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            ));
                  }
                } else {
                  showCupertinoDialog(
                      context: context,
                      builder: (_) => _buildAlertDialog(
                          "El monto debe ser superiror o igual a ",
                          "\n\$ 10,000"));
                }
              } else {
                showCupertinoDialog(
                    context: context,
                    builder: (_) => _buildAlertDialog(
                        "El monto maximo por transaccion es de",
                        "\n\$ 2,700,000"));
                setState(() {
                  montoCF = 0;
                  montoSF = "";
                });
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

  Widget _buildAlertDialog(contenido, contenido2) {
    return CupertinoAlertDialog(
      title: const Text('Alerta'),
      content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: <TextSpan>[
            const TextSpan(text: "\n"),
            TextSpan(
                text: contenido,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
            TextSpan(
                text: contenido2,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black))
          ])),
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
}
