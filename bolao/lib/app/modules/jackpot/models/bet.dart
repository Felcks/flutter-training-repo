class Bet {
  int value;
  BetType type;

  Bet(this.value, this.type);

  String getName() {
    switch (this.type) {
      case BetType.game_coin:
        return "Moedas";
        break;
      case BetType.brl:
        return "Reais";
        break;
      default:
        return "";
        break;
    }
  }
}

enum BetType { game_coin, brl }
