import 'package:flutter/material.dart';
import 'package:linked_all_pages/models/product_card_shop_data.dart';
import 'package:linked_all_pages/screens/product_Detailes_screen.dart';

class CardData extends StatelessWidget {
  const CardData({
    super.key,
    required this.pageIndex,
    required this.CardShopData,
  });

  final int pageIndex;
  final List<ProductCardData> CardShopData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProductDetails()));
        },
        child: Container(
          height: 160,
          width: 140,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Column(
            children: [
              Image.asset(
                CardShopData[pageIndex].image,
                height: 110,
                width: 110,
              ),
              Text(
                textAlign: TextAlign.left,
                CardShopData[pageIndex].name,
                style: const TextStyle(
                    color: Color(0xFF393F42),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "${CardShopData[pageIndex].price} EGP",
                textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color(0xFF393F42),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.amber[600],
                      ),
                      Text(
                        CardShopData[pageIndex].rate,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  Text('${CardShopData[pageIndex].review} Reviews',
                      style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
