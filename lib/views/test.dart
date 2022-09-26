part of '../utils/imports/app_imports.dart';



class MyTest extends StatelessWidget {
  const MyTest({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const DrawerBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(elevation: 0,)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppSvg.account,
          const Text("Name App"),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/connect");}, child: const Text("connect"))),
              Expanded(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/singin");}, child: const Text("go back"))),
              Expanded(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/staff");}, child: const Text("staff"))),
            ],
          ),
              Expanded(child: ElevatedButton(onPressed: (){Navigator.pushNamed(context, "/notification");}, child: const Text("notifications"))),

          


        ],



      ),
    );
  }
}

