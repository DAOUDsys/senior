part of '../../../../utils/imports/app_imports.dart';

class DrawerTheme extends StatelessWidget {
  const DrawerTheme({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider theme
    final ControllerTheme manageTheme =Provider.of<ControllerTheme>(context);

    //Provider
    return Switch(value: manageTheme.theme, 
        onChanged:manageTheme.updateTheme,
    );
         }

}