// ignore_for_file: avoid_print

class Cajero {
  List<int> denominaciones = [10, 20, 50, 100];
  List<int> cantidades = [0, 0, 0, 0];

  Cajero();

  List<int> retirar(monto) {
    for (int i = 0; i < 4; i++) {
      for (int j = i; j < 4; j++) {
        if (monto >= denominaciones[j]) {
          monto = monto - denominaciones[j];
          cantidades[j] = cantidades[j] + 1;
        } else {
          j = 4;
        }
        if (monto == 0) {
          i = 4;
          j = 4;
        }
        if (i == 3 && monto != 0) {
          i = 0 - 1;
        }
      }
    }
    print(cantidades);
    return cantidades;
  }
}
