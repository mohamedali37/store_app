import 'package:store_app/helper/api.dart';
import 'package:store_app/models/allproducts_model.dart';

class GetCategoiesServices {
  Future<List<AllProductModel>> getCateories(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        // ignore: missing_required_param
        .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

    List<AllProductModel> categoryList = [];
    for (int i = 0; i < data.length; i++) {
      categoryList.add(AllProductModel.fromjson(data[i]));
    }
    return categoryList;
  }
}
