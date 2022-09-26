part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class Grid extends StatelessWidget {
  Grid({Key? key,required this.cardAspectRatio,required this.card}): super(key: key);
  double cardAspectRatio;
  Widget card;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      itemCount: 20,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: cardAspectRatio,
        crossAxisCount: 1,  
        mainAxisSpacing: 20,

    ),
     itemBuilder: (context,index) => card );
  }

}