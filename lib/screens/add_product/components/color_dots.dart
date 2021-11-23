import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_fiver_ecom_admin_app/common/utility.dart';
import 'package:flutter_fiver_ecom_admin_app/components/rounded_icon_btn.dart';
import '../../../constants.dart';
import '../../../models/AdminProduct.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final AdminProduct product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  List colorDotList = [];

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    List item;
    setState(() => {
          colorDotList =
              FiverAppUtility.addItemsToSubArrays(colorDotList, pickerColor, 4),
          item = colorDotList,
        });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
            // Use Material color picker:
            //
            // child: MaterialPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: changeColor,
            //   //showLabel: true, // only on portrait mode
            // ),
            //
            // Use Block color picker:
            //
            // child: BlockPicker(
            //   pickerColor: currentColor,
            //   onColorChanged: changeColor,
            // ),
            //
            // child: MultipleChoiceBlockPicker(
            //   pickerColors: currentColors,
            //   onColorsChanged: changeColors,
            // ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    colorDotList= FiverAppUtility.arrayIntoSubArrays(widget.product.colors, 5);
    setState(() {

    });

    // Now this is fixed and only for demo
    int selectedColor = 3;

    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  ...List.generate(
                    colorDotList.length,
                    (colorDotChunkIndex) => Row(
                      children: [
                        getColorRow(
                            colorDotList[colorDotChunkIndex], selectedColor),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  RoundedIconBtn(
                    icon: Icons.remove,
                    press: () {},
                  ),
                  SizedBox(width: getProportionateScreenWidth(5)),
                  RoundedIconBtn(
                    icon: Icons.add,
                    showShadow: true,
                    press: () {
                      _showMyDialog();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}





Widget getColorRow(List colorList, selectedIndex) {
  return Row(children: [
    ...List.generate(
      colorList.length,
          (index) => ColorDot(
        color: colorList[index],
        isSelected: index == selectedIndex,
      ),
    )
  ]);
}



class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
