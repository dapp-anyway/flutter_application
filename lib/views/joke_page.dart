import 'package:chuck_norris_application/models/custom_app_bar.dart';
import 'package:chuck_norris_application/services/remote_service.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../services/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class JokePage extends StatefulWidget {
  JokePage({Key? key, this.category, this.title = 'Random Joke'})
      : super(key: key);

  String? category;
  String title;

  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  Post? _post;
  var _isLoaded = false;
  String? category;

  // final Destination? destination;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = widget.category;
    //fetch data from API
    getData();
  }

  getData() async {
    _isLoaded = false;
    if (category == null) {
      _post = await RemoteService().getPost();
    } else {
      _post = await RemoteService().getPost(category: category);
    }

    if (_post != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  _launchURL() async {
    const url = "https://en.wikipedia.org/wiki/Chuck_Norris";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: widget.title),
      body: Visibility(
        visible: _isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Text(
                      "${_isLoaded ? _post?.value : ""}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: COLOR_BLACK,
                          height: 1.6,
                          backgroundColor: Colors.white),
                    ),
                  ),
                ),
                // Align(
                //   alignment: FractionalOffset.bottomCenter,
                //   child: SizedBox(
                //     height: 56,
                //     width: MediaQuery.of(context).size.width,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           getData();
                //         },
                //         style: ButtonStyle(
                //             backgroundColor:
                //                 MaterialStateProperty.all(COLOR_BLACK_4),
                //             elevation: MaterialStateProperty.all(0),
                //             foregroundColor:
                //                 MaterialStateProperty.all(COLOR_BLACK),
                //             shape: MaterialStateProperty.all<
                //                     RoundedRectangleBorder>(
                //                 RoundedRectangleBorder(
                //                     borderRadius:
                //                         BorderRadius.circular(10.0)))),
                //         child: const Text(
                //           "Open in browser",
                //           style: TextStyle(
                //               fontSize: 16, fontWeight: FontWeight.w500),
                //         )),
                //   ),
                // ),
                // const Padding(padding: EdgeInsets.only(top: 10)),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                    height: 56,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          getData();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(COLOR_SKIN),
                            elevation: MaterialStateProperty.all(0),
                            foregroundColor:
                                MaterialStateProperty.all(COLOR_BLACK),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10.0)))),
                        child: const Text(
                          "Show new joke",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
