import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/screens/restaurant_screen.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';
import 'package:food_delivery_app/widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RestaurantScreen(restaurant: restaurant))),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: 1.0, color: Colors.grey.shade200)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    image: AssetImage(restaurant.imageUrl),
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStars(rating: restaurant.rating),
                      const SizedBox(height: 4),
                      Text(
                        restaurant.address,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        " 0.2 miles away",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: const Text("Food Delivery"),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: 'Search Food or Restaurants',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
              ),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              _buildRestaurants(),
            ],
          )
        ],
      ),
    );
  }
}
