part of '../../utils/imports/app_imports.dart';

// ignore: must_be_immutable
class SimpleNCard extends StatelessWidget {
  const SimpleNCard({Key? key, required this.data}) : super(key: key);
  final ModelNotification data;

  @override
  Widget build(BuildContext context) {
    return GridTile(
        child: Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                height: 150,
                child: Container(
                    decoration: BoxDecoration(
                        color: AppThemeChoose.getMode(context)
                            ? AppColors.textbox_dark
                            : AppColors.textbox_light,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.shadow_textbox_dark,
                              blurRadius:
                                  AppThemeChoose.getMode(context) ? 50 : 15,
                              offset: const Offset(0, 10))
                        ]),
                    child: Column(
                      children: [
                        Text(
                          // DateTime date = DateTime.parse('1969-07-02');
                          timeago.format(
                              DateTime.parse(data.timeStamp!).subtract(Duration(
                                  microseconds: DateTime.now().microsecond)),
                              allowFromNow: false),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.notifications_active_outlined,
                              size: 35,
                            ),
                            SizedBox(
                              width: 280,
                              child: Text(
                                data.content ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )))));
  }
}
