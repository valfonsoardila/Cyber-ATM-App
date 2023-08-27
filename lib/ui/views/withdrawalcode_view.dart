import 'package:flutter/material.dart';

class WithdrawalCodeView extends StatefulWidget {
  const WithdrawalCodeView({super.key});

  @override
  State<WithdrawalCodeView> createState() => _WithdrawalCodeViewState();
}

class _WithdrawalCodeViewState extends State<WithdrawalCodeView> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/ic.png",
                          width: 200,
                          height: 100,
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Ingrese su numero de cuenta",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 190,
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            child: Text(
                              "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.02,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.red[900],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Si no es correcta presione",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              "Borrar o Corregir",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[900],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/imgs/bg_keyboard.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 130,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red[600],
                                          border: Border.all(
                                              width: 1.5,
                                              color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Icons.close_rounded,
                                          size: 34,
                                          color: Colors.red[600],
                                          shadows: const <Shadow>[
                                            Shadow(
                                                color: Colors.black54,
                                                blurRadius: 10.0)
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Cancelar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "4",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "6",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.amber[600],
                                          border: Border.all(
                                              width: 1.5,
                                              color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Icons.arrow_back_ios_rounded,
                                          size: 34,
                                          color: Colors.amber[600],
                                          shadows: const <Shadow>[
                                            Shadow(
                                                color: Colors.black54,
                                                blurRadius: 10.0)
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Borrar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "7",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "9",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              width: 1.5,
                                              color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Icons.horizontal_rule_rounded,
                                          size: 34,
                                          color: Colors.white,
                                          shadows: const <Shadow>[
                                            Shadow(
                                                color: Colors.black54,
                                                blurRadius: 10.0)
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Corregir",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                          Container(
                            width: 70,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: () {},
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 155,
                            height: 70,
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 130,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen[600],
                                          border: Border.all(
                                              width: 1.5,
                                              color: Colors.black45),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Icon(Icons.circle_outlined,
                                          size: 34,
                                          color: Colors.lightGreen[600],
                                          shadows: const <Shadow>[
                                            Shadow(
                                                color: Colors.black54,
                                                blurRadius: 10.0)
                                          ]),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Continuar",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
