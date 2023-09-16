import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Webviewcontroller extends ChangeNotifier {
  InAppWebViewController? inAppWebViewController;

  String inturl = "";
  String searchdata = "";

  bool goBack = false;
  bool goForward = false;

  String url = ("https://www.google.com/search?q="
      "&rlz=1C1VDKB_enIN1060IN1061&oq="
      "&gs_lcrp=EgZjaHJvbWUqBggAEEUYOzIGCAAQRRg7MgYIARBFGEAyCQgCECMYJxiKBTIJCAMQABhDGIoFMgkIBBAAGEMYigUyDAgFEAAYQxixAxiKBTIJCAYQABhDGIoFMgwIBxAAGBQYhwIYgATSAQ8yNDE4NTM2MDEzajBqMTWoAgCwAgA&sourceid=chrome&ie=UTF-8");

  init({required InAppWebViewController inAppWebViewController}) {
    this.inAppWebViewController = inAppWebViewController;
  }

  cheakStates() async {
    goBack = await inAppWebViewController?.canGoBack() ?? false;
    goForward = await inAppWebViewController?.canGoForward() ?? false;
    notifyListeners();
  }

  get canGoBack {
    cheakStates();
    return goBack;
  }

  get canGoForward {
    cheakStates();
    return goForward;
  }

  back() {
    inAppWebViewController!.goBack();
    notifyListeners();
  }

  forward() {
    inAppWebViewController!.goForward();
    notifyListeners();
  }

  reload() {
    inAppWebViewController!.reload();
    notifyListeners();
  }

  search({String val = ""}) {
    searchdata = val;

    url =
        "https://www.google.com/search?q=$searchdata&rlz=1C1VDKB_enIN1060IN1061&oq=$searchdata&gs_lcrp=EgZjaHJvbWUqBggAEEUYOzIGCAAQRRg7MgYIARBFGEAyCQgCECMYJxiKBTIJCAMQABhDGIoFMgkIBBAAGEMYigUyDAgFEAAYQxixAxiKBTIJCAYQABhDGIoFMgwIBxAAGBQYhwIYgATSAQ8yNDE4NTM2MDEzajBqMTWoAgCwAgA&sourceid=chrome&ie=UTF-8";

    inAppWebViewController!.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
    );
    notifyListeners();
  }
}
