part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class ShelfGrid extends StatelessWidget {
  const ShelfGrid({Key? key,}): super(key: key);
  @override
  Widget build(BuildContext context) {
    int? count;
    // get shelf data
    final List<ModelShelf> data = Provider.of<ControllerApi> (context).shelfData!.shelf!;

    count = data.length;
    return GridView.builder(
      
      itemCount: count,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2,
        crossAxisCount: 1,  
        mainAxisSpacing: 20,

    ),
     itemBuilder: (context,index) => ShelfCard(data: data.elementAt(index))
       
       );
  }

}