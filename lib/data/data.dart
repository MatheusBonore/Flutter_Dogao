import 'package:flutter_dogao/models/models.dart';

final List<User> users = [
  User(
    id: 1,
    name: 'Fellipe Emanuel',
    imageUrl: 'https://clube.spm.pt/files/clube/outros/foto_helder_pinto.jpg',
    online: true,
  ),
  User(
    id: 2,
    name: 'Maria Domingues',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/60582603_2699089460105499_3826020583116636160_o.jpg?_nc_cat=104&_nc_sid=174925&_nc_eui2=AeFHFbCaBfMgsSp14D_OXpxGA437HhgheP4DjfseGCF4_gp3wPBGwqciJOCY8ejx0LsIRXrH66O2IPIPNYN8cuRE&_nc_ohc=aEFbhT3AFSEAX_uMg4Y&_nc_ht=scontent.fmii1-1.fna&oh=5a4a7a1c862f040e204a5ca7fffd3465&oe=5F99D2A3',
    online: true,
  ),
  User(
    id: 3,
    name: 'Matheus Henrique Conceição Bonore',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/99055632_158647448972525_3629662387809812480_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeHajo3yf1fCROe4MteHrRrBIKdKp4s4waMgp0qnizjBo7MnxA-6cI4SnPQZ4XmUsiQJ1THSIAOln5GeoKSM9EN6&_nc_ohc=6Wx4ydi0rf0AX8izhdc&_nc_ht=scontent.fmii1-1.fna&oh=788d3f5ff69746403576f0ebc6571e3d&oe=5F988AAE',
    online: false,
  ),
];

final User currentUser = users[0];

final List<Comment> comments = [
  Comment(
    id: 1,
    user: users[1],
    text: 'Como ele está lindo!!',
    likes: [
      users[0],
    ],
  ),
];

final List<Post> posts = [
  Post(
    id: 1,
    user: users[0],
    caption: 'Chegou a hora de passear no parque!!',
    timeAgo: '58m',
    imageUrl:
        'https://cdn.pixabay.com/photo/2015/02/21/10/39/dog-644111_960_720.jpg',
    // 'https://cdn.pixabay.com/photo/2016/11/29/09/58/adorable-1868871_960_720.jpg',
    likes: [
      users[1],
      users[2],
    ],
    comments: [
      comments[0],
    ],
  ),
  Post(
    id: 2,
    user: users[2],
    caption: 'Como negar comida pra esse animal lindo.',
    timeAgo: '1h',
    imageUrl:
        'https://cdn.pixabay.com/photo/2013/11/09/23/27/bernese-mountain-dog-208092_960_720.jpg',
    likes: [
      users[0],
      users[1],
    ],
    comments: [],
  ),
];
