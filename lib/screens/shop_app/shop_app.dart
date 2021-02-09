import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/shop_app/product_item.dart';
import '../../models/product.dart';

class ShopApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopAppState();
  }
}

class _ShopAppState extends State<ShopApp> {
  List<Product> products = [
    Product(id: 1, title: "곰인형", description: "예쁘고 귀여운 곰인형입니다", price: 23800, imageUrl: "http://gloomy.co.kr/web/product/big/201901/3ff3b5faa01076695ba742846b8f26c1.jpg"),
    Product(id: 2, title: "소드실드", description: "닌텐도 스위츠 소드실드 게임칩", price: 45000, imageUrl: "http://th4.tmon.kr/thumbs/image/0b6/00f/cdf/193721bbd_700x700_95_FIT.jpg"),
    Product(id: 3, title: "에어팟 프로", description: "에어팟 프로 2021년 1월 제조", price: 240000, imageUrl: "http://th2.tmon.kr/thumbs/image/279/bd2/a47/65d7a6d9a_700x700_95_FIT.jpg"),
    Product(id: 4, title: "디즈니 에어팟 프로 케이스", description: "토이스토리 빅헤드 케이스", price: 22900, imageUrl: "https://image.msscdn.net/images/goods_img/20200209/1297303/1297303_1_500.jpg"),
    Product(id: 5, title: "국내산 고랭지 배추 5포기", description: "대관령 배추", price: 17800, imageUrl: "https://lh3.googleusercontent.com/proxy/7KRxqeZ1fSdthPLmjbC9bbUO3nIr_pgbwSpeD1x8GG0GY6YoZRgwt5oOTQYxw2RFODB_3Cvj29620IFZeIhuYjwJ0wGpjK8Q7T0jTv-Enk38hror-m9F7QCF4Cm-c4J0VG2hUfuAc7wNiV0y5NNAPeVETVbu"),
    Product(id: 6, title: "메신저백", description: "비엘 메신저백", price: 78000, imageUrl: "http://gdimg.gmarket.co.kr/1503106743/still/600?ver=1539238907"),
  ];

  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      body: Container(
        height: bodyHeight,
        child: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 7/10
          ),
          itemBuilder: (context, int idx) => ProductItem(product: products[idx]),
          itemCount: products.length,
        ),
      ),
    );
  }
}
