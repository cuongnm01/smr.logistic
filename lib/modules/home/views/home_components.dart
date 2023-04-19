part of 'home_screen.dart';

extension HomeComponents on HomeScreen {
  Widget buildHeaderBar() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CommonConstants.paddingDefault, vertical: 12),
      color: AppColor.primaryColor,
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              await controller.viewProfile();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FCoreImage(
                ImageConstants.avatarDefault,
                width: 50,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${controller.userInfo.value?.fullName ?? ''}'.tr,
                  style: AppTextStyle.heavy(color: Colors.white),
                ),
                Text(
                  '@${controller.userInfo.value?.userName ?? ''}',
                  style: AppTextStyle.regular(color: Colors.white),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(),
                )
              ],
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
    );
  }

  Widget buildSlider() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: SliderWidget(
        ratio: 2,
        localImage: true,
        showIndicator: true,
        borderRadius: 20,
        items: [
          SliderItem(
            image: ImageConstants.sliderDefault,
            onpress: () {},
          ),
          SliderItem(
            image: ImageConstants.sliderDefault,
            onpress: () {},
          ),
        ],
      ),
    );
  }

  Widget buildCategory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                direction: Axis.horizontal,
                children: [
                  _buildCategoryItem(
                    icon: ImageConstants.truck,
                    title: 'Kinh nghiệm',
                    description: 'Hơn 5 năm kinh nghiệm',
                  ),
                  _buildCategoryItem(
                    icon: ImageConstants.money,
                    title: 'PHỦ SÓNG',
                    description: 'Trên 3 quốc gia',
                  ),
                  _buildCategoryItem(
                    icon: ImageConstants.phone,
                    title: 'TƯ VẤN 24/7',
                    description: 'Hỗ trợ suốt cả tuần',
                  ),
                  _buildCategoryItem(
                    icon: ImageConstants.box,
                    title: 'VẬN CHUYỂN',
                    description: 'Hơn 5000 khách hàng sử dụng',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
      {required String icon, required String title, String? description}) {
    return Container(
      width: (Get.width - 70) / 2,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FCoreImage(
                  icon,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title.toUpperCase(),
            textAlign: TextAlign.center,
            maxLines: 1,
            style: AppTextStyle.heavy(fontSize: 18, color: AppColor.primaryColor),
          ),
          Text(
            description ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: AppTextStyle.regular(fontSize: 15),
          )
        ],
      ),
    );
  }

  Widget buildProduct() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(width: 3, color: AppColor.primaryColor),
                  ),
                ),
                child: Text(
                  'Dịch vụ',
                  style: AppTextStyle.heavy(),
                )),
            const SizedBox(height: 20),
            _buildProductItem(title: 'Gửi bưu phẩm, giấy tờ, chứng từ '),
            const SizedBox(height: 10),
            _buildProductItem(
                title:
                    'Gửi các loại hàng điện tử : laptop, iphone, loa, âm ly.v.v  '),
            const SizedBox(height: 10),
            _buildProductItem(title: 'Gửi thuốc tây dược phẩm '),
            const SizedBox(height: 10),
            _buildProductItem(title: 'Gửi thực phẩm bánh kẹo '),
            const SizedBox(height: 10),
            _buildProductItem(title: 'Gửi hàng hoá cá nhân '),
            const SizedBox(height: 10),
            _buildProductItem(
                title: 'Gửi hàng hoá cồng kềnh, thiết bị, máy móc'),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildProductItem({required String title}) {
    return Container(
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        ),
        child: Row(
          children: [
            Container(
              child: FCoreImage(
                IconConstants.package,
                width: 50,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.regular(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
