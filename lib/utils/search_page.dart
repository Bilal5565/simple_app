import 'package:flutter/material.dart';
import 'package:tony_shop/constant/const.dart';

class FoodItem {
  final String name;
  final double price;

  FoodItem(this.name, this.price);
}

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _cart_tabState();
}

class _cart_tabState extends State<SearchPage> {
  List<FoodItem> allFoodItems = [
    FoodItem('Burger', 5.99),
    FoodItem('Pizza', 8.99),
    FoodItem('Salad', 4.99),
    // Add more food items
  ];

  List<FoodItem> filteredFoodItems = [];

  @override
  void initState() {
    super.initState();
    filteredFoodItems = allFoodItems;
  }

  void _searchFood(String query) {
    setState(() {
      filteredFoodItems = allFoodItems.where((food) {
        return food.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
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
        title: Text('Season Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              onChanged: _searchFood,
              decoration: InputDecoration(
                 

                  labelText: 'Search Season',
                  prefixIcon: Icon(Icons.search),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstantObject.primaryColor,
                      width: 2,
                    ),
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFoodItems.length,
              itemBuilder: (context, index) {
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
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: ConstantObject.primaryColor,
                          // backgroundImage: AssetImage(
                          //   foodItem
                          //       .imageUrl, // Use the relative path from the pubspec.yaml file
                          // ),
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
                                filteredFoodItems[index].name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                  '\$${filteredFoodItems[index].price.toStringAsFixed(2)}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );

                //  ListTile(
                //   title: Text(filteredFoodItems[index].name),
                //   subtitle: Text(
                //       '\$${filteredFoodItems[index].price.toStringAsFixed(2)}'),
                //   // You can add an "Add to Cart" button or other actions here
                // );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * 0.04),
        child: FloatingActionButton(
          backgroundColor: ConstantObject.primaryColor,
          onPressed: () {
            // Navigate to the total menu list screen or handle cart functionality
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
