import 'package:cyber_atm_app/ui/views/account_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FunctionView extends StatefulWidget {
  const FunctionView({super.key});

  @override
  State<FunctionView> createState() => _FunctionViewState();
}

class _FunctionViewState extends State<FunctionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/imgs/fondo2.jpg")),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      "assets/icons/ic.png",
                      width: 200,
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Bienvenido a ATM Cyber",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tu mejor aliado financiero",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Container(
                height: 30,
                child: Text(
                  "Seleccione una opción",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountView()),
                                (route) => false);
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 50,
                                  color: Colors.black,
                                ),
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 28,
                                ),
                                Text(
                                  "Retiro sin tarjeta",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) => _buildAlertDialog(
                                    "Servicio Temporalmente",
                                    "\nDeshabilitado"));
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Pagos y Recargas",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 28,
                                ),
                                Container(
                                  width: 8,
                                  height: 50,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) => _buildAlertDialog(
                                    "Servicio Temporalmente",
                                    "\nDeshabilitado"));
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 8,
                                  height: 50,
                                  color: Colors.black,
                                ),
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 28,
                                ),
                                Text(
                                  "Consignaciones",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showCupertinoDialog(
                                context: context,
                                builder: (_) => _buildAlertDialog(
                                    "Servicio Temporalmente",
                                    "\nDeshabilitado"));
                          },
                          child: SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Transferencias",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 28,
                                ),
                                Container(
                                  width: 8,
                                  height: 50,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertDialog(title, content) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
            child: const Text(
              "Aceptar",
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const FunctionView()),
                  (route) => false);
            }),
      ],
    );
  }
}
