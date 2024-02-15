class Item {
  final String imagePath;
  final String title;
  final String description;

  Item({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

List<Item> items = [
  Item(
    imagePath: 'assets/images/sign-in.png',
    title: 'Title 1',
    description: 'Description 1',
  ),
  Item(
    imagePath: 'assets/images/sign-up.png',
    title: 'Title 2',
    description: 'Description 2',
  ),
  Item(
    imagePath: 'assets/images/sign-up-verify.png',
    title: 'Title 3',
    description: 'Description 2',
  ),
  Item(
    imagePath: 'assets/images/sign-up-validate.png',
    title: 'Title 4',
    description: 'Description 2',
  ),
  Item(
    imagePath: 'assets/images/sign-up.png',
    title: 'Title 5',
    description: 'Description 5',
  ),
  // Tambahkan item sesuai kebutuhan
];
