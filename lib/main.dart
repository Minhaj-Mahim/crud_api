import 'package:crud_api/screens/productlist_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const CrudApp_API());
}
class CrudApp_API extends StatelessWidget {
  const CrudApp_API({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}
