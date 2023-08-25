import 'package:cyber_atm_app/ui/home/cuenta.dart';
import 'package:cyber_atm_app/ui/home/transacciones.dart';
import 'package:flutter/material.dart';
import 'componets.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fondo.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      //Fondo(
      //   contenido: [
      //     const Align(
      //         alignment: AlignmentDirectional(-0.95, -0.90),
      //         child: Logo(
      //           w: 200.0,
      //           h: 80.0,
      //         )),
      //     const Align(
      //         alignment: AlignmentDirectional(0.65, -0.6),
      //         child: TextoTipo1(
      //           texto: "Por favor, Inserta \ntu tarjeta",
      //         )),
      //     const Align(
      //         alignment: AlignmentDirectional(0.35, -0.47),
      //         child: TextoTipo2(texto: "Please insert your card")),
      //     const Align(
      //         alignment: AlignmentDirectional(-.80, -.61),
      //         child: RotatedBox(
      //             quarterTurns: 0,
      //             child: Imagenes(
      //               ruta: "assets/insertcardcolor.png",
      //               w: 100.0,
      //               h: 100.0,
      //             ))),
      //     Align(
      //         alignment: const AlignmentDirectional(-0.95, .1),
      //         child: OpcionIzquierda(
      //           texto: "Retiros Nequi",
      //           funcion: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => const Cuenta()));
      //           },
      //         )),
      //     Align(
      //         alignment: const AlignmentDirectional(0.937, -.24),
      //         child: OpcionDerecha(
      //           texto: "Pagos",
      //           funcion: () {
      //             dialogoTipo1(
      //                 context, "Servicio Temporalmente", "\nDeshabilitado", 0);
      //           },
      //         )),
      //     Align(
      //         alignment: const AlignmentDirectional(0.92, -.07),
      //         child: OpcionDerecha(
      //           texto: "Consignaciones",
      //           funcion: () {
      //             dialogoTipo1(
      //                 context, "Servicio Temporalmente", "\nDeshabilitado", 0);
      //           },
      //         )),
      //     Align(
      //         alignment: const AlignmentDirectional(0.9, .1),
      //         child: OpcionDerecha(
      //           texto: "Retiro\nBancolombia a la mano",
      //           funcion: () {
      //             Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const Transaccion()));
      //           },
      //         )),
      //     Teclado(
      //       btn0: () {},
      //       btn1: () {},
      //       btn2: () {},
      //       btn3: () {},
      //       btn4: () {},
      //       btn5: () {},
      //       btn6: () {},
      //       btn7: () {},
      //       btn8: () {},
      //       btn9: () {},
      //       btnContinuar: () {},
      //       btnborrar: () {},
      //       btncancelar: () {
      //         Navigator.pushAndRemoveUntil(
      //             context,
      //             MaterialPageRoute(builder: (context) => const MainView()),
      //             (route) => false);
      //       },
      //     )
      //     //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
      //   ],
      // ),
    );
  }
}
