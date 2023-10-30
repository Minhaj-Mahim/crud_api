import 'package:crud_api/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        showDialog(context: context, builder: (context){
          return productAlertDialog(context);
        });
      },
      leading: Image.network(
        'https://images.pexels.com/photos/841228/pexels-photo-841228.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        width: 80,),
      title: const Text('Product Name'),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Product Code'),
              SizedBox(width: 24,),
              Text('Total Price'),
            ],
          ),
          Text('Product Description'),
        ],
      ),
      trailing: Text('\$120.00'),
    );
  }

  AlertDialog productAlertDialog(BuildContext context) {
    return AlertDialog(
          title: Text('Select Action'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Edit'),
                leading: Icon(Icons.edit),
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddNewProductScreen()
                    ),
                  );
                },
              ),
              const Divider(height: 0,),
              ListTile(
                title: const Text('Delete'),
                leading: const Icon(Icons.delete),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
  }
}
