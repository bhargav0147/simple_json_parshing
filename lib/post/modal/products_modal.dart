class ProductsModal {
  String? title, info, cate, image;
  int? id;
  double? price;
  Rate? rate;

  ProductsModal({this.title,
    this.info,
    this.cate,
    this.image,
    this.id,
    this.price,
    this.rate});

  factory ProductsModal.fromJson(Map m1)
  {
    return ProductsModal(rate: Rate.fomJson(m1['rating']),
        id: m1['id'],
        image: m1['image'],
        cate: m1['category'],
        info: m1['description'],
        price: m1['price'],
        title: m1['title']);
  }
}

class Rate {
  int? count;
  double? rate;

  Rate({this.rate, this.count});

  factory Rate.fomJson(Map m1)
  {
    return Rate(count: m1['count'], rate: m1['rate']);
  }
}