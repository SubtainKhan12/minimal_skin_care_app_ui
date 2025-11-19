class RecentProductModel {
  final String image;
  final String label;

  RecentProductModel({required this.image, required this.label});
}

final List<RecentProductModel> recentProductList = [
  RecentProductModel(image: "assets/images/2.png", label: "Niacinamide "),
  RecentProductModel(image: "assets/images/1.png", label: "Retinol"),
  RecentProductModel(image: "assets/images/3.png", label: "Vitamin C"),
];
final List<RecentProductModel> faceWashList = [
  RecentProductModel(image: "assets/images/5.webp", label: "U-GLO "),
  RecentProductModel(image: "assets/images/6.webp", label: "DE RAN"),
  RecentProductModel(image: "assets/images/8.webp", label: "MEC C"),
];
final List<RecentProductModel> handWashList = [
  RecentProductModel(image: "assets/images/9.jpeg", label: "U-GLO "),
  RecentProductModel(image: "assets/images/10.jpeg", label: "DE RAN"),
  RecentProductModel(image: "assets/images/11.webp", label: "MEC C"),
  RecentProductModel(image: "assets/images/12.webp", label: "MEC C"),
];
