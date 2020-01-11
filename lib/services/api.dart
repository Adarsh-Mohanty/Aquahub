
class Purchase {
  List purchasehistory;
  String name;
  String image;
  String latest;
  String boughtat;
  int totalpurchase;

  Purchase({this.purchasehistory, this.name, this.image, this.latest,this.boughtat, this.totalpurchase});

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
        purchasehistory: json["purchase_history"],
        name: json["name"],
        image: json["image"],
        latest: json["latest"],
        boughtat:json["bought_at"],
        totalpurchase: json["total_purchase"]);

  }
}

