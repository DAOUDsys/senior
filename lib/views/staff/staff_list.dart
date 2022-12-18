part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class StaffList extends StatefulWidget {
  const StaffList({Key? key}) : super(key: key);
  @override
  State<StaffList> createState() => _StaffListState();
  static Widget error = const Center(
      child: Text(
    "Error",
    style:
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30),
  ));
}

Future refreshStaff(BuildContext context) async {
  final ControllerApi controllerApi =
      Provider.of<ControllerApi>(context, listen: false);
  controllerApi.fetchStaffData();
}

class _StaffListState extends State<StaffList> {
  @override
  void initState() {
    super.initState();
    {
      dev.log("staff list page");
      final ControllerApi controllerApi =
          Provider.of<ControllerApi>(context, listen: false);

      Future.delayed(Duration.zero, () {
        controllerApi.fetchStaffData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ControllerApi providerApi = Provider.of<ControllerApi>(context);
    return Scaffold(
        drawer: const DrawerBody(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            title: const Text(
              "Staffs",
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
            onRefresh: () => refreshStaff(context),
            child: Container(
              //decoration of main
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
                padding: const EdgeInsets.only(top: 10),
                child: providerApi.loading
                    ? const AppLoading(
                        loading: ChoiceLoading.page,
                      )
                    : providerApi.staffData?.staff == null
                        ? StaffList.error
                        : const StaffGrid(),
              ),
            )));
  }
}
