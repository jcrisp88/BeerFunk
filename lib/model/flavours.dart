import "package:flutter/material.dart";

class GradientList {
  static const List<Color> red = [
    Color(0xFFDE5566),
    Color(0xFFF38269)
  ];
  static const List<Color> pink = [
    Color(0xFFFF6AA9),
    Color(0xFFA87EFC)
  ];
  static const List<Color> teal = [
    Color(0xFF59EF8F),
    Color(0xFF14D9DA)
  ];
  static const List<Color> green = [
    Color(0xFF5EEA6F),
    Color(0xFFF5D42A)
  ];
}

class Flavour {
  final String id;
  final String name;
  final String flavour;
  final String information;
  final List<String> relatedFlavours;
  final String image;
  final String flavourIcon;
  final List<Color> color;
  final List<String> flavourTypes;
  final List<String> chemicalTypes;
  final List<String> process;

  const Flavour({
    this.id,
    this.name,
    this.image,
    this.flavourIcon,
    this.color,
    this.flavour,
    this.information,
    this.relatedFlavours,
    this.flavourTypes,
    this.chemicalTypes,
    this.process,
  });
}

List<Flavour> flavours = [
  const Flavour(
      id: "1",
      name: "acetaldehyde",
      flavour: "acetaldehyde",
      information:
          "acetaldehyde is produced by yeast during fermentation. a positive note at low levels but an off-flavour at higher levels. it is indicative of fermentation problems or poor control of dissolved oxygen in packaging.",
      relatedFlavours: [
        "almond",
        "ethyl acetate",
        "ethyl hexanoate",
        "rancid oil",
        "bananas",
        "leathery",
        "grainy",
        "mashed potato",
        "papery"
      ],
      image: "assets/img/brush.png",
      flavourIcon: "assets/img/bacterial.png",
      color: GradientList.green,
      flavourTypes: [
        "chemical",
        "bacterial",
        "yeast-derived",
        "positive character",
        "off-flavour"
      ],
      chemicalTypes: ["aldehyde", "carbonyls"],
      process: ["fermentation / maturation", "package", "processing"],
      ),
  const Flavour(
      id: "2",
      name: "acetic acid",
      image: "assets/img/vinegar-bottle.png",
      flavourIcon: "assets/img/bacterial.png",
      color: GradientList.red,
      flavour: "acetic",
      relatedFlavours: [
        "acetaldehyde",
        "butyric",
        "ethyl acetate",
        "ethyl hexanoate",
        "isovaleric",
        "alkaline",
        "sweet",
        "salty",
        "caprylic"
      ],
      chemicalTypes: ["acid"],
      flavourTypes: [
        "bacterial",
        "microbiological spoilage",
        "yeast-derived",
        "off-flavour"
      ],
      process: ["fermentation / maturation", "package", "processing"],
      ),
  const Flavour(
      id: "3",
      name: "sodium bicarbonate",
      image: "assets/img/detergent.png",
      flavourIcon: "assets/img/bacterial.png",
      color: GradientList.teal,
      flavour: "alkaline",
      relatedFlavours: [
        "metallic",
        "leathery",
        "isovaleric",
        "papery",
        "caprylic",
        "salty",
        "sweet",
        "sulphitic"
      ],
      chemicalTypes: ["inorganics"],
      flavourTypes: ["chemical", "taint"],
      process: ["processing"],
      ),
  const Flavour(
      id: "4",
      name: "benzaldehyde",
      image: "assets/img/almond.png",
      flavourIcon: "assets/img/bacterial.png",
      color: GradientList.pink,
      flavour: "almond",
      relatedFlavours: [
        "acetaldehyde",
        "malty-buiscuity",
        "damascenone",
        "earthy",
        "honey",
        "smoky",
        "leathery",
        "grainy",
        "papery",
        "plastics"
      ],
      chemicalTypes: ["aldehydes", "carbonyls", "phenolics"],
      flavourTypes: ["chemical", "positive character", "off-flavour"],
      process: ["ingredients", "package", "processing"],
      ),
];
