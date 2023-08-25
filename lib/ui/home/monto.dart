import 'package:cyber_atm_app/ui/home/MontoPersonalizado.dart';
import 'package:cyber_atm_app/ui/home/clave.dart';
import 'package:cyber_atm_app/ui/home/codigo.dart';
import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:flutter/material.dart';
import 'componets.dart';
import 'package:intl/intl.dart';

class Monto extends StatefulWidget {
  final String tipo;
  final String codigo;
  const Monto({super.key, required this.tipo, required this.codigo});

  @override
  State<Monto> createState() => _MontoState();
}

class _MontoState extends State<Monto> {
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$ ");
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
              alignment: AlignmentDirectional(0, -0.6),
              child: TextoTipo1(
                texto: "Seleciona el valor a retirar",
              )),
          //primera fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.937, -.41),
              child: OpcionIzquierda(
                texto: numberFormat.format(20000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 20000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Clave(
                                  monto: 20000,
                                  Ckey: widget.codigo,
                                )));
                  }
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.937, -.41),
              child: OpcionDerecha(
                texto: numberFormat.format(50000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 50000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 50000, Ckey: widget.codigo)));
                  }
                },
              )),
          //segunda fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.937, -.24),
              child: OpcionIzquierda(
                texto: numberFormat.format(100000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 100000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 100000, Ckey: widget.codigo)));
                  }
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.937, -.24),
              child: OpcionDerecha(
                texto: numberFormat.format(200000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 200000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 200000, Ckey: widget.codigo)));
                  }
                },
              )),
          //Tercara fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.95, -.07),
              child: OpcionIzquierda(
                texto: numberFormat.format(300000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 300000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 300000, Ckey: widget.codigo)));
                  }
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.94, -.07),
              child: OpcionDerecha(
                texto: numberFormat.format(500000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 500000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 500000, Ckey: widget.codigo)));
                  }
                },
              )),
          //Cuarta fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.95, .1),
              child: OpcionIzquierda(
                texto: numberFormat.format(1000000),
                funcion: () {
                  if (widget.tipo == "nequi") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Codigo(
                                  monto: 1000000,
                                  codigo: widget.codigo,
                                )));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Clave(monto: 1000000, Ckey: widget.codigo)));
                  }
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.95, .1),
              child: OpcionDerecha(
                texto: "Otro Valor",
                funcion: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MonntoPersonalizado(
                                codigo: widget.codigo,
                              )));
                },
              )),

          Teclado(
            btn0: () {},
            btn1: () {},
            btn2: () {},
            btn3: () {},
            btn4: () {},
            btn5: () {},
            btn6: () {},
            btn7: () {},
            btn8: () {},
            btn9: () {},
            btnContinuar: () {},
            btnborrar: () {},
            btncancelar: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainView()),
                  (route) => false);
            },
          )
          //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
        ],
      ),
    );
  }
}
