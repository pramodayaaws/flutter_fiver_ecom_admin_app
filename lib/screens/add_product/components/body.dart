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

class Body extends StatelessWidget {
  final AdminProduct product;

  Body({Key? key, required this.product}) : super(key: key);

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
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              buildTitleFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildDescriptionFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildPriceFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildHeightFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildWidthFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              buildWeightFormField(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Row(
                children: [
                 Expanded(flex: 3 ,child: buildHeightFormField()), Expanded(flex: 1,child: buildDropDown())
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
        hintText: "Enter product title",
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
        hintText: "Enter product description",
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
        hintText: "Enter product price",
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
        hintText: "Enter product height",
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
        hintText: "Enter product width",
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
        hintText: "Enter product weight",
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
        hintText: "Enter product old price",
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
        hintText: "Enter product discount",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }



  ///Build Dropdown
  Widget buildDropDown(){
    return  DropdownButton<String>(
      value: heightType,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
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
    );
  }


}


