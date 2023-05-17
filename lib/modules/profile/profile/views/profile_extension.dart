part of 'profile_screen.dart';

extension ProfileExtension on ProfileScreen {
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
}
