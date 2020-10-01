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

final List<User> onlineUsers = [
  users[0],
  users[1],
  users[2],
  users[3],
  users[4],
  users[5],
  users[6],
  users[7],
  users[8],
  users[9],
];

final List<Comment> comments = [
  Comment(
    id: 1,
    user: users[0],
    text:
        'Boa noite, conheço um amigo que está interessado, vou passar seu contato para ele',
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Boa noite Ed. um mais lindo que o outro!',
  ),
  Comment(
    id: 3,
    user: users[4],
    text: 'Olá, não vi, mas vou ficar de olho',
  ),
  Comment(
    id: 4,
    user: users[9],
    text:
        'Oi Carol, eu acho que vi um passeando sozinho na praça ontem, não sabia que tinha perdido',
  ),
  Comment(
    id: 5,
    user: users[8],
    text: 'Moro na Vila Barros, não cheguei a vê-lo',
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Acho que é da minha vizinha!!',
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Você tem um coração muito grande! Obrigado pelo seu trabalho!',
  ),
  Comment(
    id: 3,
    user: users[3],
    text: 'Boa noite, eu vi ele lá, mas não sei de quem é',
  ),
  Comment(
    id: 4,
    user: users[9],
    text: 'Nossa é da minha prima (o nome dele é Ted), vou avisá-la',
  ),
  Comment(
    id: 5,
    user: users[9],
    text: 'Boa noite, não sei :(',
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Que bonitinho!!',
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Não é meu, mas acho que conheço o dono!',
  ),
  Comment(
    id: 3,
    user: users[17],
    text: 'Boa noite, acho que vi o Teddy aqui na frente de casa!',
  ),
  Comment(
    id: 4,
    user: users[18],
    text: 'Nossa, ele sumiu? Tomara que encontrem!',
  ),
  Comment(
    id: 5,
    user: users[19],
    text: 'Muito triste, espero que ele volte',
  ),
  Comment(
    id: 5,
    user: users[9],
    text: 'Boa noite, encontrei o Teddy! Entrarei em contato',
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Que lindinho ele!',
  ),
];

final List<Post> posts = [
  Post(
      id: 1,
      user: onlineUsers[4],
      caption:
          'Bom dia a todos, esses cachorrinhos estão disponíveis para adoção.',
      timeAgo: '58m',
      imageUrl: 'https://images.unsplash.com/photo-1525253086316-d0c936c814f8',
      likes: [
        users[0],
        users[1],
        users[4],
        users[5],
        users[7],
        users[9],
      ],
      comments: [
        comments[0],
        comments[1]
      ]),
  Post(
    id: 2,
    user: onlineUsers[5],
    caption:
        'Boa dia pessoal, perdi meu cachorro anteontem no bairro Jardim Acapulco, é um Bull Terrier, pelo caramelo, estava com uma coleira azul e responde pelo nome de Pike, se alguém o encontrar, por favor, me avise.',
    timeAgo: '3hr',
    imageUrl: null,
    likes: [
      users[3],
      users[5],
      users[7],
      users[8],
      users[20],
    ],
    comments: [
      comments[2],
      comments[3],
      comments[4],
    ],
  ),
  Post(
    id: 3,
    user: onlineUsers[4],
    caption:
        'Boa noite pessoal, encontrei esse carinha, com coleira, perdido pela Avenida Sampaio Vidal, fiz a retirada do bichinho, dei banho e tosei, agora estou atrás do seu dono.',
    timeAgo: '8hr',
    imageUrl:
        'https://cdn.pixabay.com/photo/2015/02/21/10/39/dog-644111_960_720.jpg',
    // 'https://cdn.pixabay.com/photo/2016/11/29/09/58/adorable-1868871_960_720.jpg',
    likes: [
      users[2],
      users[3],
      users[4],
      users[6],
    ],
    comments: [
      comments[5],
      comments[6],
      comments[7],
      comments[8],
    ],
  ),
  Post(
    id: 4,
    user: onlineUsers[3],
    caption: 'Cachorrinho perdido na Vila Barros, alguém sabe quem é o dono?',
    timeAgo: '15hr',
    imageUrl:
        'https://uploads.metropoles.com/wp-content/uploads/2020/06/30172152/WhatsApp-Image-2020-06-30-at-17.20.55.jpeg',
    likes: [
      users[0],
      users[1],
      users[2],
    ],
    comments: [
      comments[9],
      comments[10],
    ],
  ),
  Post(
    id: 5,
    user: onlineUsers[0],
    caption:
        'Bom dia, achei um Pastor Alemão aqui na Praça Bom Jesus, já é um pouco velhinho e está sem coleira, é de alguém?',
    timeAgo: '1d',
    imageUrl:
        'https://www.clubeparacachorros.com.br/wp-content/uploads/2018/08/pastor-alemao-capa-preta.jpg',
    likes: [
      users[0],
      users[1],
      users[2],
      users[6],
      users[7],
    ],
    comments: [
      comments[11],
    ],
  ),
  Post(
    id: 6,
    user: onlineUsers[9],
    caption:
        'Boa noite, perdi meu cachorrinho, é um Pincher e responde pelo nome de Teddy.',
    timeAgo: '1d',
    imageUrl: 'https://cdn.los-animales.org/fotos/272478_451977-pincher.jpg',
    likes: [
      users[0],
      users[1],
      users[2],
      users[3],
      users[4],
      users[8],
      users[9],
    ],
    comments: [
      comments[12],
      comments[13],
      comments[14],
      comments[15],
      comments[16],
    ],
  ),
];
