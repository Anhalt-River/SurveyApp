// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
class Survey {
  String? id;
  String? title;
  List<String>? variants;
  List<int>? voices;
  String? description;
  String? city;
  int? isVoited;
  String severity;
  String offeredUserEmail;

  Survey(
      {this.id,
      this.title,
      this.variants,
      this.voices,
      this.description,
      this.city,
      this.isVoited,
      required this.offeredUserEmail,
      required this.severity});
}

List<Survey> surveys = <Survey>[
  Survey(
      offeredUserEmail: "unnamed",
      id: "1",
      title: 'Вопрос о состоянии жилья №10',
      city: 'Kazan',
      severity: "1",
      isVoited: 0,
      description: 'normal survey',
      variants: ['good', 'normal', 'bad'],
      voices: [2, 3, 1]),
  Survey(
      offeredUserEmail: "unnamed",
      id: "2",
      title: 'Вопрос о состоянии жилья №2',
      city: 'Kazan',
      severity: "2",
      isVoited: 0,
      description: 'normal survey',
      variants: ['good', 'normal', 'bad'],
      voices: [2, 3, 1]),
  Survey(
      offeredUserEmail: "unnamed",
      id: "3",
      isVoited: 0,
      title: 'Вопрос о состоянии жилья №1',
      city: 'Saint Petersburg',
      severity: "2",
      description: 'abstract survey',
      variants: ['good', 'normal', 'bad'],
      voices: [2, 3, 1]),
  Survey(
      offeredUserEmail: "unnamed",
      isVoited: 0,
      id: "4",
      title: 'Снос памятника Колчаку',
      city: 'Moscow',
      severity: "1",
      description: 'normal survey',
      variants: ['good', 'normal', 'bad'],
      voices: [2, 3, 1]),
  Survey(
      offeredUserEmail: "unnamed",
      isVoited: 0,
      id: "5",
      title: 'Продажа министра образования китайцам',
      severity: "4",
      description: 'Предлагаю продать нашего дорогого министра китайцам!',
      variants: ['ffff', 'dddd', 'ssss'],
      voices: [2, 2, 2]),
  Survey(
      offeredUserEmail: "unnamed",
      isVoited: 0,
      id: "6",
      title: 'Покупка мерседес для министра образования',
      severity: "3",
      description:
          'Предлагаю закупить мерседес на нужды нашего дорогого министра!',
      variants: ['good', 'normal', 'bad'],
      voices: [0, 0, 0]),
  Survey(
      offeredUserEmail: "unnamed",
      isVoited: 0,
      id: "7",
      title: 'Снижение налогов',
      severity: "5",
      description: 'Предлагаю снизить налоги! на богатых)',
      variants: ['good', 'normal', 'bad'],
      voices: [2, 3, 1]),
];



// class DealsPage extends StatefulWidget {
//   final String searchText;
//   const DealsPage(this.searchText, {super.key});

//   @override
//   State<DealsPage> createState() => _DealsPageState();
// }

// class _DealsPageState extends State<DealsPage> {
//   Widget buildList(context, docs) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ListTile(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         title: Text(
//           docs['title'],
//         ),
//         subtitle: Text(
//           docs['description'],
//         ),
//         leading: docs['image'] == null || docs['image'] == ""
//             ? const Icon(Icons.closed_caption_disabled_sharp)
//             : Image.network(docs['image']),
//         trailing: const Icon(
//           Icons.arrow_right,
//           color: Colors.black,
//         ),
//         onTap: () {
//           Navigator.push(context, CupertinoPageRoute(
//             builder: (context) {
//               var deal = Survey(
//                   docs.id,
//                   docs['title'],
//                   docs['variants'],
//                   docs['voices'],
//                   docs['description'],
//                   docs['city'],
//                   docs['severity']);
//               return AddDeal('Изменить/удалить', deal, true);
//             },
//           ));
//         },
//       ),
//     );
//   }

// String id;
//   String? title;
//   List<String>? variants;
//   List<int>? voices;
//   String? description;
//   String? city;
//   String severity;

//   Survey(
//       {this.id,
//       this.title,
//       this.variants,
//       this.voices,
//       this.description,
//       this.city,
//       required this.severity});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection("surveys").snapshots(),
//       builder: (context, AsyncSnapshot<dynamic> snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(
//             child: CircularProgressIndicator(color: Colors.white),
//           );
//         } else {
//           var list = snapshot.data.docs
//               .where((x) => x['title']
//                       .toLowerCase()
//                       .contains(widget.searchText.toLowerCase())
//                   ? true
//                   : false)
//               .toList();
//           return ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             itemCount: list.length,
//             itemBuilder: (context, index) => buildList(
//               context,
//               list[index],
//             ),
//           );
//         }
//       },
//     );
//   }
// }
