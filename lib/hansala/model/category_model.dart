class CategoryModel {
  late String categoryname;
  late String imagePath;
  bool active;

  CategoryModel(
      {required this.categoryname,
      required this.imagePath,
      required this.active});
}

//category data list

List categoryDataList = [
  CategoryModel(
      categoryname: "Mask", imagePath: "assets/images/Mask.jpg", active: false),
  CategoryModel(
      categoryname: "Handloom",
      imagePath: "assets/images/Handloom.jpg",
      active: false),
  CategoryModel(
      categoryname: "Batik",
      imagePath: "assets/images/Batik.jpeg",
      active: false),
  CategoryModel(
      categoryname: "Jewellery",
      imagePath: "assets/images/handicraftJewellery.jpg",
      active: false),
  CategoryModel(
      categoryname: "Pottery",
      imagePath: "assets/images/Pottery.jpg",
      active: false),
  CategoryModel(
      categoryname: "Resin Art",
      imagePath: "assets/images/ResinArt.jpg",
      active: false),    
  CategoryModel(
      categoryname: "Basket",
      imagePath: "assets/images/Basket.jpg",
      active: false),
  
];
