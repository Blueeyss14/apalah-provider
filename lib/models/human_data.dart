class Human {
  String name;
  String description;
  int value;
  bool check;
  String image;

  Human({
    required this.name,
    required this.description,
    required this.value,
    required this.check,
    required this.image,
  });

  static List<Human> dataHuman() {
    return [
      Human(
          name: "Lauren",
          description: "description",
          value: 99,
          check: false,
          image: "https://picsum.photos/id/${1 + 237}/1000/2000"),
      Human(
          name: "Mauren",
          description: "description",
          value: 97,
          check: false,
          image: "https://picsum.photos/id/${2 + 237}/1000/2000"),
      Human(
          name: "Felicia",
          description: "description",
          value: 86,
          check: false,
          image: "https://picsum.photos/id/${3 + 237}/1000/2000"),
      Human(
          name: "Michell",
          description: "description",
          value: 95,
          check: false,
          image: "https://picsum.photos/id/${4 + 237}/1000/2000"),
    ];
  }
}
