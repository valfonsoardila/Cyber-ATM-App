import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:cyber_atm_app/ui/home/transacciones.dart';
import 'package:flutter/material.dart';
import '../home/componets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MainViewState();
}

class _MainViewState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/fondo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/ic_design.png",
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cyber ATM",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Iniciar sesion",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.5)),
                    ),
                    labelText: 'Numero de telefono',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.phone, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.5)),
                    ),
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainView()));
                    },
                    child: Text("Ingresar"),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(160, 45)),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )),
              ],
            ),
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
      //             MaterialPageRoute(builder: (context) => const Login()),
      //             (route) => false);
      //       },
      //     )
      //     //Align(alignment: AlignmentDirectional(-0.9, -0.9), child: Logo()),
      //   ],
      // ),
    );
  }
}
