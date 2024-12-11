import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:proyect_mobil_course_logic_programming/model/product.dart';
import 'package:proyect_mobil_course_logic_programming/pages/dashboard/TreeNode.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final _index = 0.obs;
  final _product = Product.createEmpty().obs;

  late ProductSearchTree searchTree;

  @override
  void onInit() {
    super.onInit();
    searchTree = ProductSearchTree();
  }

  int get index => _index.value;
  set index(int value) => _index.value = value;

  Product get product => _product.value;
  set product(Product value) => _product.value = value;

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      const url = 'http://10.248.246.216:9091/boss/product/list';
      final response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final productList = data['bossProducts'] as List?;

        if (productList != null && productList.isNotEmpty) {
          final fetchedProducts =
          productList.map((item) => Product.fromJson(item)).toList();
          products.value = fetchedProducts;

          searchTree = ProductSearchTree();
          for (var product in fetchedProducts) {
            searchTree.insert(product);
          }
        } else {
          products.clear();
          errorMessage.value = data['message'] ?? 'No se encontraron productos';
        }
      } else {
        errorMessage.value = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      log("Error al obtener productos: $e");
      errorMessage.value = 'Error de conexión';
    } finally {
      isLoading.value = false;
    }
  }
  void searchProduct(String query) {
    if (query.isEmpty) {
      fetchProducts();
    } else {
      products.value = searchTree.search(query);
    }
  }
  void getPreOrderProducts() {
    products.value = searchTree.preOrder();
  }
  void getInOrderProducts() {
    products.value = searchTree.inOrder();
  }

  Future<void> registerProduct(Product product) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      const url = 'http://192.168.1.2:9091/boss/product/register';

      final productData = {
        "name": product.name,
        "code": product.code,
        "price": product.price,
      };

      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(productData),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['success'] == true) {

          // fetchProducts();
        } else {
          errorMessage.value = data['message'] ?? 'No se pudo registrar el producto';
        }
      } else {
        errorMessage.value = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      log("Error al registrar producto: $e");
      errorMessage.value = 'Error de conexión';
    } finally {
      isLoading.value = false;
    }
  }
}
