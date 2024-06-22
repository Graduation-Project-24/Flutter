import 'package:flutter/material.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import '../Checkout/checkout.dart';
import 'cart_model.dart';
import 'cart_service.dart';

class CartScreen extends StatefulWidget {
  final String token;

  const CartScreen({Key? key, required this.token}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartService _cartService;
  List<CartItem> _cartItems = [];
  double totalPrice = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _cartService = CartService();
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    try {
      final cartItems = await _cartService.getCartItems(widget.token);
      setState(() {
        _cartItems = cartItems;
        totalPrice = getTotalPrice(_cartItems);
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching cart items: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = getTotalPrice(_cartItems);
    });
  }

  void _incrementQuantity(CartItem cartItem) {
    setState(() {
      cartItem.count++;
      _updateTotalPrice();
    });
  }

  void _decrementQuantity(CartItem cartItem) {
    setState(() {
      if (cartItem.count > 1) {
        cartItem.count--;
        _updateTotalPrice();
      }
    });
  }

  Future<void> _removeFromCart(int packageId) async {
    try {
      await _cartService.removeFromCart(widget.token, packageId);
      _fetchCartItems();
    } catch (e) {
      print('Error removing item from cart: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5F8),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        token: widget.token as String,
                      )),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: const Color(0xff384959),
        ),
        centerTitle: true,
        title: const Text(
          "Shopping chart",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = _cartItems[index];

                return ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xCCD5E2EA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(cartItem.productImageUrl),
                  ),
                  title: Text(
                    cartItem.productName.length > 20
                        ? '${cartItem.productName.substring(0, 20)}...'
                        : cartItem.productName,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ${cartItem.price.toStringAsFixed(2)} EGP',
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _decrementQuantity(cartItem);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors
                                    .black, // Customize icon color if needed
                              ),
                            ),
                          ),
                          Text(
                            '  ${cartItem.count}  ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              _incrementQuantity(cartItem);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 30,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () {
                      _removeFromCart(cartItem.packageId);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffFAA933),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CheckoutPage(
                      token: widget.token,
                    )), // to checkout
          );
        },
        label: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Proceed to Checkout',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Total Price: ${totalPrice.toStringAsFixed(2)} EGP',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        icon: const Icon(Icons.chevron_right, color: Colors.white),
      ),
    );
  }

  double getTotalPrice(List<CartItem> cartItems) {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.price * cartItem.count;
    }
    return totalPrice;
  }
}
