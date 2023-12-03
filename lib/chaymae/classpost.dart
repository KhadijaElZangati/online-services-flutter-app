class postes {
  final String nom;
  final String photo;
  final String dat;
  final String imgP;
  final String mess;
  final int Nbcom;
  final int NbLike;

  postes({
    this.nom = '',
    this.photo = '',
    this.dat = '',
    this.imgP = '',
    this.mess = '',
    this.NbLike = 0,
    this.Nbcom = 0,
  });
}

final postes userpos1 = postes(
  nom: ' lina',
  photo: 'lib/images/5.jpg',
  dat: '10/10/2022',
  imgP: 'lib/images/5.jpg',
  mess: 'this is my friend ',
  NbLike: 5000,
  Nbcom: 345,
);
final postes userpos2 = postes(
  nom: 'fatima',
  photo: 'lib/images/5.jpg',
  dat: '10/11/2022',
  imgP: 'lib/images/5.jpg',
  mess: 'hello everyone  ',
  NbLike: 678,
  Nbcom: 567,
);
List<postes> post = [userpos1, userpos2];