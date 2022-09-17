part of '../../utils/imports/app_imports.dart';

class AppWebView extends StatefulWidget {
  const AppWebView({Key? key,required this.url}): super(key: key);

  final String url;
  @override
  State<AppWebView> createState() =>_AppWebViewState();
}


class _AppWebViewState extends State<AppWebView> {
  bool isLoading = true;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (finish) {
        setState (() {
          isLoading=false;
        });
      },
    ),
    if(isLoading)
    const AppLoading(loading: ChoiceLoading.webView,),
      ],
    );
    
  }
}