import 'package:store_app/helper/api.dart';
import 'package:store_app/models/allproducts_model.dart';

class UpdateProductService {
  Future<AllProductModel> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category,
      required int id,
      }) async {
    Map<String, dynamic> data =
        // ignore: missing_required_param
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return AllProductModel.fromjson(data);
  }
}
