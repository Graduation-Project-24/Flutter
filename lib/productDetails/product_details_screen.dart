import 'package:flutter/material.dart';
import 'package:linked_all_pages/productDetails/product_service.dart';
import 'product_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  final int productId;

  const ProductDetailsWidget({Key? key, required this.productId})
      : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late Future<Map<String, dynamic>> _productDetails;

  @override
  void initState() {
    super.initState();
    _productDetails = fetchProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _productDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return _buildProductDetails(snapshot.data!);
        }
      },
    );
  }

  Widget _buildProductDetails(Map<String, dynamic> productData) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color(0xff384959),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Color(0xff384959),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              '${productData['price']} EGP',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFAA933),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              '${productData['name']}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: Colors.black,
                height: 1,
                letterSpacing: 0.20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Overview',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFAA933),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Color.fromARGB(255, 196, 56, 140),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      '${productData['imageUrl']}',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xFFF6F6F6),
                      child: Image.network(
                        '${productData['imageUrl']}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              '${productData['description']}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                color: Color.fromARGB(255, 32, 32, 32),
                height: 1,
                letterSpacing: 0.50,
              ),
            ),
            const SizedBox(height: 20.0),
            Text('Reviews (${productData['reviews'].length})'),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: productData['reviews'].length,
                itemBuilder: (context, index) {
                  final review = productData['reviews'][index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('${review['imageUrl']}'),
                      radius: 20, // Adjust as needed
                    ),
                    title: Text(
                      '${review['comment']}',
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      'Rating: ${review['rate']}',
                      style: TextStyle(fontSize: 14),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              color: Color(0xFFF6F6F6),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ' Another Products',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'See All',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData['productDtoFilters'].length,
                        itemBuilder: (context, index) {
                          final filter =
                              productData['productDtoFilters'][index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductCard(
                              filter['imageUrl'],
                              filter['name'],
                              '',
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFAA933)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
