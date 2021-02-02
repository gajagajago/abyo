import 'package:flutter/material.dart';
import 'asset.dart';

class Assets extends StatelessWidget {
  final List<dynamic> assets;
  final Function setCategory;

  Assets(this.assets, this.setCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(15)
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          child: GridView(
            children: [
              ...(assets).map((e) => Asset(e, setCategory))
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 10/2,
            ),
          ),
        )
    );
  }
}
