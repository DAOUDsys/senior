part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class Chose extends StatefulWidget {
  Chose({Key? key, this.items, this.value, this.title, this.onChanged})
      : super(key: key);

  final List<String>? items;
  String? value;
  final String? title;
  final void Function(String?)? onChanged;
  @override
  State<Chose> createState() => _ChoseState();
}

class _ChoseState extends State<Chose> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title!,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        Container(
          width: 250,
          height: 70,
          decoration: BoxDecoration(
              color: AppThemeChoose.getMode(context)
                  ? AppColors.textbox_dark
                  : AppColors.textbox_light,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadow_textbox_dark,
                    blurRadius: AppThemeChoose.getMode(context) ? 50 : 30,
                    offset: const Offset(0, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: DropdownButton(
              // the value that shown on list first
              value: widget.value,
              //the items the shown when click on button
              items: widget.items!.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              // on change
              onChanged: widget.onChanged,

              // the color of the arrow
              iconEnabledColor: AppThemeChoose.getMode(context)
                  ? AppColors.part_dark
                  : AppColors.part_light,
              // size of the arrow
              iconSize: 40,
              // to let it fill the container
              isExpanded: true,
            ),
          ),
        ),
      ],
    );
  }
}
