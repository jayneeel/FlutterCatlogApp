import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catlog.dart';
import 'package:flutter_catlog/widgets/drawer.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.cremeColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if(CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                CatalogList().expand(                )
              else
                Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      )
    );
  }
}



class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}


class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,index){
      final catalog = CatlogModel.items[index];
      return CatalogItem(catalog: catalog);
    },
    itemCount: CatlogModel.items.length,
    shrinkWrap: true,);
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog}): assert(catalog!=null);


  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(catalogImage: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.xl.make(),
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),

                    child: "Buy".text.make(),)
                ],
              ).pOnly(right: 8.0)
              
            ],
          ))
        ],
      )
    ).white.rounded.square(150).white.make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String catalogImage;

  const CatalogImage({super.key, required this.catalogImage}): assert(catalogImage != null);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalogImage).box.rounded.p8.color(MyTheme.cremeColor).make().p16().w32(context);
  }
}




