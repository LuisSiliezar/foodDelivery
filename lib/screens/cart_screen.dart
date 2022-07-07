import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/data.dart';
import 'package:food_delivery_app/models/order.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 170.0,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(order.food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
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
                          order.food.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          order.restaurant.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          width: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black54,
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  '-',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Text(order.quantity.toString()),
                              const SizedBox(width: 20),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              '\$${order.quantity * order.food.price} ',
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Cart (${currentUser.cart.length})",
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            const Divider(height: 1.0, color: Colors.grey),
        itemCount: currentUser.cart.length,
        itemBuilder: (context, index) {
          Order order = currentUser.cart[index];
          return _buildCartItem(order);
        },
      ),
    );
  }
}
