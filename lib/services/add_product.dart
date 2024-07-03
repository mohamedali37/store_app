import 'package:store_app/helper/api.dart';
import 'package:store_app/models/allproducts_model.dart';

class AddProduct {
  Future<AllProductModel> addProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().post(url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return AllProductModel.fromjson(data);
  }
}
