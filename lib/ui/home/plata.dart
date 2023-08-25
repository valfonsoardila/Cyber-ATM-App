import 'package:cyber_atm_app/ui/home/logica.dart';
import 'package:cyber_atm_app/ui/home/main_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'componets.dart';

class Plata extends StatefulWidget {
  final int monto;
  const Plata({super.key, required this.monto});

  @override
  State<Plata> createState() => _PlataState();
}

class _PlataState extends State<Plata> {
  late Cajero caja;
  late List<int> cant;
  late List<String> billetes;
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$ ");
  @override
  void initState() {
    caja = Cajero();
    cant = caja.retirar(widget.monto / 1000);
    print("monto ${widget.monto}");
    billetes = [];
    billetes = cargarBilletes();

    super.initState();
  }

  inicio() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainView()),
        (route) => false);
  }

  List<String> cargarBilletes() {
    List<String> lista = [];
    for (var i = 3; i >= 0; i--) {
      for (var j = 0; j < cant[i]; j++) {
        lista.add("billete${caja.denominaciones[i]}k");
      }
    }
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(250.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            flexibleSpace:
                Stack(alignment: const AlignmentDirectional(0, 0), children: [
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0.0, 0.95),
                      colors: <Color>[
                        Color.fromARGB(127, 255, 255, 255),
                        Color.fromARGB(127, 0, 0, 0),
                      ],
                    ),
                  ),
                  child: const TabBar(indicatorColor: Colors.white, tabs: [
                    TextoTipo3(
                      texto: "Retiro",
                      tam: 16,
                    ),
                    TextoTipo3(
                      texto: "Resumen",
                      tam: 16,
                    )
                  ]),
                ),
              ),
              Align(
                  alignment: const AlignmentDirectional(0.9, -0.55),
                  child: IconButton(
                      onPressed: inicio,
                      icon: Icon(
                        Icons.delete_outlined,
                        size: 40,
                      ))),
            ]),
            //shadowColor: Colors.transparent,
          ),
        ),
        body: Fondo(contenido: [
          const Align(
              alignment: AlignmentDirectional(-0.95, -0.90),
              child: Logo(
                w: 200.0,
                h: 80.0,
              )),
          const Align(
              alignment: AlignmentDirectional(0, -.7),
              child: TextoTipo3(
                texto: "Por favor Retire su dinero\n del Cajero",
                tam: 22,
                align: TextAlign.center,
              )),
          Align(
              alignment: const AlignmentDirectional(0, -.53),
              child: TextoTipo3(
                texto: numberFormat.format(widget.monto),
                tam: 22,
                align: TextAlign.center,
                color: const Color.fromARGB(255, 11, 167, 76),
              )),
          Align(
            alignment: const AlignmentDirectional(0, .85),
            child: Container(
              height: 550,
              color: const Color.fromARGB(179, 0, 0, 0),
              child: TabBarView(children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: billetes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Imagenes(
                        ruta: "assets/${billetes[index]}.jpg",
                        h: 120.0,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Imagenes(
                                  ruta: "assets/billete100k.jpg",
                                  w: 170.0,
                                  h: 80.0),
                              TextoTipo3(
                                texto: cant[3].toString(),
                                color: Colors.white,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Imagenes(
                                  ruta: "assets/billete50k.jpg",
                                  w: 170.0,
                                  h: 80.0),
                              TextoTipo3(
                                texto: cant[2].toString(),
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Imagenes(
                                  ruta: "assets/billete20k.jpg",
                                  w: 170.0,
                                  h: 80.0),
                              TextoTipo3(
                                texto: cant[1].toString(),
                                color: Colors.white,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Imagenes(
                                  ruta: "assets/billete10k.jpg",
                                  w: 170.0,
                                  h: 80.0),
                              TextoTipo3(
                                texto: cant[0].toString(),
                                color: Colors.white,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

// SizedBox(
//                       child: Imagenes(
//                           ruta: "assets/billete100k.jpg", w: 100.0, h: 30.0),
//                     ),
//                     SizedBox(child: TextoTipo3(texto: "x1")),
//                     SizedBox(
//                       child: Imagenes(
//                           ruta: "assets/billete50k.jpg", w: 100.0, h: 30.0),
//                     ),
//                     SizedBox(child: TextoTipo3(texto: "x1")),
//                     SizedBox(
//                       child: Imagenes(
//                           ruta: "assets/billete20k.jpg", w: 100.0, h: 30.0),
//                     ),
//                     SizedBox(child: TextoTipo3(texto: "x1")),
//                     SizedBox(
//                       child: Imagenes(
//                           ruta: "assets/billete10k.jpg", w: 100.0, h: 30.0),
//                     ),
//                     SizedBox(child: TextoTipo3(texto: "x1")),