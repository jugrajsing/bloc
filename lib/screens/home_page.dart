import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test_application_bloc/widgets/raw_list_view.dart';

class HomePage extends StatefulWidget {
  final list;
  final grid;


  const HomePage({this.list, this.grid}) : super();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _list(widget.list),
              _grid(widget.grid)
            ],
          ),
        ));
  }

  Widget _list(List images) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height / 2.5,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        items: images.map((image) {
          return ListRow(image: image);
        }).toList(),
      ),
    );
  }


  void largeImage(image) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(

              elevation: 5,
              child:Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover
                    )
                ),
              ),);
        });
  }

  Widget buildRowItemsGrid(BuildContext context, int index, image) {
    return GestureDetector(
      onTap: ()=>largeImage(image),
      child: Container(
        child: Card(
          elevation: 5.0,
          child: Image.network(
            "$image",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  Widget _grid(List images) {
    return GridView.count(
        crossAxisCount: 2,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(images.length, (index) {
          return buildRowItemsGrid(context, index, images[index]);
        }
        )
    );
  }
}
