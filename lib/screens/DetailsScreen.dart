import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/articles_provider.dart';

class Detailsscreen extends StatelessWidget {
   int index ;
   Detailsscreen({required this.index,super.key});

  @override
  Widget build(BuildContext context) {
     var obj = Provider.of<ArticlesProvider>( context , listen: false).model?.articles;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network('${obj?[index]['urlImage']}'),
         const  SizedBox(height: 10,),
          Center(child: Text('${obj?[index]['title']}', style:  TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            // Optional
          ),textAlign:  TextAlign.center,)),
          Center(child: Text('${obj?[index]['description']}', style:  TextStyle(

            fontSize: 10, // Optional
          ),)),



        ],
      ),
    );
  }
}
