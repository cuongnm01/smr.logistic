part of 'order_history_screen.dart';

extension OrderHistoryExtension on OrderHistoryScreen {
  Widget buildItem({
    required String label,
    required String title,
    double? borderWidth,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  width: borderWidth ?? 1, color: const Color(0xFFF5F5F5)))),
      child: Row(
        children: [
          Container(
              width: 150, child: Text(label, style: AppTextStyle.regular())),
          Expanded(child: Text(title, style: AppTextStyle.regular())),
        ],
      ),
    );
  }

  Widget _buildItems({required Order item}) {
    return GestureDetector(
      onTap: () {
        controller.onViewDetail(item);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.code ?? '',
              style: AppTextStyle.heavy(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateUtil.formatDatetimeToString(item.createdDate?.toUtc(),
                      type: DateUtil.DATE_TYPE),
                  style: AppTextStyle.regular(),
                ),
                Text(
                  NumberFormat.currency(locale: 'vi', symbol: 'đ')
                      .format(item.temporaryPrice ?? 0),
                  style: AppTextStyle.heavy(fontSize: 16)
                      .copyWith(fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Text(
              item.status ?? '',
              style: AppTextStyle.regular(),
            ),
          ],
        ),
      ),
    );
  }
}
