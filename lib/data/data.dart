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
    name: 'Gabi Silva',
    imageUrl:
        'https://mulheresnacomputacao.files.wordpress.com/2015/06/10393788_1080772458615575_5207049209406099031_n.jpg',
    online: true,
  ),
  User(
    id: 3,
    name: 'João Matheus',
    imageUrl:
        'https://i.pinimg.com/736x/d7/c5/ce/d7c5ce78f4d69224078b017890d8cdad.jpg',
    online: true,
  ),
  User(
    id: 4,
    name: 'Sueli Santos',
    imageUrl:
        'https://storage.googleapis.com/adm-portal.appspot.com/_assets/modules/members/member_302177.jpg',
    online: true,
  ),
  User(
    id: 4,
    name: 'Juu Marconi',
    imageUrl:
        'https://i.pinimg.com/originals/cb/b0/00/cbb0000e57c945624cd6266e347b15c3.jpg',
    online: true,
  ),
  User(
    id: 5,
    name: 'Isabela Caroline',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t31.0-8/19577357_1421247004608563_7493214286214065239_o.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_eui2=AeGvtVYpozdpAoZc4VQmwFtFUB6y1Esa-oZQHrLUSxr6hqOJj0JJVn-ZV9H_Fea2Qzq46HfbMoyR_Xf0jb1uos8y&_nc_ohc=yS25gwC-yAwAX984iiV&_nc_ht=scontent.fmii1-1.fna&oh=c2c223b435663cf1916a95712c1e4962&oe=5F992253',
    online: true,
  ),
  User(
    id: 6,
    name: 'Samuka Felix',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/80957387_2619366884843131_689800828961161216_o.jpg?_nc_cat=110&_nc_sid=174925&_nc_eui2=AeFCHqPh_1V2FT5-tb4h1W04I-lwuMCEOIgj6XC4wIQ4iGZqWrGMNA8rvxX654PbeM-Dqz6LlT1YmPgO_rkHiXB5&_nc_ohc=qMfMx0VR8OkAX97QDaM&_nc_ht=scontent.fmii1-1.fna&oh=05e464428fe11706c8175842efc26b2e&oe=5F972630',
    online: true,
  ),
  User(
    id: 7,
    name: 'Alicia Angélica',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/37106270_1842309829164137_9145103778372911104_o.jpg?_nc_cat=107&_nc_sid=174925&_nc_eui2=AeHpgxpj66g2s0dbUBGFnGfx52iG9_fI3tnnaIb398je2aLVIRe-5NAi7_QIe_IvE6x3Q5eKztntArAhJp2tKbcT&_nc_ohc=axbkdOEdRwwAX-eRm3O&_nc_oc=AQntgivb-RCyGjbUZuEOwAlW1qyUoZE8_FGRPqxMnIRazCDwPYmfq84i-rugr8DEkLw&_nc_ht=scontent.fmii1-1.fna&oh=7da0a26e53bca104969b1c4d83aae554&oe=5F99F44D',
    online: true,
  ),
  User(
    id: 8,
    name: 'Rapha Soutto',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/104463978_823337441407342_3523085264433835142_o.jpg?_nc_cat=102&_nc_sid=09cbfe&_nc_eui2=AeHbEiDAdVQtyz8pbocp0wO5MdvhVoy08Y8x2-FWjLTxj_3jebiT5JAT1S5ok6rNv0St44HIVuzu90ePy5SmpGUo&_nc_ohc=vBt_tW8AXVgAX8wL2I9&_nc_ht=scontent.fmii1-1.fna&oh=a760e986eb19abd7fd5b289ed8f783b0&oe=5F9798AE',
    online: true,
  ),
  User(
    id: 9,
    name: 'Maria Domingues',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/60582603_2699089460105499_3826020583116636160_o.jpg?_nc_cat=104&_nc_sid=174925&_nc_eui2=AeFHFbCaBfMgsSp14D_OXpxGA437HhgheP4DjfseGCF4_gp3wPBGwqciJOCY8ejx0LsIRXrH66O2IPIPNYN8cuRE&_nc_ohc=aEFbhT3AFSEAX_uMg4Y&_nc_ht=scontent.fmii1-1.fna&oh=5a4a7a1c862f040e204a5ca7fffd3465&oe=5F99D2A3',
    online: true,
  ),
  User(
    id: 10,
    name: 'Juuh Santos',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/11188345_638686579566008_6188880440867949561_n.jpg?_nc_cat=101&_nc_sid=174925&_nc_eui2=AeG93M9nJr4Wm_yXhe36P2q9Kb0LGlsZEropvQsaWxkSumtR9BewSXJHHqL_l8abt2PQbxvgOYMxi9QEaa7DE0sS&_nc_ohc=k8R2nH28RA8AX99vChj&_nc_ht=scontent.fmii1-1.fna&oh=7c6bcac8f3a19d8bad2230accd66ba88&oe=5F978C44',
    online: true,
  ),
  User(
    id: 11,
    name: 'Alisson Matheus',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/38052299_1728802873903575_8867929927941357568_n.jpg?_nc_cat=101&_nc_sid=174925&_nc_eui2=AeHI2jfKV1lxufXncnhic7tkYucgJAcvB05i5yAkBy8HTlMsbMgX99BkoZ0cTPIQaA-toyxDo6NTr7O6BzLTA7KH&_nc_ohc=qT5vHBtx4VcAX8ZsokI&_nc_ht=scontent.fmii1-1.fna&oh=ee4d94013a1c8688e1f5ea136b4be43f&oe=5F981FD9',
    online: true,
  ),
  User(
    id: 12,
    name: 'Milena Rodrigues',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/95491916_1575131009313848_1515088888060706816_o.jpg?_nc_cat=108&_nc_sid=09cbfe&_nc_eui2=AeHpDSFCjyFxjdpZqKZg-3JBtIT5kpdKI4a0hPmSl0ojhu5I4HKRUvShuEf1PsvtKqcRL_ph7CKADyXHD_2hy_Ol&_nc_ohc=5OAXcRaRkhYAX9WkaaY&_nc_ht=scontent.fmii1-1.fna&oh=4d1c3b9157ed80ba29596e5fa1ca6444&oe=5F964DC7',
    online: true,
  ),
  User(
    id: 13,
    name: 'Moisés Munhoz',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/37695156_2089356911382348_6301926846799806464_n.jpg?_nc_cat=102&_nc_sid=174925&_nc_eui2=AeEy3tnEf_T3svU2QmwAcCwaAR_orT-z9CcBH-itP7P0Jz-3UUsVU1twYo44Sr36MK6vxI2SbfWE1NIgL0VmYoy2&_nc_ohc=jaD5eJdeyIkAX-rZ5CQ&_nc_ht=scontent.fmii1-1.fna&oh=1f6065a2c853366302d70431d99ba538&oe=5F970FF1',
    online: true,
  ),
  User(
    id: 14,
    name: 'Yasmin Kiyota',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/120073280_1021735661599224_4410622717546178014_n.jpg?_nc_cat=100&_nc_sid=09cbfe&_nc_eui2=AeFg4H1T2E82r2XyGWiKHrQkEMoQyFcCwlQQyhDIVwLCVD9RKv74BSjNYX1ilBZavzKVXQOU3VV-5bAz34ru3qt2&_nc_ohc=DGF7yZg5GgEAX_GBDzw&_nc_ht=scontent.fmii1-1.fna&oh=e3d922c86200bb2e4c0b586d83673bb4&oe=5F97BD0C',
    online: true,
  ),
  User(
    id: 15,
    name: 'Tony',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/59580193_10214200669679992_6949628771397795840_n.jpg?_nc_cat=103&_nc_sid=174925&_nc_eui2=AeES7vXaZh78Vdo6AGdxKLYrXZh6MCymT2NdmHowLKZPY-Uot3PR3nwKbTTtnssJ2ivbzUO-XvF3hnY3wdHalfp-&_nc_ohc=EQqaN9lwOV4AX_kA5aJ&_nc_ht=scontent.fmii1-1.fna&oh=73a16ad2fa773793ab67f0c18b3f7a24&oe=5F97D042',
    online: true,
  ),
  User(
    id: 16,
    name: 'Amanda Azevedo',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/116886843_3037779743011133_872329747789045192_n.jpg?_nc_cat=104&_nc_sid=09cbfe&_nc_eui2=AeG4gcNj1Tichfh7nMvBCXMn_Yg0HzYsbTT9iDQfNixtNMeD7GHcvqjLuu62n8xBynvOo4kkCuJOAAyErx-nIlQX&_nc_ohc=OkXh13JfHVAAX_7zUgM&_nc_ht=scontent.fmii1-1.fna&oh=250476a9c5c7d0b178abe6c37caf3f7a&oe=5F97877A',
    online: true,
  ),
  User(
    id: 17,
    name: 'Ryan Rizzo',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t31.0-8/14612589_1159449474145423_1407044349782314940_o.jpg?_nc_cat=108&_nc_sid=174925&_nc_eui2=AeG-rgoq_gx2hlCC4-BDoejD_ISm_zOCPwH8hKb_M4I_AX_nlaV3ljbJBTNLVX5iS26KiZ3C2sjUcC_en9WEnKmb&_nc_ohc=eM2-vJh0Cv0AX8rOst8&_nc_ht=scontent.fmii1-1.fna&oh=65d38d50bea06cee7c726768daf9265d&oe=5F99D818',
    online: true,
  ),
  User(
    id: 18,
    name: 'André Ferrari',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/70810815_100908557969563_5324167594721148928_o.jpg?_nc_cat=106&_nc_sid=09cbfe&_nc_eui2=AeEf7xyNwaS-siex0iYnCI308qSwa79tTifypLBrv21OJ3WjUJ8nR4WhriSPYUEcQnKrd6UkzFCOBZUTYAiEveKs&_nc_ohc=C4eb0a03Gi8AX-NrSTx&_nc_ht=scontent.fmii1-1.fna&oh=b4f973643a394e97f4245d466d4ee7af&oe=5F998CAB',
    online: true,
  ),
  User(
    id: 19,
    name: 'Amarilis Moura',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/107375720_748022626002918_5644808192835774219_n.jpg?_nc_cat=109&_nc_sid=09cbfe&_nc_eui2=AeG80ugylNduYuaMwAh-0AuSQgnE5HIuDDhCCcTkci4MOICrFHQYT-chBbwxbEoSzpXqJd5_F0DMEN9Gw_dKz0PW&_nc_ohc=yWOkw3ifxK8AX9tyN7a&_nc_ht=scontent.fmii1-1.fna&oh=1bf1befd9c4c08a445450cebe5681daf&oe=5F96EAFC',
    online: true,
  ),
  User(
    id: 20,
    name: 'Matheus Bonore',
    imageUrl:
        'https://scontent.fmii1-1.fna.fbcdn.net/v/t1.0-9/99055632_158647448972525_3629662387809812480_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_nc_eui2=AeHajo3yf1fCROe4MteHrRrBIKdKp4s4waMgp0qnizjBo7MnxA-6cI4SnPQZ4XmUsiQJ1THSIAOln5GeoKSM9EN6&_nc_ohc=6Wx4ydi0rf0AX8izhdc&_nc_ht=scontent.fmii1-1.fna&oh=788d3f5ff69746403576f0ebc6571e3d&oe=5F988AAE',
    online: true,
  ),
];

