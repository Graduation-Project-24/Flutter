import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:linked_all_pages/productDetails/product_service.dart';
import '../Cart/cart_screen.dart';
import 'add_review_screen.dart';
import 'product_model.dart';

class ProductDetailsWidget extends StatefulWidget {
  final int? productId;
  final String? token;
  const ProductDetailsWidget({Key? key, this.productId, required this.token})
      : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late Future<Map<String, dynamic>> _productDetails;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _fetchProductDetails();
    checkFavoriteStatus();
  }

  void _fetchProductDetails() {
    _productDetails = fetchProductDetails(widget.productId as int);
  }

  // Method to check favorite status for the current product
  void checkFavoriteStatus() async {
    if (widget.token != null) {
      try {
        // Make API call to check if the product is in favorites
        final bool isFav = await ProductService.checkFavorite(
            widget.productId as int, widget.token!);
        setState(() {
          isFavorite = isFav;
        });
      } catch (e) {
        // Handle error
        print('Error checking favorite status: $e');
      }
    }
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                          token: widget.token as String,
                        )),
              );
            },
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
                const Text(
                  'Overview',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFAA933),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // Toggle favorite status
                    });
                    if (isFavorite) {
                      print(widget.token);
                      _addToFavorites(productData['id']);
                    } else {
                      _removeFromFavorites(productData['id']);
                    }
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RatingBarIndicator(
                          rating: review['rate'].toDouble(),
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddReviewPage(
                      productId: widget.productId as int,
                      token: widget.token!,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.rate_review, color: Colors.white),
              label: Text(
                'Add Review',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFFFAA933),
                shadowColor: Color.fromARGB(255, 253, 176, 61),
                elevation: 10,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 900,
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
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 280,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData['productDtoFilters'].length,
                        itemBuilder: (context, index) {
                          final filter =
                              productData['productDtoFilters'][index];
                          return GestureDetector(
                            onTap: () {
                              // Navigate to product details screen, you can use Navigator.push
                              // Here, you would typically pass the product details or ID to the details screen
                              // For example:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsWidget(
                                          productId: filter['productId'],
                                          token: widget.token,
                                        )),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ProductCard(
                                filter['imageUrl'],
                                filter['name'].length > 20
                                    ? '${filter['name'].substring(0, 20)}...'
                                    : filter['name'],
                                '',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFFAA933)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
          onPressed: () {
            // Call the addToCart method with the productId and token
            ProductService.addToCart(
                    widget.productId as int, widget.token as String, 1)
                .catchError((error) {
              // Handle error
              print(error);
              // You can also display an error message here
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Add To Cart',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _addToFavorites(int productId) async {
    print(widget.token);
    if (widget.token != null) {
      // Make API call to add product to favorites
      try {
        await ProductService.addToFavorites(productId, widget.token!);
        // Handle success
      } catch (e) {
        // Handle error
        print('Error adding to favorites: $e');
      }
    } else {
      print('Token is null');
    }
  }

  void _removeFromFavorites(int productId) async {
    if (widget.token != null) {
      // Make API call to remove product from favorites
      try {
        await ProductService.removeFromFavorites(productId, widget.token!);
        // Handle success
      } catch (e) {
        // Handle error
        print('Error removing from favorites: $e');
      }
    } else {
      print('Token is null');
    }
  }
}
