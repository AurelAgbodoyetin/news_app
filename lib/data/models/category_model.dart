class Category {
  final String name;
  final String imgUrl;
  final String keyword;

  Category({this.name, this.imgUrl, this.keyword});
}

class CategoryInstances {
  static final List<Category> categories = [
    //Category(name: "United States", imgUrl: "assets/us.png", keyword: "covid"),
    Category(
        name: "Covid-19", imgUrl: "assets/pngs/covid.png", keyword: "covid"),
    Category(name: "World", imgUrl: "assets/pngs/world.png", keyword: "world"),
    Category(
        name: "Economy", imgUrl: "assets/pngs/economy.png", keyword: "economy"),
    Category(
      name: "Cryptocurrencies",
      imgUrl: "assets/pngs/cryptocurrencies.png",
      keyword: "crypto",
    ),
    Category(
        name: "Technology",
        imgUrl: "assets/pngs/technology.png",
        keyword: "technology"),
    Category(
        name: "Science", imgUrl: "assets/pngs/science.png", keyword: "science"),
    Category(
        name: "Football",
        imgUrl: "assets/pngs/football.png",
        keyword: "football"),
    Category(
        name: "Sports", imgUrl: "assets/pngs/sports.png", keyword: "sports"),
  ];
}
