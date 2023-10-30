import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:crud_api/widgets/product_item.dart';
import 'package:flutter/material.dart';

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

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AddNewProductScreen()
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 15,
          itemBuilder: (context,index){
          return const ProductItem();
          },
          separatorBuilder: (_,__) => const Divider(),
      ),
    );
  }
}