final User currentUser = users[0];

final List<Pet> pets = [
  Pet(
    id: 1,
    user: users[2],
    timeAgo: '58m',
    category: Category.donation,
    name: 'Pupper Katherine',
    imageUrl:
        'https://www.petlove.com.br/dicas/wp-content/uploads/2018/07/pug-peitoral-1280x720.jpg',
    description: 'French black puppy',
    age: 2,
    sex: 'Female',
    color: 'Black',
    specie: Species.dog,
    location: 'Marília - SP',
  ),
  Pet(
    id: 2,
    user: users[2],
    timeAgo: '58m',
    category: Category.find,
    name: 'Pupper Katherine',
    imageUrl:
        'https://www.acritica.com/uploads/news/image/735445/show_cachorro.jpg',
    description: 'French black puppy',
    age: 2,
    sex: 'Female',
    color: 'Black',
    specie: Species.dog,
    location: 'Marília - SP',
  ),
  Pet(
    id: 3,
    user: users[2],
    timeAgo: '58m',
    category: Category.lost,
    name: 'Pupper Katherine',
    imageUrl:
        'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/08/cachorro_hyunday___.jpg',
    description: 'French black puppy',
    age: 2,
    sex: 'Female',
    color: 'Black',
    specie: Species.dog,
    location: 'Marília - SP',
  ),
];

