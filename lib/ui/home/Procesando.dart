import 'dart:async';
import 'package:cyber_atm_app/ui/home/plata.dart';
import 'package:flutter/material.dart';
import 'componets.dart';

class Procesando extends StatefulWidget {
  final int monto;
  const Procesando({super.key, required this.monto});

  @override
  State<Procesando> createState() => _ProcesandoState();
}

class _ProcesandoState extends State<Procesando> {
  String codigo = "";

  push(int num) {
    int tam = codigo.length;
    setState(() {
      if (tam < 6) {
        codigo = codigo + num.toString();
      }
    });
  }

  espera() {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => Plata(monto: widget.monto)));
    });
  }

  borrar() {
    int tam = codigo.length;
    setState(() {
      if (tam > 0) {
        codigo = codigo.substring(0, tam - 1);
      }
    });
  }

  @override
  void initState() {
    espera();
    super.initState();
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
              alignment: AlignmentDirectional(0, -.9),
              child: Imagenes(
                ruta: "assets/load32.gif",
                w: 500.0,
                h: 400.0,
              )),
          const Align(
              alignment: AlignmentDirectional(0, -.25),
              child: TextoTipo1(
                texto: "Por favor espere",
                tam: 30,
              )),
          //primera fila-------------------------------
          const Align(
              alignment: AlignmentDirectional(0, -.17),
              child: TextoTipo2(
                texto: "su solicitud esta siendo procesada",
              )),
          Align(
              alignment: const AlignmentDirectional(-.67, -.17),
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
            btnborrar: () {
              borrar();
            },
          ),
          //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
        ],
      ),
    );
  }
}
