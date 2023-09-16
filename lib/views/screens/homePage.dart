import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall_1/controller/web_view.dart';
import 'package:provider/provider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

void _showDialog(BuildContext context) {
  const AlertDialog(
    title: Text("Select"),
    backgroundColor: Colors.grey,
    content: Text("hey"),
  );
}

String searchdata = "";

class _Home_PageState extends State<Home_Page> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Consumer<Webviewcontroller>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "My Browser",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            PopupMenuButton(
              clipBehavior: Clip.antiAlias,
              elevation: 20,
              itemBuilder: (context) => [
                // PopupMenuItem 1
                PopupMenuItem(
                  child: Row(
                    children: const [
                      Icon(Icons.bookmark_add_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Bookmark")
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Icon(Icons.search_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Search Engine"),
                    ],
                  ),
                ),
              ],
              offset: const Offset(0, 50),
              onSelected: (value) {
                if (value == 1) {
                  _showDialog(context);
                } else if (value == 2) {
                  _showDialog(context);
                }
              },
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (val) {
                provider.search(val: val);
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Consumer<Webviewcontroller>(
                  builder: (context, provider, child) {
                    return InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: Uri.parse(
                          provider.url,
                        ),
                      ),
                      onLoadStart: (controller, url) {
                        provider.init(inAppWebViewController: controller);
                      },
                      onLoadStop: (controller, url) {
                        provider.init(inAppWebViewController: controller);
                      },
                    );
                  },
                ),
              ),
            ),
            BottomAppBar(
              height: s.height * 0.075,
              color: Colors.transparent,
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    icon: const Icon(Icons.home_rounded),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_add_outlined),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed:
                        provider.canGoBack ? () => provider.back() : null,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      provider.reload();
                    },
                    icon: const Icon(
                      Icons.refresh_outlined,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed:
                        provider.canGoForward ? () => provider.forward() : null,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
