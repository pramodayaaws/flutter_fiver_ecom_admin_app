import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DashboardCardBanner extends StatefulWidget {

  final String title;
  final String subTitle;
  final Color backgroundColor;

  const DashboardCardBanner({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<DashboardCardBanner> createState() => _DashboardCardBannerState();
}

class _DashboardCardBannerState extends State<DashboardCardBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), getProportionateScreenWidth(10), getProportionateScreenWidth(20), getProportionateScreenWidth(10)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: widget.title),
            TextSpan(
              text: widget.subTitle,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
