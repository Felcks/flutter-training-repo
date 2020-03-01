class FlagConfig {
  static CardFlag cardFlag;
}

class CardFlag {
  CardFlag({
    this.showStars = true,
    this.showPrice = true,
    this.showListPrice = true,
    this.showBuyButton = true,
    this.showBrand = false,
  });

  bool showStars = true;
  bool showPrice = true;
  bool showListPrice = true;
  bool showBuyButton = true;
  bool showBrand = false;
}