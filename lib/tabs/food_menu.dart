import 'package:flutter/material.dart';
import 'package:tony_shop/booking/delivery_page.dart';
import 'package:tony_shop/constant/const.dart';

class food_menu extends StatefulWidget {
  @override
  _food_menuState createState() => _food_menuState();
}

class _food_menuState extends State<food_menu> {
  List<FoodItem> foodItems = List.generate(
    20,
    (index) => FoodItem(
      name: 'Food Item $index',
      price: 10.0,
      imageUrl: './images/tony.jpg',
    ),
  );

  List<CartItem> cartItems = [];

  void addToCart(FoodItem foodItem) {
    final existingCartItem = cartItems.firstWhere(
      (cartItem) => cartItem.name == foodItem.name,
      orElse: () => CartItem(name: foodItem.name, price: foodItem.price),
    );

    if (cartItems.contains(existingCartItem)) {
      setState(() {
        existingCartItem.quantity++;
      });
    } else {
      setState(() {
        cartItems.add(CartItem(
          name: foodItem.name,
          price: foodItem.price,
          quantity: 1,
        ));
      });
    }
  }

  void removeFromCart(CartItem cartItem) {
    setState(() {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      } else {
        cartItems.remove(cartItem);
      }
    });
  }

  double calculateTotalPrice() {
    return cartItems.fold(
        0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ConstantObject.primaryColor,
        title: Text('Food Menu'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final foodItem = foodItems[index];
          return Container(
            margin: EdgeInsets.only(
              top: height * 0.02,
              right: width * 0.03,
              left: width * 0.03,
            ),
            padding: EdgeInsets.symmetric(
              vertical: height * 0.02,
              horizontal: width * 0.01,
            ),
            height: height * 0.13,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                height * 0.02,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 3,spreadRadius: 2,offset: Offset(0, 2),
                )
              ],
            ),
            child: Center(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: ConstantObject.primaryColor,
                    backgroundImage: AssetImage(
                      foodItem
                          .imageUrl, // Use the relative path from the pubspec.yaml file
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodItem.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('\$${foodItem.price.toStringAsFixed(2)}'),
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () => removeFromCart(cartItems.firstWhere(
                          (cartItem) => cartItem.name == foodItem.name,
                          orElse: () => CartItem(name: foodItem.name, price: 0),
                        )),
                      ),
                      Text(
                        cartItems
                            .firstWhere(
                              (cartItem) => cartItem.name == foodItem.name,
                              orElse: () =>
                                  CartItem(name: foodItem.name, price: 0),
                            )
                            .quantity
                            .toString(),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => addToCart(foodItem),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

          //  ListTile(
          //   title: Text(foodItem.name),
          //   subtitle: Text('\$${foodItem.price.toStringAsFixed(2)}'),
          //   leading: CircleAvatar(
          //     backgroundColor: ConstantObject.primaryColor,
          //     backgroundImage: AssetImage(
          //       foodItem
          //           .imageUrl, // Use the relative path from the pubspec.yaml file
          //     ),
          //     radius: 25,
          //   ),
          //   trailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.remove),
          //         onPressed: () => removeFromCart(cartItems.firstWhere(
          //           (cartItem) => cartItem.name == foodItem.name,
          //           orElse: () => CartItem(name: foodItem.name, price: 0),
          //         )),
          //       ),
          //       Text(
          //         cartItems
          //             .firstWhere(
          //               (cartItem) => cartItem.name == foodItem.name,
          //               orElse: () => CartItem(name: foodItem.name, price: 0),
          //             )
          //             .quantity
          //             .toString(),
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.add),
          //         onPressed: () => addToCart(foodItem),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.04),
        child: FloatingActionButton.extended(
          backgroundColor: ConstantObject.primaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Cart'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cartItems.map((cartItem) {
                      return Text(
                        '${cartItem.name} x ${cartItem.quantity}',
                        style: TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DeliveryPage()),
                          );
                        },
                        icon: Icon(
                          Icons.delivery_dining,
                          size: 28,
                          color: ConstantObject.primaryColor,
                        )),
                    Text(
                      'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.exit_to_app,
                          size: 28,
                          color: Colors.red,
                        )),

                    // TextButton(

                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: Text('Close'),
                    // ),
                    // TextButton(onPressed: (){}, child: Text('Delivery'))
                  ],
                );
              },
            );
          },
          label: Text('Add to Cart'),
          icon: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final double price;
  final imageUrl;

  FoodItem({required this.name, required this.price, required this.imageUrl});
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, this.quantity = 1});
}
