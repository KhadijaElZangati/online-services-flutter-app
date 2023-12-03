


class comUsers {
  final String nam;
  final String photo;
  final String comm;
  final String dat;

  comUsers({
    this.nam = '',
    this.photo = '',
    this.comm = '',
    this.dat = '',
  });
}

final comUsers user1 = comUsers(
  nam: 'fatima',
  photo: 'lib/images/5.jpg',
  comm: 'nice ',
  dat: '2days',
);
final comUsers user2 = comUsers(
  nam: 'mohammad',
  photo: 'lib/images/3.jpg',
  comm: 'nice',
  dat: '2heur',
);
final comUsers user3 = comUsers(
  nam: 'khadija',
  photo: 'lib/images/5.jpg',
  comm: 'nice ',
  dat: '2heur',
);
final comUsers user4 = comUsers(
  nam: 'chayma',
  photo: 'lib/images/2.jpg',
  comm: 'nice ',
  dat: '2heur',
);
final comUsers user5 = comUsers(
  nam: 'selayman',
  photo: 'lib/images/3.jpg',
  comm: 'nice ',
  dat: '2heur',
);
List<comUsers> comU = [user1, user2, user3, user4, user5];