import 'package:chuck_norris_application/models/custom_app_bar.dart';
import 'package:chuck_norris_application/views/joke_page.dart';
import 'package:flutter/material.dart';
import '../services/colors.dart';
import '../services/remote_service.dart';
import '../services/string_extension.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key? key, required this.httpClient_}) : super(key: key);

  http.Client httpClient_;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  var _isLoaded = false;
  List<String>? _categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch data from API
    getData();
  }

  getData() async {
    _isLoaded = false;
    _categories =
        await RemoteService(httpClient: widget.httpClient_).getCategories();
    if (_categories != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Categories"),
      body: Visibility(
        visible: _isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _categories?.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 56,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JokePage(
                                    httpClient_: widget.httpClient_,
                                    category: _categories?[index],
                                    title: StringExtension.capitalize(
                                        _categories![index]))));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(COLOR_BLACK_4),
                          elevation: MaterialStateProperty.all(0),
                          foregroundColor:
                              MaterialStateProperty.all(COLOR_BLACK),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)))),
                      child: Text(
                        StringExtension.capitalize(_categories![index]),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      )),
                );
              }),
        ),
      ),
    );
  }
}
