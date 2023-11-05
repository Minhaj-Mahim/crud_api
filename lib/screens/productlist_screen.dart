import 'dart:convert';

import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:crud_api/screens/product.dart';
import 'package:crud_api/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

/// ExpansionTile(
//   leading: Image.network(
//     'https://images.pexels.com/photos/18186105/pexels-photo-18186105/free-photo-of-basic-black-and-white-t-shirts.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load',
//     width: 80,),
//   title: Text('Product Name'),
//   subtitle: Text('Product Description'),
//   ///trailing: Text('\$120.00'),
//   children: [
//     Text('BUY IT or LEAVE IT!'),
//   ],
// ),

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool inProgress = false;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async{
    productList.clear();
    inProgress = true;
    setState(() {});

    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product.fromJson(productJson));
        }
      }
    }
    inProgress = false;
    setState(() {});
  }

  void deleteProduct(String productId) async {
    inProgress = true;
    setState(() {});

    Response response = await get(
      Uri.parse('https://crud.teamrabbil.com/api/v1/DeleteProduct/$productId'),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      getProductList();
    } else {
      inProgress = false;
      print(productList.length);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddNewProductScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          getProductList();
        },
        child: inProgress
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                    onPressDelete: (String productId) {
                      deleteProduct(productId);
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ),
      ),
    );
  }
}
