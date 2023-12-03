class UserH {
  final int id;
  final String name;
  final String imageUrl;

  UserH({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
  });
}

final UserH currentUserR = UserH(
  id: 0,
  name: 'mohamad',
  imageUrl: 'images/3.jpg',
);
final UserH fatima = UserH(
  id: 1,
  name: 'fatima',
  imageUrl: 'images/5.jpg',
);
final UserH khadija = UserH(
  id: 2,
  name: 'khadija',
  imageUrl: 'images/2.jpg',
);
final UserH chayma = UserH(
  id: 3,
  name: 'chayma',
  imageUrl: 'images/3.jpg',
);
final UserH noura = UserH(
  id: 4,
  name: 'noura',
  imageUrl: 'images/5.jpg',
);
final UserH selayman = UserH(
  id: 5,
  name: 'selayman',
  imageUrl: 'images/2.jpg',
);
List<UserH> favorites = [currentUserR, fatima, khadija, chayma, noura, selayman];