import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/allproducts_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/button.dart';
import 'package:store_app/widgets/custom_textformfield.dart';

// ignore: must_be_immutable
class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key});
  static String id = 'update product';

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? name, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AllProductModel products =
        ModalRoute.of(context)!.settings.arguments as AllProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Update Product',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                CustomTextField(
                  hint: 'Product Name',
                  data: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'description',
                  data: (value) {
                    desc = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  type: TextInputType.number,
                  hint: 'Price',
                  data: (value) {
                    price = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hint: 'image',
                  data: (value) {
                    image = value;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                SignButton(
                  text: 'Update',
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateproduct(products);
                    } catch (e) {
                      throw Exception(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future <void> updateproduct(AllProductModel products) async{
    await UpdateProductService().updateProduct(
        id: products.id,
        title: name == null ? products.title : name!,
        price: price == null ? products.price.toString() : price!,
        description: desc == null ? products.description : desc!,
        image: image == null ? products.image : image!,
        category: products.category);
  }
}
