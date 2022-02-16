import 'package:get/state_manager.dart';
import 'package:shopping_app/services/remote_services.dart';

import '../model/product.dart';

class ProductController extends GetxController{
  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if(products != null){
        productList.value = products;
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
  }
}