part of '../../../../utils/imports/app_imports.dart';

class DrawerTheme extends StatelessWidget {
  const DrawerTheme({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider theme
    final ManageTheme manageTheme =Provider.of<ManageTheme>(context);

    //Provider
    return Switch(value: manageTheme.theme, 
        onChanged:manageTheme.updateTheme,
    );
         }

}