import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkbluecolor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      onPressed: () {},
                      child: "Add to cart".text.make())
                  .wh(120, 50)
            ],
          ).p16(),
        ),
        backgroundColor: MyTheme.creamcolor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image),
              ).h32(context),
              Expanded(
                  child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(MyTheme.darkbluecolor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Magna lorem et aliquyam et takimata labore. Kasd et voluptua sadipscing erat diam at, dolore accusam rebum justo vero, tempor sanctus eos magna ipsum no clita et, invidunt ipsum justo dolore diam, gubergren ipsum eirmod sed lorem stet amet sit accusam. Rebum amet ipsum invidunt ipsum diam diam at lorem."
                          .text
                          .bold
                          .textStyle(context.captionStyle)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ))
            ],
          ),
        ));
  }
}
