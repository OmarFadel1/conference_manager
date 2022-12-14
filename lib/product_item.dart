import 'package:buy_it/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final Widget imageUrl;
  final double price;
  ProductItem(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});
  void selectProduct(BuildContext context) {
    Navigator.of(context).pushNamed(ProductDetailScreen.id, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProduct(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: imageUrl),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(children: <Widget>[
                Icon(
                  Icons.attach_money_rounded,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('$price EGP')
              ]),
            )
          ],
        ),
      ),
    );
  }
}
