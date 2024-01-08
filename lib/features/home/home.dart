import 'package:flutter/material.dart';
import 'package:resturant/model/resturant.dart';
import 'package:resturant/services/geolocation.dart';
import 'package:resturant/services/resturant_service.dart';
import "package:geocode/geocode.dart";
import 'package:resturant/widgets/filter.dart';

import 'package:resturant/widgets/resturant_card.dart';
import "package:geolocator/geolocator.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool flag = true;
  List<Datum>? _resturantlist;
  bool _isLoading = true;
  String? cityName;
  String? streetAdress;
  bool all = true;
  bool pizza = false;
  bool burger = false;
  bool chicken = false;
  bool dosa = false;
  bool tea = false;
  String filter = "";
  String data = "";
  final TextEditingController _searchController = TextEditingController();
  void initState() {
    stuff();
    debugPrint(_searchController.text + "HELLO FROM TEXT");
    super.initState();
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    setState(() {
      data = "";
      _searchController.dispose();
    });
    _searchController.dispose();

    super.dispose();
  }

  Future<void> stuff() async {
    Position position = await determinePosition();

    var address = await GeoCode().reverseGeocoding(
        latitude: position.latitude, longitude: position.longitude);
    setState(() {
      cityName = address.city;
      streetAdress = address.streetAddress;
    });

    var response = await BaseClient().post(
      '/get_resturants',
    );
    if (response == null) {
      flag = false;
      debugPrint("failed");
    }
    debugPrint("success");
    Resturant resturant = resturantFromJson(response);
    _resturantlist = resturant.data;

    debugPrint((resturant.data).length.toString());
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color.fromARGB(255, 255, 207, 207), Color(0xFFFFFFFF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("./assets/location.png"),
              const SizedBox(
                width: 10,
              ),
              Text('${streetAdress},${cityName}',
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
            ],
          ),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = !all;
                              pizza = false;
                              burger = false;
                              chicken = false;
                              dosa = false;
                              tea = false;
                              filter = "";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: all
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 60,
                            child: Center(
                              child: Text("All"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = false;
                              pizza = !pizza;
                              burger = false;
                              chicken = false;
                              dosa = false;
                              tea = false;
                              filter = "Pizza, Wings";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: pizza
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 90,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset("assets/pizza.png"),
                                  Text("Pizza")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = false;
                              pizza = false;
                              burger = false;
                              chicken = !chicken;
                              dosa = false;
                              tea = false;
                              filter = "Chicken, Naan";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: chicken
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 90,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset("assets/chicken.png"),
                                  Text("Chicken")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = false;
                              pizza = false;
                              burger = false;
                              chicken = false;
                              dosa = !dosa;
                              tea = false;
                              filter = "Dosa, Idli, Upma";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: dosa
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 90,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset("assets/dosa.png"),
                                  Text("Dosa")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = false;
                              pizza = false;
                              burger = !burger;
                              chicken = false;
                              dosa = false;
                              tea = false;
                              filter = "Burger, Fries, Wings";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: burger
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 90,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset("assets/burger.png"),
                                  Text("Burger")
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              all = false;
                              pizza = false;
                              burger = false;
                              chicken = false;
                              dosa = false;
                              tea = !tea;
                              filter = "Tea, Coffee, Snacks";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: tea
                                    ? Color.fromARGB(255, 255, 107, 107)
                                    : Colors.white),
                            height: 40,
                            width: 90,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset("assets/coffee.png"),
                                  Text("Coffee")
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        hintText: 'Search Food Items',
                        // Add a clear button to the search bar

                        // Add a search icon or button to the search bar
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search_sharp),
                          onPressed: () {
                            setState(() {
                              data = _searchController.text;
                            });

                            // Perform the search here
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Nearby Resturants",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          return flag
                              ? data == ""
                                  ? (filter == ""
                                      ? ResturantCard(
                                          resturant: _resturantlist![index])
                                      : ResturantCard(
                                          resturant: _resturantlist!
                                              .where((x) =>
                                                  x.tags.contains(filter))
                                              .toList()[index]))
                                  : ResturantCard(
                                      resturant: _resturantlist!
                                          .where((x) => x.name.contains(data))
                                          .toList()[index])
                              : Text("No restaurant nearby");
                        },
                        itemCount: data == ""
                            ? filter == ""
                                ? _resturantlist!.length
                                : _resturantlist!
                                    .where((x) => x.tags.contains(filter))
                                    .toList()
                                    .length
                            : _resturantlist!
                                .where((x) => x.name.contains(data))
                                .toList()
                                .length),
                  ),
                ],
              ),
      ),
    );
  }
}
