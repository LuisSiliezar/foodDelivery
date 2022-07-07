import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<Center> gridFood = [];

  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(menuItem.imageUrl),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 175.0,
            width: 175.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: const [
                    0.1,
                    0.5,
                    0.7,
                    0.9
                  ]),
            ),
          ),
          Positioned(
            bottom: 65.0,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  '\$' + menuItem.price.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: Container(
              width: 48.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                icon: const Icon(Icons.add),
                // iconSize: 25.0,
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 220.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite,
                          color: Colors.deepOrangeAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.restaurant.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                      ),
                    ),
                    const Text(
                      '0.2 Miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                RatingStars(rating: widget.restaurant.rating),
                const SizedBox(height: 6.0),
                Text(
                  widget.restaurant.address,
                  style: const TextStyle(fontSize: 18.0),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  primary: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                ),
                child: const Text(
                  "Reviews",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  primary: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                ),
                child: const Text(
                  "Contact",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Text("DaSDAS"),
              // ),
            ],
          ),
          const SizedBox(height: 10.0),
          const Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
                padding: const EdgeInsets.all(10.0),
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: List.generate(widget.restaurant.menu.length, (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                })),
          )
        ],
      ),
    );
  }
}
