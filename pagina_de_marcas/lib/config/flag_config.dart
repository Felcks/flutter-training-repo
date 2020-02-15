class FlagConfig {
  static CardFlag cardFlag;
}

class CardFlag {
  CardFlag({
    this.showStars = true,
    this.showPrice = true,
    this.showListPrice = true,
  });

  bool showStars = true;
  bool showPrice = true;
  bool showListPrice = true;
}
