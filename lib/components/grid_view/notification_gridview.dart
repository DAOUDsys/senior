part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class NotificationGrid extends StatelessWidget {
  const NotificationGrid({Key? key,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    int? count;
    // get shelf data
    final List<ModelNotification> data = Provider.of<ControllerApi> (context).notificationData!.notification!;

    count = data.length;
    return GridView.builder(
      
      itemCount: count,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.6,
        crossAxisCount: 1,  
        mainAxisSpacing: 20,

    ),
     itemBuilder: (context,index) => SimpleNCard(data: data.elementAt(index))
     
     );
  }

}