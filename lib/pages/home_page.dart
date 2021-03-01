import 'package:first_app/models/catalog.dart';
import 'package:first_app/utils/routes.dart';
import 'package:first_app/widgets/drawer.dart';
import 'package:first_app/widgets/home_widgets/catalog_header.dart';
import 'package:first_app/widgets/home_widgets/catalog_list.dart';
import 'package:first_app/widgets/item_widget.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // print(productData);
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: MyTheme.creamcolor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.darkbluecolor,
          child: Icon(CupertinoIcons.cart),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        )
        // appBar: AppBar(
        //   title: Text("Catalog App"),
        //   // backgroundColor: Colors.redAccent,
        // ),
        // body: Padding(
        //     padding: const EdgeInsets.all(16.0),
        //     child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        //         // ? ListView.builder(
        //         //     itemCount: CatalogModel.items.length,
        //         //     itemBuilder: (context, index) {
        //         //       return ItemWidget(
        //         //         item: CatalogModel.items[index],
        //         //       );
        //         //     },
        //         //   )
        //         ? GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 2,
        //                 crossAxisSpacing: 10.0, //horizpntai space
        //                 mainAxisSpacing: 16.0),
        //             itemBuilder: (context, index) {
        //               final item = CatalogModel.items[index];
        //               return Card(
        //                   clipBehavior: Clip.antiAlias,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(10)),
        //                   child: GridTile(
        //                     header: Container(
        //                       padding: EdgeInsets.all(12),
        //                       child: Center(
        //                           child: Text(
        //                         item.name,
        //                         style: TextStyle(color: Colors.white),
        //                       )),
        //                       decoration: BoxDecoration(color: Colors.deepPurple),
        //                     ),
        //                     child: Image.network(item.image),
        //                     footer: Container(
        //                         padding: EdgeInsets.all(12),
        //                         decoration: BoxDecoration(color: Colors.black),
        //                         child: Center(
        //                             child: Text(
        //                           item.price.toString(),
        //                           style: TextStyle(color: Colors.white),
        //                         ))),
        //                   ));
        //             },
        //             itemCount: CatalogModel.items.length,
        //           )
        //         : Center(
        //             child: CircularProgressIndicator(),
        //           )),
        // drawer: MyDrawer(),
        );
  }
}
