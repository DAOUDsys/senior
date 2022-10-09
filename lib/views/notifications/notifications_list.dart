part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);
  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  
  @override
  void initState() {
    super.initState();
    {dev.log("notification list page");
    final ControllerApi controllerApi = Provider.of<ControllerApi> (context,listen: false);
    
    Future.delayed(Duration.zero, () {
     controllerApi.fetchNotificationData();
    });
  
  }
  }

  @override
  Widget build(BuildContext context) {
    final ControllerApi providerApi = Provider.of<ControllerApi> (context);
    return Scaffold(
      
      drawer: const DrawerBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: const Text("Staffs",style: TextStyle(fontSize: 28),),
          centerTitle: true,
          ),
          ),
          // scaffold color is the same as appbar to let it seem like curves and the container has the opposite color
      backgroundColor: AppThemeChoose.getMode(context)? AppColors.part_dark: AppColors.part_light,
      //container that have the grid inside it and its the body
      body: Container(
          //decoration of main 
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(36) , topRight: Radius.circular(36)),
            color: AppThemeChoose.getMode(context)? AppColors.main_dark: AppColors.main_light,
            ),

          
          //child of the main container
          child: Padding(padding: const EdgeInsets.only(top: 10),
          child: providerApi.loading? const AppLoading(loading: ChoiceLoading.page,) : 
            providerApi.notificationData?.notification == null? StaffList.error :const NotificationGrid(),
          ),

        )  
        
    );
  }
}