class postes {
  final String nom;
  final String photo;
  final String dat;
  final String imgP;
  final String mess;

  postes({
    this.nom = '',
    this.photo = '',
    this.dat = '',
    this.imgP = '',
    this.mess = '',
  });
}

final postes userpos1 = postes(
  nom: 'mohamed',
  photo: 'https://pixlr.com/images/index/remove-bg.webp',
  dat: '10/10/2022',
  imgP: 'https://pixlr.com/images/index/remove-bg.webp',
  mess: 'this are my friend ',
);
final postes userpos2 = postes(
  nom: 'fatima',
  photo: 'https://pixlr.com/images/index/remove-bg.webp',
  dat: '10/11/2022',
  imgP: 'https://pixlr.com/images/index/remove-bg.webp',
  mess: 'hello every one  ',
);
List<postes> post = [userpos1, userpos2];