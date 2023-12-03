class User {
  final int id;
  final String name;
  final String imageUrl;

  User({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
  });
}

final User currentUser = User(
  id: 0,
  name: 'mohamad',
  imageUrl: 'images/3.jpg',
);
final User fatima = User(
  id: 1,
  name: 'fatima',
  imageUrl: 'images/5.jpg',
);
final User khadija = User(
  id: 2,
  name: 'khadija',
  imageUrl: 'images/2.jpg',
);
final User chayma = User(
  id: 3,
  name: 'chayma',
  imageUrl: 'images/3.jpg',
);
final User noura = User(
  id: 4,
  name: 'noura',
  imageUrl: 'images/5.jpg',
);
final User selayman = User(
  id: 5,
  name: 'selayman',
  imageUrl: 'images/2.jpg',
);
List<User> favorites = [currentUser, fatima, khadija, chayma, noura, selayman];