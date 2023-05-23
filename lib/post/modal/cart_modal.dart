class CartModal {
  String? date;
  int? id, userId, v;
  List<Products>? productsList = [];

  CartModal({this.date, this.id, this.userId, this.v, this.productsList});

  factory CartModal.fromJson(Map m1) {
    return CartModal(
        v: m1['__v'],
        id: m1['id'],
        date: m1['date'],
        userId: m1['userId'],
        productsList: m1['products'].map((e)=>Products.fromJson(e)));
  }
}

class Products {
  int? proid, proqa;

  Products({this.proid, this.proqa});

  factory Products.fromJson(Map m1) {
    return Products(proid: m1['productId'], proqa: m1['quantity']);
  }
}
