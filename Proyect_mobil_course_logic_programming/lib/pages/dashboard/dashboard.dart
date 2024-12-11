import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyect_mobil_course_logic_programming/model/product.dart';
import 'package:proyect_mobil_course_logic_programming/pages/dashboard/controller/Product_Controller.dart';

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyect_mobil_course_logic_programming/model/product.dart';
import 'package:proyect_mobil_course_logic_programming/pages/dashboard/controller/Product_Controller.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  final TextEditingController codeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text('Productos'),
            )),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              // Campo de búsqueda
              TextField(
                onChanged: productController.searchProduct,
                decoration: InputDecoration(
                  labelText: 'Buscar por código o nombre del producto',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),

              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(
                    width: 2,
                  ),
                  const Text("Tabla de Datos de Productos",
                      style: TextStyle(fontSize: 20)),
                ],
              ),

              Divider(
                height: 10,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: productController.fetchProducts,
                    child: Text('Actualizar lista'),
                  ),
                  ElevatedButton(
                    onPressed: productController.getPreOrderProducts,
                    child: Text('Preorden'),
                  ),
                  ElevatedButton(
                    onPressed: productController.getInOrderProducts,
                    child: Text('Inorden'),
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: codeController,
                      decoration: InputDecoration(
                        labelText: 'Código',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Insertar el producto
                  if (codeController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      priceController.text.isNotEmpty) {
                    Product newProduct = Product(
                      id: productController.products.length + 1, // ID auto generado
                      code: codeController.text,
                      name: nameController.text,
                      price: double.tryParse(priceController.text) ?? 0.0,
                    );

                    productController.registerProduct(newProduct);
                    productController.fetchProducts;
                    codeController.clear();
                    nameController.clear();
                    priceController.clear();
                  }
                },
                child: Text('Guardar Producto'),
              ),

              SizedBox(height: 20),

              Obx(() {

                if (productController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (productController.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(
                      productController.errorMessage.value,
                      style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  );
                }

                if (productController.products.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay productos disponibles',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }

                return Column(
                  children: [

                    Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Text(
                              'ID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Código',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Nombre',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Precio',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0), // Espaciado opcional
                    // Lista de productos
                    SizedBox(
                      height: 200, // Altura máxima para el área de scroll
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: productController.products.map((product) {

                            return GestureDetector(
                              onTap: () {
                                log(
                                  'Fila ${product.id} clickeada, producto: ${product.name}',
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey[300]!,
                                      width: 1.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product.id.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        product.code,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        product.name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        product.price.toStringAsFixed(2),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 30,
                      color: Colors.black,
                    ),
                  ],
                );
              }),
              Obx(
                 () {
                   return Container(
                     decoration: BoxDecoration(
                         border: Border.all(color: Colors.black)
                     ),
                     height: 50,
                     child: Row(
                       children: [
                         Container(
                           width: 20,
                         ),
                         Text("Celda contadas  : ${productController.products.length}"),
                       ],
                     ),
                   );
                 },
              ),

            ])));
  }
}
