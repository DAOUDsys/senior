part of '../../../../utils/imports/app_imports.dart';

class DrawerA extends StatelessWidget {
  const DrawerA({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Register auth =Provider.of<Register>(context);
    return SafeArea(
    child: Column(
      children: [
        Row(
          children: [
            //image
              Container(
                width: 125,
                height: 125,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"), )
                ),
              ),
            //information
            Column(
              children: [
                //name
                  Text(auth.userData.name ?? "???"),
                  

                //email
                Text(auth.userData.email ?? "???",maxLines: 1,overflow: TextOverflow.ellipsis,)
              ],
            )
          ],
        ),
      ],
    ),
    
  );
  }

}