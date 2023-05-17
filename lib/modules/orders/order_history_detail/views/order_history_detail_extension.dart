part of 'order_history_detail_screen.dart';

extension OrderHistoryDetailExtension on OrderHistoryDetailScreen {
  Widget buildItem({
    required String label,
    required String title,
    double? borderWidth,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
              width: 160, child: Text(label, style: AppTextStyle.regular())),
          Expanded(child: Text(title, style: AppTextStyle.regular())),
        ],
      ),
    );
  }

  Widget _buildItems({required Order item}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin đơn hàng',
            style: AppTextStyle.heavy(),
          ),
          buildItem(
              label: 'Mã đơn hàng', title: controller.order.value.code ?? ''),
          buildItem(
            label: 'Ngày đặt hàng',
            title: DateUtil.formatDatetimeToString(item.createdDate?.toUtc(),
                type: DateUtil.DATE_TYPE),
          ),
          buildItem(
            label: 'Giá đơn hàng',
            title: NumberFormat.currency(locale: 'vi', symbol: 'đ')
                .format(item.temporaryPrice ?? 0),
          ),
          buildItem(
              label: 'Trạng thái', title: controller.order.value.status ?? ''),
          buildItem(label: 'Loại yêu cầu', title: 'Việt Nhật'),
          buildItem(
              label: 'Chiều vận chuyển',
              title: '${controller.ServiceTypeString()}'),
          buildItem(
              label: 'Loại hình vận chuyển',
              title: '${controller.ShippingTypeString()}'),
        ],
      ),
    );
  }

  Widget _buildSenderInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin cá nhân',
            style: AppTextStyle.heavy(),
          ),
          buildItem(
              label: 'Họ tên', title: controller.order.value.senderName ?? ''),
          buildItem(
              label: 'Số điện thoại',
              title: controller.order.value.senderPhone ?? ''),
          buildItem(
              label: 'Email', title: controller.order.value.senderEmail ?? ''),
          buildItem(
              label: 'Địa chỉ',
              title: controller.order.value.senderAddress ?? ''),
          buildItem(
              label: 'Yêu cầu',
              title: controller.order.value.description ?? ''),
        ],
      ),
    );
  }

  Widget _buildReciverInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin người nhận',
            style: AppTextStyle.heavy(),
          ),
          buildItem(
              label: 'Họ tên',
              title: controller.order.value.receiverName ?? ''),
          buildItem(
              label: 'Số điện thoại',
              title: controller.order.value.receiverPhone ?? ''),
          buildItem(
              label: 'Email',
              title: controller.order.value.receiverEmail ?? ''),
          buildItem(
              label: 'Địa chỉ',
              title: controller.order.value.receiverAddress ?? ''),
          buildItem(
              label: 'Mã bưu điện',
              title: controller.order.value.receiverPostCode ?? ''),
        ],
      ),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Thông tin sản phẩm',
            style: AppTextStyle.heavy(),
          ),
          const SizedBox(height: 10),
          ...List.generate(controller.order.value.orderDetails!.length,
              (index) {
            return _buildProductItem(
              item: controller.order.value.orderDetails![index],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildProductItem({required OrderDetail item}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade300),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.productName ?? '',
            style: AppTextStyle.heavy(fontSize: 16),
          ),
          if (item.isInsurance != null && item.isInsurance!)
            Text(
              item.isInsurance != null && item.isInsurance!
                  ? '(Có bảo hiểm)'
                  : '',
              style: AppTextStyle.regular(),
            ),
          Text(
            '${item.price ?? 0} VND',
            style: AppTextStyle.regular(),
          ),
          Row(
            children: [
              Text(
                '${item.weight ?? 0}kg, ',
                style: AppTextStyle.regular(),
              ),
              Text(
                '${item.long ?? 0}cm x ${item.width ?? 0}cm x ${item.height ?? 0}cm',
                style: AppTextStyle.regular(),
              ),
            ],
          ),
          Text(
            item.description ?? '',
            style: AppTextStyle.regular(),
          ),
        ],
      ),
    );
  }
}
