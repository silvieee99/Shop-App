import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/product_card.dart';

//Convert the stateless to stateful widget so you can fix colour of button when it's active
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilters;
  @override
  void initState() {
    selectedFilters = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    //return scaffold so that an empty screen appears
    return Scaffold(
      //Wrap text with center widget to center it
      //Wrap column with safe area widget so that the app content appears in a safe area, below the top battery sign
      //and above the bottom nav line.
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  //Wrap text in padding widget so that the textfield in the same row can take up the remaining space available
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    //  \n breaks text and sends it to the new line
                    'Shoes\nCollection',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                //Wrap textField with a expanded widget, this tells it to take up as much width as possible, if not, it will take up the entire row
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            //wrap listviewbuilder in a sizedbox if not it will take up  the entire screen
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  //Wrap chip with padding to give padding to the list
                  return Padding(
                    //EdgeInsets.only(left: 8.0, right: 8.0) this padding is same as the one below
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //wrap chip with gesturedetector widget because chip doesnt have ontapped/onpressed property
                    child: GestureDetector(
                      onTap: () {
                        //wrap selectedFilters with setState so that the buildfucntion rebuilds
                        // you can right click and refactor to do this
                        setState(() {
                          selectedFilters = filter;
                        });
                      },
                      child: Chip(
                        label: Text(filter),
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        //set primary colour in theme data and call it here
                        //theme.of(context) is used whenever you want to got up the widget tree to call something, for instance, calling the colour from the main.dart themedata
                        backgroundColor: selectedFilters == filter
                            ? Theme.of(context).colorScheme.primary
                            : Color.fromRGBO(245, 247, 249, 1),
                        labelStyle: TextStyle(fontSize: 16),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //Wrap listviewbuilder with expanded so that it will take up the height of the remaining screen
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    //if the number count of product is an even number, let background colour be this, or the show this when index is not even
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(216, 240, 253, 1)
                        : const Color.fromRGBO(245, 247, 249, 1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
