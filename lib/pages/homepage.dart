import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'dart:convert';


import '../widgets/item_widget.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData () async{
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString('assets/files/catalog.json');
    var decodeData = jsonDecode(catalogJson);
    var productData = decodeData["products"];
    CatlogModel.items = List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catlog App",style: TextStyle(color: Colors.black)),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10),
            itemBuilder: (context,index){
              final item = CatlogModel.items[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: GridTile(
                    header: Container(
                      color: Colors.deepPurple,
                        padding: const EdgeInsets.all(12.0),
                        child: Text(item.name,style: const TextStyle(color: Colors.white)
                        )
                    ),
                    footer: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(12.0),
                        child: Text(item.price.toString(),style: const TextStyle(color: Colors.white)
                        )
                    ),
                      child: Image.network(item.image),
                  )
              );
            },
          itemCount: CatlogModel.items.length,
        )

      ),
      drawer: MyDrawer(),
    );
  }
}

