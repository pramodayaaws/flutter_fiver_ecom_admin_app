import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/screens/add_product/methods/add_product_methods.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialButtonColumn extends StatefulWidget {
  SpeedDialButtonColumn({Key? key}) : super(key: key);

  @override
  State<SpeedDialButtonColumn> createState() => _SpeedDialButtonColumnState();
}

class _SpeedDialButtonColumnState extends State<SpeedDialButtonColumn> {
  @override
  Widget build(BuildContext context) {
    AddProductMethods methods = AddProductMethods(context: context);

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      overlayOpacity: 0.4,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add),
          label: 'Add',
          onTap: () {
            methods.addImages();
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.delete),
          label: 'Add',
          onTap: () {
            methods.deleteProductImage();
          },
        ),
      ],
    );
  }
}
