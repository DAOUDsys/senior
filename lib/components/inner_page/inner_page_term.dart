part of '../../utils/imports/app_imports.dart';

class InnerPageTerm extends StatelessWidget {
  const InnerPageTerm({Key? key,required this.url}): super(key: key);
  
  final String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("AUTHORS"),
      ),
      body: AppWebView(url: url),
    );
  }
}