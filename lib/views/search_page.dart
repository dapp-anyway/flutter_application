import 'package:chuck_norris_application/models/custom_app_bar.dart';
import 'package:chuck_norris_application/services/colors.dart';
import 'package:chuck_norris_application/services/remote_service.dart';
import 'package:flutter/material.dart';
import '../models/search.dart';
import '../services/string_extension.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  SearchPage({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var _isLoaded = false;
  Search? _search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch data from API
    getData(request: widget.title);
  }

  getData({required String request}) async {
    _isLoaded = false;
    _search = await RemoteService(httpClient: http.Client())
        .getSearch(search: request);

    if (_search != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: widget.title,
      ),
      body: Visibility(
        visible: _isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: _search?.result.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: COLOR_BLACK_4,
                      borderRadius: BorderRadius.circular(5.0)),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 12, bottom: 15),
                  child: Text(
                    StringExtension.capitalize(_search?.result[index].value),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: COLOR_BLACK,
                      height: 1.6,
                    ),
                  ));
            }),
      ),
    );
  }
}
