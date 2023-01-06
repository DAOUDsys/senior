part of '../../utils/imports/app_imports.dart';

class Analytics extends StatefulWidget {
  const Analytics({Key? key}) : super(key: key);

  @override
  State<Analytics> createState() => _AnalyticsState();
}

List<String> days = [], months = [], stores = [], items = [];
String? dayValue, monthValue, itemValue, storeValue;

class _AnalyticsState extends State<Analytics> {
  @override
  void initState() {
    super.initState();

    days = List.generate(31, (i) => (i + 1).toString());
    months = List.generate(3, (i) => (i + 1).toString());
    items = [
      "pancake mix",
      "maca tea",
      "Seaweed topping",
      "Apple Vinegar",
      "Al_Jebrini fresh milk",
      "white oatmeal ",
      "Puffin Cookie Cake",
      "quinoa pee",
      "Ferrero Rocher Brownies",
      "Qarish cheese",
      "Golden Parmesan",
      "Cheetos",
      "taco sauce",
      "Hemalaya salt",
      "Cooking cream ",
      "Reese’s",
      " Cajun Seasoning",
      "Lotus Cookies"
    ];
    stores = List.generate(10, (i) => (i + 1).toString());
    dayValue = days[0];
    monthValue = months[0];
    itemValue = items[0];
    storeValue = stores[0];
  }

  @override
  Widget build(BuildContext context) {
    final ControllerApi providerApi = Provider.of<ControllerApi>(context);
    final ControllerApi controllerApi =
        Provider.of<ControllerApi>(context, listen: false);

    return Scaffold(
        drawer: const DrawerBody(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            title: const Text(
              "Data Analytics",
              style: TextStyle(fontSize: 28),
            ),
            centerTitle: true,
          ),
        ),
        // scaffold color is the same as appbar to let it seem like curves and the container has the opposite color
        backgroundColor: AppThemeChoose.getMode(context)
            ? AppColors.part_dark
            : AppColors.part_light,
        //container that have the grid inside it and its the body
        body: RefreshIndicator(
            onRefresh: () => refreshShelf(context),
            child: Container(
              //decoration of the main container
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36)),
                color: AppThemeChoose.getMode(context)
                    ? AppColors.main_dark
                    : AppColors.main_light,
              ),

              //child of the main container
              child: Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Container(
                      //height to let container cover its space to let the SingleChildScrollView work well
                      // 120 is the hight of appbar
                      height: MediaQuery.of(context).size.height - 120,
                      //decoration of the main container
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(36),
                            topRight: Radius.circular(36)),
                        color: AppThemeChoose.getMode(context)
                            ? AppColors.main_dark
                            : AppColors.main_light,
                      ),

                      //child of the main container
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 10),
                          ///////////////// the form is here /////////////////////
                          child: Form(
                              key: ShelfSettings.keyFrom,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Chose(
                                      key: const Key('list1'),
                                      items: days,
                                      value: dayValue,
                                      title: "Day",
                                      onChanged: (newValue) {
                                        // setState(() => dayValue = newValue!);
                                        setState(() => dayValue = newValue!);
                                      },
                                    ),
                                    Chose(
                                      key: const Key('list2'),
                                      items: months,
                                      value: monthValue,
                                      title: "Moth",
                                      onChanged: (newValue) {
                                        setState(() => monthValue = newValue!);
                                      },
                                    ),
                                    Chose(
                                      key: const Key('list3'),
                                      items: items,
                                      value: itemValue,
                                      title: "Item",
                                      onChanged: (newValue) {
                                        // itemValue = newValue!;
                                        setState(() => itemValue = newValue!);
                                      },
                                    ),
                                    Chose(
                                      key: const Key('list4'),
                                      items: stores,
                                      value: storeValue,
                                      title: "Store",
                                      onChanged: (newValue) {
                                        setState(() => storeValue = newValue!);
                                      },
                                    ),
                                    ElevatedButton(
                                        onPressed: () async => {
                                              await controllerApi
                                                  .fetchAnalytics(
                                                      int.parse(dayValue!),
                                                      int.parse(monthValue!),
                                                      items.indexOf(itemValue!),
                                                      int.parse(storeValue!)),
                                            },
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(150, 65),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                        ),
                                        child: const Text(
                                          "Get Result",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    providerApi.loading
                                        ? const AppLoading(
                                            loading: ChoiceLoading.page,
                                          )
                                        : RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text:
                                                    "Required number of items is ",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color:
                                                        AppThemeChoose.getMode(
                                                                context)
                                                            ? Colors.white
                                                            : Colors.black),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${controllerApi.analyticsData} item",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: AppThemeChoose.getMode(
                                                          context)
                                                      ? Colors.purple
                                                      : Colors.lightGreen,
                                                ),
                                              ),
                                            ]),
                                          )
                                  ]))))),
            )));
  }
}
