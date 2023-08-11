part of 'account_overview_screen.dart';

extension AccountOverviewExtension on AccountOverviewScreen {
  Widget buildItem({
    required Icon icon,
    required String title,
    Function()? onPress,
    Color? titleColor,
    int? allowArrow = 1,
  }) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 14), child: icon),
                Text(title,
                    style: AppTextStyle.regular(
                      color: titleColor ?? Colors.black,
                    )),
              ],
            )),
            (allowArrow == 1)
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.primaryColor,
                    size: 18,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
