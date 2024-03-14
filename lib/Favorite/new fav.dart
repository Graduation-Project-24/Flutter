import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/screens/forget1.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<dynamic> favoritesData = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final token = await getToken(); // Fetch token from SharedPreferences

    print('Token: $token');

    if (token != null && token.isNotEmpty) {
      final url = 'https://www.smarketp.somee.com/api/Favorite/GetFavorites?token=$token';

      print('URL: $url');

      final response = await http.get(Uri.parse(url));

      print('Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        setState(() {
          favoritesData = json.decode(response.body);
        });
      } else {
        print('Failed to load favorites');
        throw Exception('Failed to load favorites');
      }
    } else {
      print('Token is empty or null');
      // Handle case when token is not available
    }
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print('Token from SharedPreferences: $token');
    return token ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => forget())); // change to home
          },
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xff384959),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Favorites",
          style: TextStyle(
            color: Color(0xff384959),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemCount: favoritesData.length,
          itemBuilder: (BuildContext context, int index) {
            final favorite = favoritesData[index];
            return Card(
              child: Row(
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
                        image: NetworkImage(favorite['imageUrl']),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 10),
                        width: 180,
                        child: Text(
                          favorite['description'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          favorite['price'],
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                    child: Stack(children: []),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffFFC120),
                                  ),
                                  Text(
                                    favorite['rating'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '${favorite['reviews']} Reviews',
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
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
