part of 'notification_screen.dart';

extension NotificationExtension on NotificationScreen {
  Widget buildEmptyPage() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FCoreImage(
              ImageConstants.notifyEmpty,
              width: 110,
            ),
            const SizedBox(height: 18),
            Text('notification.empty'.tr,
                style: AppTextStyle.regular()),
          ],
        ),
      ),
    );
  }

  Widget buildItemNotification({
    required NotificationModel item,
  }) {
    return InkWell(
      onTap: () {
        controller.viewDetail(
            item.id!, item.displayType ?? 1, item.invoiceId ?? 0, item.typeLink);
      },
      child: Container(
        width: Get.width,
        color: item.isRead == 0
            ? AppColor.secondBackgroundColorLight
            : AppColor.primaryBackgroundColorLight,
        margin: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, right: 30, bottom: 20, left: 20),
              child: (item.displayImage != null && item.displayImage != '')
                  ? NetWorkImage(
                      image: item.displayImage!,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(width: 60),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title ?? '',
                        style: AppTextStyle.regular().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColorLight,
                            ),
                      ),
                      Text(item.description ?? '',
                          style: AppTextStyle.regular()),
                      Text(item.createdAt ?? '',
                          style: AppTextStyle.regular()),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
