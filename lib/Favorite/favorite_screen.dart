import 'package:flutter/material.dart';
import '../productDetails/product_details_screen.dart';
import 'favorite_service.dart';
import 'favorite_model.dart';

class Favorites extends StatefulWidget {
  final String? token;

  const Favorites({Key? key, required this.token}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Favorite> favoritesData = []; // Change the type to Favorite
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (widget.token != null) {
      fetchFavorites();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchFavorites() async {
    setState(() {
      isLoading = true;
    });

    try {
      favoritesData = await FavoriteService.getFavorites(widget.token!);
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Error fetching favorites: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
            color: Color(0xff384959),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Color(0xff384959),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : favoritesData.isEmpty
              ? const Center(child: Text('No favorites found'))
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: favoritesData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final favorite = favoritesData[index];
                      // Inside the ListView.builder's itemBuilder method
                      return GestureDetector(
                        onTap: () {
                          // Navigate to product details page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsWidget(
                                productId:
                                    favorite.productId, // Update this line
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(favorite.imageUrl),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 10),
                                        width: 180,
                                        child: Text(
                                          favorite.description.length > 20
                                              ? '${favorite.description.substring(0, 20)}...'
                                              : favorite.description,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: const Text(
                                          // favorite.price, // There's no price field in the model
                                          '100 L.E', // Placeholder for price
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child:
                                                      const Stack(children: []),
                                                ),
                                                const SizedBox(width: 3),
                                                const Icon(
                                                  Icons.star,
                                                  color: Color(0xffFFC120),
                                                ),
                                                const Text(
                                                  // favorite.reviews.rate.toString(), // Update this line
                                                  '4.5', // Placeholder for rate
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              '1 Reviews', // Placeholder for reviews
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(), // Add Spacer to push the heart icon to the right
                                ],
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    removeFromFavorites(
                                        favorite.productId); // Update this line
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }

  Future<void> removeFromFavorites(int productId) async {
    try {
      await FavoriteService.removeFromFavorites(productId, widget.token!);
      await fetchFavorites();
    } catch (error) {
      print('Error removing from favorites: $error');
    }
  }
}