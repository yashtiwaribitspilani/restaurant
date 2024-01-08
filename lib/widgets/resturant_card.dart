import 'package:flutter/material.dart';
import 'package:resturant/model/resturant.dart';

class ResturantCard extends StatelessWidget {
  ResturantCard({super.key, required this.resturant});
  Datum resturant;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 12,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(resturant.primaryImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    bottom: 13,
                    child: Container(
                      width: 40,
                      height: 25,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: const Color(0xff1BC400),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${resturant.rating}★",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(resturant.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black)),
                      Row(
                        children: [
                          Image.asset("./assets/discount.png"),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${resturant.discount}%FLAT OFF",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
