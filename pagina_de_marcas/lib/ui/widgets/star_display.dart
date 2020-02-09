import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarDisplayWidget extends StatelessWidget {
  final double value;
  final Widget filledStar;
  final Widget unfilledStar;
  final Widget halfStar;

  const StarDisplayWidget({
    Key key,
    this.value = 0,
    @required this.filledStar,
    @required this.unfilledStar,
    @required this.halfStar,
  })  : assert(value != null),
        super(key: key); //value 3.3   index 3 < 4 ok estrela preenchida                 index 4 > 3 ///

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {

        try{
          int decimalPartOfValue = int.tryParse(value.toString().split('.')[1].substring(0,1));
          return index < value.floor() ? filledStar : ((index - value.floor()) == 0 && (decimalPartOfValue > 2.5) && (decimalPartOfValue < 7.5)) ? halfStar  : unfilledStar;
        } on Exception{
          return index < value.floor() ? filledStar : unfilledStar;
        }
      }),
    );
  }
}

class StarDisplay extends StarDisplayWidget {
  const StarDisplay({Key key, double value = 0})
      : super(
    key: key,
    value: value,
    filledStar: const Icon(Icons.star),
    unfilledStar: const Icon(Icons.star_border),
    halfStar: const Icon(Icons.star_half),
  );
}