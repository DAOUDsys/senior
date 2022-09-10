part of '../../utils/imports/app_imports.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({Key? key,required this.url}): super(key: key);

  final String url;
  @override
  State<AppWebView> createState() =>_AppWebViewState();
}


class _AppWebViewState extends State<AppWebView> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}