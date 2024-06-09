class CardModel {
  final String imageUrl;
  final String title;

  CardModel({required this.imageUrl, required this.title});
}

//JUMLAH ELEMEN MUNGKIN BISA MENYESUAIKAN DI DATABASE, TAPI CARANYA GATAU AHAHAHA

//Model: Viral
final List<CardModel> viral = [
  CardModel(imageUrl: 'assets/images/ListViral/2019.png', title: '2019'),
  CardModel(imageUrl: 'assets/images/ListViral/2020.png', title: '2020'),
  CardModel(imageUrl: 'assets/images/ListViral/2021.png', title: '2021'),
  CardModel(imageUrl: 'assets/images/ListViral/2022.png', title: '2022'),
  CardModel(imageUrl: 'assets/images/ListViral/2023.png', title: '2023'),
  CardModel(imageUrl: 'assets/images/ListViral/2024.png', title: '2024'),
];

//Model: Kategori
final List<CardModel> kategori = [
  CardModel(
      imageUrl: 'assets/images/ListKategori/Masakanrumahan.png',
      title: 'Resep rumah'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/OlahanAyam.png', title: 'Ayam'),
  CardModel(imageUrl: 'assets/images/ListKategori/Daging.png', title: 'Daging'),
  CardModel(imageUrl: 'assets/images/ListKategori/Sayuran.png', title: 'Sayur'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/Seafood.png', title: 'Seafood'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png', title: 'Cemilan'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/Dessert.png', title: 'Dessert'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/Lainnya.png', title: 'Lainnya'),
];
//Model: khas
final List<CardModel> khas = [
  CardModel(
      imageUrl: 'assets/images/ListKhas/Nusantara.png', title: 'Nusantara'),
  CardModel(imageUrl: 'assets/images/ListKhas/Asia.png', title: 'Asia'),
  CardModel(imageUrl: 'assets/images/ListKhas/Western.png', title: 'Western'),
  CardModel(
      imageUrl: 'assets/images/ListKategori/Lainnya.png', title: 'Lainnya'),
];

class CardrecipeModel {
  final String imageUrl;
  final String title;
  final int rating;

  CardrecipeModel(
      {required this.imageUrl, required this.title, required this.rating});
}

//Model: resep
final List<CardrecipeModel> RecipeModel = [
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Ayam Goreng',
      rating: 5),
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Ikan Sambalado',
      rating: 4),
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Ayam Geprek',
      rating: 3),
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Seblak Puyeng',
      rating: 4),
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Ketoprak',
      rating: 5),
  CardrecipeModel(
      imageUrl: 'assets/images/ListKategori/Cemilan.png',
      title: 'Ayam gepuk',
      rating: 2),
];

class CardAccountModel {
  final String title;

  CardAccountModel({required this.title});
}

//Model: akun yang dicari
final List<CardAccountModel> AccountModel = [
  CardAccountModel(title: 'Bunda Euis Manis Madu'),
  CardAccountModel(title: 'Ayah Warkop'),
  CardAccountModel(title: 'Ibunya Windah'),
  CardAccountModel(title: 'Mamah Steve'),
];
