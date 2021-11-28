import 'package:flutter/material.dart';
import 'package:flutter_fiver_ecom_admin_app/components/default_button.dart';
import 'package:flutter_fiver_ecom_admin_app/models/AdminProduct.dart';
import 'package:flutter_fiver_ecom_admin_app/models/Product.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final AdminProduct product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();

  String? email;

  String? password;

  String? name;

  String? description;

  String? title;

  double? height;

  double? weight;

  double? width;

  double? price;

  double? oldPrice;

  double? discount;

  String? heightType;

  String? widthType;

  String? weightType;

  String? priceType;

  bool? remember = false;

  List<String> images =   [ "assets/images/ps4_console_white_1.png",];

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) errors.add(error);
  }

  void removeError({String? error}) {
    if (errors.contains(error)) errors.remove(error);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ///title
              buildTitleFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              ///description
              buildDescriptionFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              ///price
              Row(
                children: [
                  Expanded(flex: 8,child: buildPriceFormField()), Expanded(flex:1,child: SizedBox(height: getProportionateScreenHeight(30))), Expanded(flex: 6,child: buildPriceDropDown())
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              ///height
              Row(
                children: [
                  Expanded(flex: 8,child: buildHeightFormField()), Expanded(flex:1,child: SizedBox(height: getProportionateScreenHeight(30))), Expanded(flex: 6,child: buildHeightDropDown())
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              ///width
              Row(
                children: [
                  Expanded(flex: 8,child: buildWidthFormField()), Expanded(flex:1,child: SizedBox(height: getProportionateScreenHeight(30))), Expanded(flex: 6,child: buildWidthDropDown())
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              ///weight
              Row(
                children: [
                  Expanded(flex: 8,child: buildWeightFormField()), Expanded(flex:1,child: SizedBox(height: getProportionateScreenHeight(30))), Expanded(flex: 6,child: buildWeightDropDown())
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),

            ],
          ),
        ),
      ],
    );
  }

  /// Title
  TextFormField buildTitleFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => title = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmptyInput);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmptyInput);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Title",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Description
  TextFormField buildDescriptionFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => description = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmptyInput);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmptyInput);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Description",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Price
  TextFormField buildPriceFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => price = newValue as double?,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmptyPrice);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmptyPrice);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

/// Height
  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => height = newValue as double?,
      onChanged: (value) {
        return;
      },
      decoration: const InputDecoration(
        labelText: "Height",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Width
  TextFormField buildWidthFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => width = newValue as double?,
      onChanged: (value) {
        return;
      },
      decoration: const InputDecoration(
        labelText: "Width",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Weight
  TextFormField buildWeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => weight = newValue as double?,
      onChanged: (value) {
        return;
      },
      decoration: const InputDecoration(
        labelText: "Weight",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Old Price
  TextFormField buildOldPriceFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => weight = newValue as double?,
      onChanged: (value) {
        return;
      },
      decoration: const InputDecoration(
        labelText: "Old Price",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  /// Discount
  TextFormField buildDiscountFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      onSaved: (newValue) => weight = newValue as double?,
      onChanged: (value) {
        return;
      },
      decoration: const InputDecoration(
        labelText: "Discount",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  ///Build height Dropdown
  Widget buildHeightDropDown(){
    return  Container(
      padding: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: DropdownButton<String>(
        value: heightType,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
        ),
        onChanged: (newValue) {
          heightType = newValue!;
        },
        items: <String>['mm', 'cm', 'm',]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  ///Build weight Dropdown
  Widget buildWeightDropDown(){
    return  Container(
      padding: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20)
      ),
      child: DropdownButton<String>(
        value: weightType,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
        ),
        onChanged: (newValue) {
          weightType = newValue!;
        },
        items: <String>['mg', 'g', 'kg','pound', 'ounce', 'penny']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  ///Build price Dropdown
  Widget buildPriceDropDown(){
    return  Container(
      padding: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: priceType,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
        ),
        onChanged: (newValue) {
          priceType = newValue!;
        },
        items: <String>['usd','inr']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  ///Build width Dropdown
  Widget buildWidthDropDown(){
    return SizedBox();
    return  Container(
      padding: EdgeInsets.only(left: 25, right: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        value: widthType,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        underline: Container(
          height: 2,
        ),
        onChanged: (newValue) {
          widthType = newValue!;
        },
        items: <String>['mm', 'cm', 'm',]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}


