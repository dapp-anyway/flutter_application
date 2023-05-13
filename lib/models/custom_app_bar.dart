import 'package:chuck_norris_application/views/search_page.dart';
import 'package:flutter/material.dart';
import '../services/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  final String title;

  @override
  final Size preferredSize =
      const Size.fromHeight(kToolbarHeight); // default is 56.0
}

class _CustomAppBarState extends State<CustomAppBar> {
  late TextEditingController _controller;
  late Widget customSearchBar;

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _controller = TextEditingController();

    customSearchBar = Text(
      widget.title,
      style: const TextStyle(
        color: COLOR_BLACK,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    );
  }

  Icon customIcon = const Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  // Perform set of instructions.
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = ListTile(
                    title: TextField(
                      controller: _controller,
                      onSubmitted: (String s) {
                        if (ModalRoute.of(context)?.settings.name !=
                            "/search_page") {
                          setState(() {
                            _controller = TextEditingController();
                            customIcon = const Icon(Icons.search);
                            customSearchBar = Text(
                              widget.title,
                              style: const TextStyle(
                                color: COLOR_BLACK,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            );
                          });

                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      SearchPage(title: s),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                  settings: const RouteSettings(
                                      name: "/search_page")));
                        } else {
                          setState(() {
                            _controller = TextEditingController();
                            customIcon = const Icon(Icons.search);
                            customSearchBar = Text(
                              widget.title,
                              style: const TextStyle(
                                color: COLOR_BLACK,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            );
                          });

                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      SearchPage(title: s),
                                  settings: const RouteSettings(
                                      name: "/search_page")));
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter a request...',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: COLOR_BLACK,
                      ),
                    ),
                  );
                } else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = Text(
                    widget.title,
                    style: const TextStyle(
                      color: COLOR_BLACK,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  );
                }
              });
            },
            icon: customIcon,
          )
        ],
        title: customSearchBar,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(
          color: COLOR_BLACK, //change your color here
        ),
        shadowColor: Colors.black38);
  }
}
