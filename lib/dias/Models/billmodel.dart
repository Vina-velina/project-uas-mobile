class CheckBoxListTileModel {
  int userId;
  String img;
  String title;
  bool isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'assets/images/logo1.png',
          title: "DANA",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 2,
          img: 'assets/images/logo3.jpeg',
          title: "Gopay",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'assets/images/logo2.jpg',
          title: "OVO",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          img: 'assets/images/logo4.png',
          title: "LINK AJA",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 5,
          img: 'assets/images/logo5.jpg',
          title: "Pulsa",
          isCheck: false),
    ];
  }
}