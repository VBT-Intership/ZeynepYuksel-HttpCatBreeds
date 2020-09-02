import 'package:cat_breeds_project/model/http_cat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../viewModel/http_cats_view_model.dart';

class HttpCatsView extends HttpCatsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Container(
            child: Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                child: Text(
                  "Cat Breeds",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                )),
            Expanded(
                child: ListView.builder(
              itemCount: httpCats.length,
              itemBuilder: (context, index) => buildCardHttp(httpCats[index]),
            )),
          ],
        )));
  }

  Card buildCardHttp(HttpCatModel cat) {
    return Card(
        color: Colors.white30,
        margin: EdgeInsets.all(20),
        child: ListTile(
          title: Align(
            child: Padding(
                padding: EdgeInsets.fromLTRB(5, 17, 5, 1),
                child: Image.network(cat.image)),
            alignment: Alignment(-1.2, 0),
          ),
          subtitle: Column(
            children: [
              SizedBox(height: 4),
              Text(
                cat.breed,
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: buildTextAppBar(),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
      leading: buildPaddingProgress,
    );
  }

  Widget get buildPaddingProgress {
    return Visibility(
      visible: isLoading,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Text buildTextAppBar() => Text("Http Cat Breeds View");
}
