// ignore_for_file: prefer_typing_uninitialized_variables, deprecated_member_use, unused_local_variable

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';


class Teclado extends StatelessWidget {
  final btn1;
  final btn2;
  final btn3;
  final btn4;
  final btn5;
  final btn6;
  final btn7;
  final btn8;
  final btn9;
  final btn0;
  final btncancelar;
  final btnborrar;
  final btnContinuar;
  const Teclado({
    Key? key,
    this.btn1,
    this.btn2,
    this.btn3,
    this.btn4,
    this.btn5,
    this.btn6,
    this.btn7,
    this.btn8,
    this.btn9,
    this.btn0,
    this.btncancelar,
    this.btnborrar,
    this.btnContinuar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: const AlignmentDirectional(0, .95),
        child: Container(
            width: 390,
            height: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/fondometal.jpg"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BotonTeclado(
                      texto: "1",
                      funcion: btn1,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "2", funcion: btn2),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "3", funcion: btn3),
                    const SizedBox(
                      width: 20,
                    ),
                    BotonTecladoEspecial(
                        texto: "Cancelar",
                        w: 130.0,
                        icon: Icons.close_rounded,
                        color: Colors.red[600],
                        funcion: btncancelar),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BotonTeclado(texto: "4", funcion: btn4),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "5", funcion: btn5),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "6", funcion: btn6),
                    const SizedBox(
                      width: 20,
                    ),
                    BotonTecladoEspecial(
                        texto: "Borrar",
                        w: 130.0,
                        icon: Icons.arrow_back_ios_rounded,
                        color: Colors.amber[600],
                        funcion: btnborrar),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BotonTeclado(texto: "7", funcion: btn7),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "8", funcion: btn8),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "9", funcion: btn9),
                    const SizedBox(
                      width: 20,
                    ),
                    BotonTecladoEspecial(
                        texto: "",
                        w: 130.0,
                        rote: 1,
                        icon: Icons.horizontal_rule_rounded,
                        color: Colors.white,
                        funcion: () {}),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BotonTeclado(texto: " ", funcion: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: "0", funcion: btn0),
                    const SizedBox(
                      width: 5,
                    ),
                    BotonTeclado(texto: " ", funcion: () {}),
                    const SizedBox(
                      width: 20,
                    ),
                    BotonTecladoEspecial(
                        texto: "Continuar",
                        w: 130.0,
                        icon: Icons.circle_outlined,
                        color: Colors.lightGreen[600],
                        funcion: btnContinuar),
                  ],
                ),
              ],
            )));
  }
}

class BotonTeclado extends StatelessWidget {
  final texto;
  final w;
  final h;
  final color;
  final funcion;
  const BotonTeclado(
      {Key? key,
      required this.texto,
      this.w = 60.0,
      this.h = 60.0,
      this.color = Colors.transparent,
      this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton(
          onPressed: funcion,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(color),
              side: const MaterialStatePropertyAll<BorderSide>(
                  BorderSide(width: 2, color: Colors.black54))),
          child: TextoTipo3(
            texto: texto,
            align: TextAlign.center,
            tam: 26,
          )),
    );
  }
}

class BotonTecladoEspecial extends StatelessWidget {
  final texto;
  final w;
  final h;
  final color;
  final icon;
  final rote;
  final funcion;
  const BotonTecladoEspecial(
      {Key? key,
      required this.texto,
      required this.icon,
      this.w = 60.0,
      this.h = 60.0,
      this.rote = 0,
      this.color = Colors.transparent,
      this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton(
          onPressed: funcion,
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                  EdgeInsets.fromLTRB(7, 2, 7, 2)),
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.transparent),
              side: MaterialStatePropertyAll<BorderSide>(
                  BorderSide(width: 2, color: Colors.black54))),
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: rote,
                child: Container(
                  decoration: BoxDecoration(
                      color: color,
                      border: Border.all(width: 1.5, color: Colors.black45),
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(icon,
                      size: 36,
                      color: color,
                      shadows: const <Shadow>[
                        Shadow(color: Colors.black54, blurRadius: 10.0)
                      ]),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              TextoTipo3(
                texto: texto,
                align: TextAlign.center,
                tam: 16,
              ),
            ],
          )),
    );
  }
}

class OpcionIzquierda extends StatelessWidget {
  final texto;
  final funcion;
  const OpcionIzquierda({Key? key, this.texto = "Text insert", this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcion,
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 50,
              color: Colors.black,
            ),
            const Icon(
              Icons.arrow_back_ios_rounded,
              size: 28,
            ),
            TextoTipo1(
              texto: texto,
              tam: 13,
            )
          ],
        ),
      ),
    );
  }
}

class OpcionDerecha extends StatelessWidget {
  final texto;
  final funcion;
  const OpcionDerecha({Key? key, this.texto = "Text insert", this.funcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: funcion,
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextoTipo3(
              texto: texto,
              tam: 13,
            ),
            const Icon(
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
    );
  }
}

class TextoTipo2 extends StatelessWidget {
  final texto;
  final tam;
  const TextoTipo2({Key? key, required this.texto, this.tam = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: double.parse(tam.toString())),
    );
  }
}

class TextoTipo1 extends StatelessWidget {
  final texto;
  final tam;
  const TextoTipo1({Key? key, required this.texto, this.tam = 26})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: double.parse(tam.toString())),
    );
  }
}

class TextoTipo3 extends StatelessWidget {
  final texto;
  final tam;
  final align;
  final color;
  const TextoTipo3(
      {Key? key,
      required this.texto,
      this.tam = 26,
      this.align = TextAlign.right,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: double.parse(tam.toString()),
      ),
    );
  }
}

class Fondo extends StatelessWidget {
  final List<Widget> contenido;
  const Fondo({
    Key? key,
    required this.contenido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fondo3.webp"), fit: BoxFit.fill)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(150, 255, 255, 255),
        child: Stack(
          alignment: const AlignmentDirectional(0, 0),
          children: contenido,
        ),
      ),
    );
  }
}

class Fondo2 extends StatelessWidget {
  final Widget contenido;
  const Fondo2({
    Key? key,
    required this.contenido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/fondo3.webp"), fit: BoxFit.fill)),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(150, 255, 255, 255),
          child: contenido),
    );
  }
}

class Logo extends StatelessWidget {
  final w;
  final h;
  const Logo({Key? key, this.w = 120.0, this.h = 50.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logobanco3.png"), fit: BoxFit.fill)),
    );
  }
}

class Imagenes extends StatelessWidget {
  final w;
  final h;
  final ruta;
  const Imagenes({Key? key, required this.ruta, this.w = 120.0, this.h = 50.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ruta), fit: BoxFit.fill)),
    );
  }
}

dynamic dialogoTipo1(context, contenido, contenido2, modo) {
  return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const TextoTipo3(
              texto: 'Alerta',
              color: Colors.red,
              align: TextAlign.center,
              tam: 18,
            ),
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
                    if (modo == 0) {
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ));
}

class PermissionWidget extends StatefulWidget {
  /// Constructs a [PermissionWidget] for the supplied [Permission]
  const PermissionWidget(this._permission);

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    requestPermission(_permission);
    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                checkServiceStatus(
                    context, _permission as PermissionWithService);
              })
          : null,
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(
      BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    final status = await permission.request();

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
    });
  }
}
