part of '../../utils/imports/app_imports.dart';


class GridShelf extends StatelessWidget {
  const GridShelf({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      itemCount: 20,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2,
        crossAxisCount: 1,  
        mainAxisSpacing: 20,

    ),
     itemBuilder: (context,index) => const ShelfCard() );
  }

}