import 'package:cyber_atm_app/ui/home/Procesando.dart';
import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:flutter/material.dart';
import 'componets.dart';

class Codigo extends StatefulWidget {
  final int monto;
  final String codigo;
  const Codigo({super.key, required this.monto, required this.codigo});

  @override
  State<Codigo> createState() => _CodigoState();
}

class _CodigoState extends State<Codigo> {
  String codxx = "";

  push(int num) {
    int tam = codxx.length;
    setState(() {
      if (tam < 6) {
        codxx = codxx + num.toString();
      }
    });
  }

  borrar() {
    int tam = codxx.length;
    setState(() {
      if (tam > 0) {
        codxx = codxx.substring(0, tam - 1);
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
              child: Imagenes(
                ruta: "assets/clave1.png",
                w: 100.0,
                h: 100.0,
              )),
          Align(
              alignment: const AlignmentDirectional(0, -.2),
              child: TextoTipo1(
                texto: codxx,
                tam: 45,
              )),
          const Align(
              alignment: AlignmentDirectional(0, .1),
              child: TextoTipo1(
                texto: "Por favor digita tu codigo actual",
                tam: 22,
              )),
          //primera fila-------------------------------
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
            btnborrar: () {
              borrar();
            },
            btnContinuar: () {
              if (codxx.compareTo(widget.codigo) == 0) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Procesando(monto: widget.monto)));
              } else {
                dialogoTipo1(
                    context, "Transferencia cancelada", "Codigo Invalido", 1);
              }
            },
            btncancelar: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainView()),
                  (route) => false);
            },
          ),
          //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
        ],
      ),
    );
  }
}