final List<Comment> comments = [
  Comment(
    id: 1,
    user: users[0],
    text:
        'Boa noite, conheço um amigo que está interessado, vou passar seu contato para ele',
    likes: [],
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Boa noite Ed. um mais lindo que o outro!',
    likes: [],
  ),
  Comment(
    id: 3,
    user: users[4],
    text: 'Olá, não vi, mas vou ficar de olho',
    likes: [],
  ),
  Comment(
    id: 4,
    user: users[9],
    text:
        'Oi Carol, eu acho que vi um passeando sozinho na praça ontem, não sabia que tinha perdido',
    likes: [],
  ),
  Comment(
    id: 5,
    user: users[8],
    text: 'Moro na Vila Barros, não cheguei a vê-lo',
    likes: [],
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Acho que é da minha vizinha!!',
    likes: [],
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Você tem um coração muito grande! Obrigado pelo seu trabalho!',
    likes: [],
  ),
  Comment(
    id: 3,
    user: users[3],
    text: 'Boa noite, eu vi ele lá, mas não sei de quem é',
    likes: [],
  ),
  Comment(
    id: 4,
    user: users[9],
    text: 'Nossa é da minha prima (o nome dele é Ted), vou avisá-la',
    likes: [],
  ),
  Comment(
    id: 5,
    user: users[9],
    text: 'Boa noite, não sei :(',
    likes: [],
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Que bonitinho!!',
    likes: [],
  ),
  Comment(
    id: 2,
    user: users[20],
    text: 'Não é meu, mas acho que conheço o dono!',
    likes: [],
  ),
  Comment(
    id: 3,
    user: users[17],
    text: 'Boa noite, acho que vi o Teddy aqui na frente de casa!',
    likes: [],
  ),
  Comment(
    id: 4,
    user: users[18],
    text: 'Nossa, ele sumiu? Tomara que encontrem!',
    likes: [],
  ),
  Comment(
    id: 5,
    user: users[19],
    text: 'Muito triste, espero que ele volte',
    likes: [],
  ),
  Comment(
    id: 5,
    user: users[9],
    text: 'Boa noite, encontrei o Teddy! Entrarei em contato',
    likes: [],
  ),
  Comment(
    id: 1,
    user: users[0],
    text: 'Que lindinho ele!',
    likes: [],
  ),
];

