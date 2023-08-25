import 'package:cyber_atm_app/ui/home/monto.dart';
import 'package:flutter/material.dart';
import 'componets.dart';

class Transaccion extends StatefulWidget {
  final String clave;
  const Transaccion({super.key, this.clave = "1234"});

  @override
  State<Transaccion> createState() => _TransaccionState();
}

class _TransaccionState extends State<Transaccion> {
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
                texto: "Seleciona Tu Transacción",
              )),
          //primera fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.937, -.41),
              child: OpcionIzquierda(
                texto: "Retiro cuenta corriente",
                funcion: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Monto(
                                tipo: "Corriente",
                                codigo: widget.clave,
                              )));
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.937, -.41),
              child: OpcionDerecha(
                texto: "Saldo cuenta corriente",
                funcion: () {
                  dialogoTipo1(
                      context, "Servicio Temporalmente", "\nDeshabilitado", 0);
                },
              )),
          //segunda fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.937, -.24),
              child: OpcionIzquierda(
                texto: "Retiro cuenta de ahorros",
                funcion: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Monto(
                                tipo: "ahorro",
                                codigo: widget.clave,
                              )));
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.937, -.24),
              child: OpcionDerecha(
                texto: "Saldo cuenta de ahorros",
                funcion: () {
                  dialogoTipo1(
                      context, "Servicio Temporalmente", "\nDeshabilitado", 0);
                },
              )),
          //Tercara fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.95, -.07),
              child: OpcionIzquierda(
                texto: "Tranferencias",
                funcion: () {
                  dialogoTipo1(
                      context, "Servicio Temporalmente", "\nDeshabilitado", 0);
                },
              )),
          //Cuarta fila-------------------------------
          Align(
              alignment: const AlignmentDirectional(-0.95, .1),
              child: OpcionIzquierda(
                texto: "Cambio de clave",
                funcion: () {
                  dialogoTipo1(
                      context, "Servicio Temporalmente", "\nDeshabilitado", 0);
                },
              )),
          Align(
              alignment: const AlignmentDirectional(0.93, .1),
              child: OpcionDerecha(
                texto: "Otras transacciónes",
                funcion: () {
                  dialogoTipo1(
                      context, "Servicio Temporalmente", "\nDeshabilitado", 0);
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
            btncancelar: () {},
          )
          //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
        ],
      ),
    );
  }
}
