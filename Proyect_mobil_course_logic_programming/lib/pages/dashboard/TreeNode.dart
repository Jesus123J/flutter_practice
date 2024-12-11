import 'package:proyect_mobil_course_logic_programming/model/product.dart';

class TreeNode {
  Product product;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.product);
}

class ProductSearchTree {
  TreeNode? root;

  void insert(Product product) {
    root = _insertRec(root, product);
  }

  TreeNode _insertRec(TreeNode? node, Product product) {
    if (node == null) {
      return TreeNode(product);
    }

    if (product.name.toLowerCase().compareTo(node.product.name.toLowerCase()) < 0 ||
        product.code.toLowerCase().compareTo(node.product.code.toLowerCase()) < 0) {
      node.left = _insertRec(node.left, product);
    } else {
      node.right = _insertRec(node.right, product);
    }

    return node;
  }

  List<Product> search(String query) {
    final results = <Product>[];
    _searchRec(root, query.toLowerCase(), results);
    return results;
  }

  void _searchRec(TreeNode? node, String query, List<Product> results) {
    if (node == null) return;

    if (node.product.name.toLowerCase().contains(query) ||
        node.product.code.toLowerCase().contains(query)) {
      results.add(node.product);
    }

    _searchRec(node.left, query, results);
    _searchRec(node.right, query, results);
  }

  List<Product> preOrder() {
    final results = <Product>[];
    _preOrderRec(root, results);
    return results;
  }

  void _preOrderRec(TreeNode? node, List<Product> results) {
    if (node == null) return;

    results.add(node.product);
    _preOrderRec(node.left, results);
    _preOrderRec(node.right, results);
  }
  List<Product> inOrder() {
    final results = <Product>[];
    _inOrderRec(root, results);
    return results;
  }

  void _inOrderRec(TreeNode? node, List<Product> results) {
    if (node == null) return;
    _inOrderRec(node.left, results);
    results.add(node.product);
    _inOrderRec(node.right, results);
  }
}
