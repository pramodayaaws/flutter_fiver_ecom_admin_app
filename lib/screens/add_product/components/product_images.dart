import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';
import 'package:flutter_fiver_ecom_admin_app/models/Product.dart';
import 'package:flutter_fiver_ecom_admin_app/providers/product_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import '../../../common/globals.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final AdminProduct product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {

  @override
  Widget build(BuildContext context) {

    return Consumer<ProductProvider>(
      builder: (context, data, child) {
        var _imagesList =
            context.read<ProductProvider>().getAddProductObject().imageList;
        var _imagesListSize = _imagesList.length;

        return Column(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(238),
              child: AspectRatio(
                aspectRatio: 1,
                child: Hero(
                    tag: context
                        .read<ProductProvider>()
                        .getAddProductObject()
                        .id
                        .toString(),
                    // ignore: unnecessary_null_comparison
                    child: _imagesListSize == 0
                        ? Image.asset("assets/images/ps4_console_white_1.png")
                        : Image.file(_imagesList[addProductSelectedImageIndex])),
              ),
            ),
            // SizedBox(height: getProportionateScreenWidth(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(_imagesListSize,
                    (index) => buildSmallProductPreview(index)),
              ],
            )
          ],
        );
      },
    );
  }

  GestureDetector buildSmallProductPreview(int index) {

    List imagesList  = context
        .read<ProductProvider>()
        .getAddProductObject()
        .imageList;

    return GestureDetector(
      onTap: () {
        setState(() {
          addProductSelectedImageIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(addProductSelectedImageIndex == index ? 1 : 0)),
        ),
        child: imagesList.isEmpty
            ? Image.asset("assets/images/ps4_console_white_1.png")
            : Image.file(context
                .read<ProductProvider>()
                .getAddProductObject()
                .imageList[index]),
      ),
    );
  }
}
