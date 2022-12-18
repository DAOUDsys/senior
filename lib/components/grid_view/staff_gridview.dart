part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class StaffGrid extends StatelessWidget {
  const StaffGrid({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ControllerApi providerApi = Provider.of<ControllerApi>(context);
    int? count;
    final List<ModelStaff> data = providerApi.staffData!.staff!;

    count = data.length;
    return GridView.builder(
        itemCount: count,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 6,
          crossAxisCount: 1,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) => StaffCard(
              data: data.elementAt(index),
            ));
  }
}
