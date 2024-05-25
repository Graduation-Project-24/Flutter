import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/Categories/category_screen.dart';
import 'package:linked_all_pages/Widgets/product_card.dart';
import 'package:linked_all_pages/productDetails/product_details_screen.dart';
import '../Chatbot/chatbot.dart';
import '../Home/home_model.dart';
import '../profile_screen/profile_screen.dart';
import '../shop/search_screen.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeWidget extends StatefulWidget {
  final String token;

  const HomeWidget({super.key, required this.token});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late Future<void> _fetchDataFuture;
  List<Category> categories = [];
  List<Product> products = [];
  String? userImageUrl;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData();
    decodeToken();
  }

  void decodeToken() {
    try {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(widget.token);
      setState(() {
        userImageUrl = decodedToken['imageUrl'] ?? 'assets/ProfileImage.png';
      });
    } catch (e) {
      setState(() {
        userImageUrl = 'assets/ProfileImage.png';
      });
    }
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('https://www.smarketp.somee.com/api/Home/MobileHome'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        categories = (data['categories'] as List)
            .map((json) => Category.fromJson(json))
            .toList();
        products = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Smarket',
            style: TextStyle(
              color: Color(0xFF263238),
              fontSize: 28,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              height: 0.02,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductSearchPage(
                              token: widget.token,
                            )));
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: const Color(0xFFD5E2EA),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0x60263238)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              height: 35,
              alignment: Alignment.center,
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Color(0x60263238),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      ' Search for product',
                      style: TextStyle(
                        color: Color(0x60263238),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                        letterSpacing: 0.20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            profile_screen(token: widget.token)));
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                userImageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/ProfileImage.png');
                },
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: _fetchDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(), // Loader widget
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'), // Error message
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset("assets/banner.png"),
                          Image.asset("assets/banner2.png"),
                          Image.asset("assets/banner3.png")
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Categories',
                      style: TextStyle(
                        color: Color(0xFF393F42),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...categories.map((category) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xCCD5E2EA),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Image.network(category.imageUrl),
                                  ),
                                  Text(
                                    category.name.length > 6
                                        ? '${category.name.substring(0, 6)}...'
                                        : category.name,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryScreen(token: widget.token),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xCCD5E2EA),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Image.network(
                                      'https://res.cloudinary.com/dghjthnqs/image/upload/v1716635251/dwxttedx4eojbspecbzh.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Text('All'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Recent Product',
                      style: TextStyle(
                        color: Color(0xFF393F42),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailsWidget(
                                  token: widget.token,
                                  productId: product.id,
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            product.imageUrl,
                            product.name,
                            product.price.toString(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatbotPage()),
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}
