import 'package:flutter/material.dart';
import 'package:linked_all_pages/Cart/cart_screen.dart';
import 'package:linked_all_pages/shop/shop_product_model.dart';
import 'package:linked_all_pages/shop/shop_service.dart';
import 'search_screen.dart';
import '../productDetails/product_details_screen.dart';

class ProductCardShop extends StatelessWidget {
  const ProductCardShop({
    Key? key,
    required this.product,
    required this.token,
  }) : super(key: key);
  final String? token;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          print('Token: ${token}');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsWidget(
                      productId: product.id,
                      token: token,
                    )),
          );
        },
        child: Container(
          width: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${product.name.substring(0, 35)}..',
                  style: const TextStyle(
                    color: Color(0xFF393F42),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String? token;

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late Future<List<Product>> _products;

  @override
  void initState() {
    super.initState();
    _products = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5F8),
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Shop',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 0.08,
              letterSpacing: 0.20,
            ),
          ),
        ),
        backgroundColor: const Color(0xff414E56),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      // MaterialPageRoute(builder: (context) => const SearchScreen()),
                      MaterialPageRoute(
                          builder: (context) => ProductSearchPage(
                                token: widget.token,
                              )),
                    );
                  },
                  label: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  label: const Text(
                    'Filter',
                    style: TextStyle(color: Color(0xff414E56)),
                  ),
                  icon: const Icon(
                    Icons.format_align_left_sharp,
                    color: Color(0xff414E56),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                          token: widget.token as String,
                        )), // change to home
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          )
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: _products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];

                return ProductCardShop(product: product, token: widget.token);
              },
            );
          }
        },
      ),
    );
  }
}
