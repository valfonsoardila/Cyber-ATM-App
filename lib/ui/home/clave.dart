import 'package:cyber_atm_app/ui/home/Procesando.dart';
import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:flutter/material.dart';
import 'componets.dart';

class Clave extends StatefulWidget {
  final int monto;
  final String Ckey;
  const Clave({super.key, required this.monto, required this.Ckey});

  @override
  State<Clave> createState() => _ClaveState();
}

class _ClaveState extends State<Clave> {
  String codigo = "";

  push(int num) {
    int tam = codigo.length;
    setState(() {
      if (tam < 4) {
        codigo = codigo + num.toString();
      }
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
                texto: codigo,
                tam: 45,
              )),
          const Align(
              alignment: AlignmentDirectional(0, .1),
              child: TextoTipo1(
                texto: "Por favor digita tu clave actual",
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
              if (widget.Ckey == codigo) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Procesando(monto: widget.monto)));
              } else {
                dialogoTipo1(
                    context, "Transferencia cancelada", "Clave Incorrecta", 1);
                codigo = "";
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
