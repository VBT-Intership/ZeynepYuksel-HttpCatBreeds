import 'dart:convert';
import 'dart:io';

import 'package:cat_breeds_project/model/http_cat_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../view/http_cats.dart';

abstract class HttpCatsViewModel extends State<HttpCats> {
  final baseUrl = "https://firstproject-b4f81.firebaseio.com";
  bool isLoading = false;
  List<HttpCatModel> httpCats = [];

  @override
  void initState() {
    super.initState();
    callItems();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> callItems() async {
    changeLoading();
    await _getHttpCats();
    changeLoading();
    checkErrorList();
  }

  void checkErrorList() {
    if (httpCats.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Text(".statusCode.toString()"),
        ),
      );
    }
  }

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getHttpCats() async {
    final response = await http.get("$baseUrl/cats.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body);
        if (jsonBody is List)
          httpCats = jsonBody.map((e) => HttpCatModel.fromJson(e)).toList();
        break;
      default:
    }
  }
}
