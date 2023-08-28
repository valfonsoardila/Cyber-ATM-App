class BillsModel {
  List<int> denominaciones = [10000, 20000, 50000, 100000];
  List<int> cantidades = [0, 0, 0, 0];

  BillsModel();

  List<int> retirar(monto) {
    print("Llego al modelo el monto: $monto");
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
    return cantidades;
  }
}
