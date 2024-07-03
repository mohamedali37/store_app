import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/allproducts_model.dart';
import 'package:store_app/services/get_product_services.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'Home View';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ),
            ),
          ],
          centerTitle: true,
          title: const Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 55, left: 10, right: 10, bottom: 20),
          child: FutureBuilder<List<AllProductModel>>(
              future: GetProductServices().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<AllProductModel> products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 12,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          products: products[index],
                        );
                      });
                } else if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),);
                }
                else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ));
  }
}
