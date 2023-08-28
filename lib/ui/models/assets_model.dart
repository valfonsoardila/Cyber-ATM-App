class AssetsBillsModel {
  String image;

  AssetsBillsModel({required this.image});

  static List<AssetsBillsModel> generateBills() {
    return [
      AssetsBillsModel(image: 'assets/imgs/bills/bill_10.png'),
      AssetsBillsModel(image: 'assets/imgs/bills/bill_20.png'),
      AssetsBillsModel(image: 'assets/imgs/bills/bill_50.png'),
      AssetsBillsModel(image: 'assets/imgs/bills/bill_100.png'),
    ];
  }
}
