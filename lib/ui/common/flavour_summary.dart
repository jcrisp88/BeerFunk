import 'package:flutter/material.dart';
import "dart:math" show pi;
import 'package:beer_funk_github/model/flavours.dart';
import 'package:beer_funk_github/ui/common/separator.dart';
import 'package:beer_funk_github/ui/detail/detail_page.dart';
import 'package:beer_funk_github/ui/text_style.dart';
import 'package:beer_funk_github/ui/common/bubbleParticles.dart';
import "package:beer_funk_github/ui/common/string_extension.dart";

import 'package:beer_funk_github/ui/common/pronounce.dart';

class FlavourSummary extends StatelessWidget {
  final Flavour flavour;
  final bool horizontal;

  FlavourSummary(this.flavour, {this.horizontal = true});

  FlavourSummary.vertical(this.flavour) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final flavourCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 50.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Text(flavour.name.capitalize(), style: Style.titleTextStyle),
          Container(height: horizontal ? 10.0 : 5),
          Separator(),
          Container(height: horizontal ? 15.0 : 5),
          Text(flavour.flavour.capitalize(), style: Style.subTitleTextStyle),
          horizontal ? SizedBox.shrink() : Pronounce(flavour.name),
        ],
      ),
    );

    final flavourThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "flavour-hero-${flavour.id}",
        child: Image(
          image: AssetImage(flavour.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    final flavourIconThumbnail = Positioned(
      bottom: horizontal ? -40 : -60,
      right: horizontal ? -40 : -60,
      child: Container(
        height: horizontal ? 140.0 : 200.0,
        width: horizontal ? 140.0 : 200.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(flavour.flavourIcon),
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.4), BlendMode.modulate),
          ),
        ),
      ),
    );

    final flavourCard = Stack(children: <Widget>[
      Transform.rotate(
        angle: -pi / 80.0,
        child: Container(
          height: horizontal ? 122.0 : 152.0,
          margin: horizontal
              ? EdgeInsets.only(left: 60.0)
              : EdgeInsets.only(top: 74.0),
          decoration: BoxDecoration(
            color: const Color(0x7A2F3135),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      Transform.rotate(
        angle: pi / 80.0,
        child: Container(
          height: horizontal ? 122.0 : 152.0,
          margin: horizontal
              ? EdgeInsets.only(left: 60.0)
              : EdgeInsets.only(top: 72.0),
          decoration: BoxDecoration(
            color: const Color(0xFFBFC0C3),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      Container(
        child: Stack(
          children: <Widget>[
            horizontal
                ? SizedBox.shrink()
                : Positioned.fill(child: Particles(16)),
            flavourIconThumbnail,
            flavourCardContent,
          ],
        ),
        height: horizontal ? 124.0 : 154.0,
        margin: horizontal
            ? EdgeInsets.only(left: 60.0)
            : EdgeInsets.only(top: 72.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: flavour.color,
            stops: [0.0, 1.5],
            begin: Alignment(-1.0, -3.0),
            end: Alignment(1.0, 3.0),
          ),
          // color: Color(0xFFC6CEC6),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
      ),
    ]);

    return GestureDetector(
      onTap: horizontal
          ? () => {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => DetailPage(flavour),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                  ),
                ),
                Scaffold.of(context).removeCurrentSnackBar()
              }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            flavourCard,
            flavourThumbnail,
          ],
        ),
      ),
    );
  }
}
