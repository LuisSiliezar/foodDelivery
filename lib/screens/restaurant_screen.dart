import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/rating_stars.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantScreen({required this.restaurant});
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
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
        ],
      ),
    );
  }
}
