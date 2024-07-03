import 'package:store_app/helper/api.dart';
import 'package:store_app/models/allproducts_model.dart';

class GetProductServices {
  Future<List<AllProductModel>> getAllProducts() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<AllProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(AllProductModel.fromjson(data[i]));
    }
    return productList;
  }
}