final List<Post> posts = [
  Post(
      id: 1,
      user: users[4],
      pet: pets[1],
      caption:
          'Bom dia a todos, esses cachorrinhos estão disponíveis para adoção.',
      timeAgo: '58m',
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
    user: users[5],
    pet: pets[2],
    caption:
        'Boa dia pessoal, perdi meu cachorro anteontem no bairro Jardim Acapulco, é um Bull Terrier, pelo caramelo, estava com uma coleira azul e responde pelo nome de Pike, se alguém o encontrar, por favor, me avise.',
    timeAgo: '3hr',
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
    user: users[4],
    pet: pets[2],
    caption:
        'Boa noite pessoal, encontrei esse carinha, com coleira, perdido pela Avenida Sampaio Vidal, fiz a retirada do bichinho, dei banho e tosei, agora estou atrás do seu dono.',
    timeAgo: '8hr',
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
    user: users[3],
    pet: pets[0],
    caption: 'Cachorrinho perdido na Vila Barros, alguém sabe quem é o dono?',
    timeAgo: '15hr',
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
    user: users[0],
    pet: pets[0],
    caption:
        'Bom dia, achei um Pastor Alemão aqui na Praça Bom Jesus, já é um pouco velhinho e está sem coleira, é de alguém?',
    timeAgo: '1d',
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
    user: users[9],
    pet: pets[2],
    caption:
        'Boa noite, perdi meu cachorrinho, é um Pincher e responde pelo nome de Teddy.',
    timeAgo: '1d',
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
