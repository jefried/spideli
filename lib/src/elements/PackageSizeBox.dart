import 'package:flutter/material.dart';



class PackageSizeBox extends StatelessWidget {
  final String imagePath;
  final String labelText;

  const PackageSizeBox({
    Key key ,
    this.imagePath,
    this.labelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        // width: 100 * scaleWidth,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: Border.all(
                color: const Color(0xFFEEEEEE),
                width: 1
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
                imagePath,
            ),
            const SizedBox(height: 15),
            Text(
              labelText,
              style: const TextStyle(
                  fontFamily: 'Manrope-Light',
                  fontSize: 14
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PackageSize extends StatelessWidget {
  const PackageSize({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        PackageSizeBox(imagePath: 'assets/images/create_order/lowweight.png', labelText: '< 1kg'),
        PackageSizeBox(imagePath: 'assets/images/create_order/meanweight.png', labelText: '3kg - 10kg'),
        PackageSizeBox(imagePath: 'assets/images/create_order/highweight.png', labelText: '> 10kg'),
      ],
    );
  }
}