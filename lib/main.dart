import 'package:flutter/material.dart';

void main() => runApp(const MyApp());
class Product { final String name; final String description;
final int price; final String image;
Product(this.name, this.description, this.price, this.image);
static List<Product> getProducts() { List<Product> items = <Product>[];
items.add(Product( "Pixel", "Pixel is the most featureful phone ever",
    800, "pixel.jpg")); items.add(Product("Laptop",
    "Laptop is most productive development tool", 2000, "laptop.png"));
items.add(Product( "Tablet", "Tablet is the most "
    "useful device ever for meeting", 1500, "tablet.jpg"));
items.add(Product( "Pendrive", "Pendrive is useful storage medium", 100,
    "pendrive.jpg")); items.add(Product( "Floppy Drive",
    "Floppy drive is useful rescue storage medium", 20, "floppy.jpg"));
items.add(Product( "iPhone",
    "iPhone is the stylist phone ever", 1000, "iphone.png")); return items; }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp( title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Product.getProducts();
  @override

  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(title: const Text("Product Navigation")),
        body: ListView.builder( itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector( child: ProductBox(item: items[index]),
              onTap: () { Navigator.push( context, MaterialPageRoute(
                builder: (context) => ProductPage(item: items[index]), ), );
              }, ); },
        ));
  }
}
class ProductPage extends StatelessWidget {
  const ProductPage({Key? key,required this.item}) : super(key: key); final Product item; @override Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(

      title: Text(item.name), ), body: Center(
      child: Container( padding: const EdgeInsets.all(0),
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ Image.asset("assets/appimages/${item.image}"),
              Expanded( child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[ Text(item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(item.description),
                      Text("Price: ${item.price}"),
                      const RatingBox(), ], ))) ]), ), ),
    );
  }

}



class RatingBox extends StatefulWidget {
  const RatingBox({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {

  int _rating = 0;
  void _setRatingAsOne() {
    setState( () {
      _rating = 1;

    });
  }
  void _setRatingAsTwo() {
    setState(()
    { _rating = 2;
    }
    );
  }
  void _setRatingAsThree(){
    setState((){
      _rating = 3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            icon: (_rating >= 1 ?
            Icon(Icons.star, size: size,) :
            Icon(Icons.star_border,size:size,)),
            color: Colors.red[500],
            onPressed: _setRatingAsOne,
            iconSize: size, ),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton( icon: (_rating >= 2 ? Icon(Icons.star, size: size,) :
          Icon(Icons.star_border, size: size,)), color: Colors.red[500],
            onPressed: _setRatingAsTwo, iconSize: size, ), ),
        Container( padding: const EdgeInsets.all(0),
          child: IconButton(icon:(_rating >= 3 ?
          Icon(Icons.star, size: size,):
          Icon(Icons.star_border, size: size,)),
            color: Colors.red[500],
            onPressed: _setRatingAsThree, iconSize: size, ),),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  const ProductBox({Key? key, required this.item}) : super(key: key);
  final Product item; @override
  Widget build(BuildContext context) {
    return Container( padding: const EdgeInsets.all(2), height: 140,
        child: Card( child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ Image.asset("assets/appimages/${item.image}"),
              Expanded( child: Container( padding: const EdgeInsets.all(5),
                  child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[ Text(item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(item.description),
                      Text("Price: ${item.price}"), const RatingBox(), ], ))) ]), )); } }