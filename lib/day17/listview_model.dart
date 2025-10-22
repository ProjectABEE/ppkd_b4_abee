import 'package:flutter/material.dart';
import 'package:ppkd_b4_abee/day17/constant/appimage.dart';
import 'package:ppkd_b4_abee/day17/extension/rupiah.dart';
import 'package:ppkd_b4_abee/day17/models/buahmodel.dart';

class ListViewModel extends StatefulWidget {
  const ListViewModel({super.key});

  @override
  State<ListViewModel> createState() => _ListViewModelState();
}

class _ListViewModelState extends State<ListViewModel> {
  final List<SayurModel> namaSayur = [
    SayurModel(
      name: "Bayam",
      price: 100,
      condition: "Segar",
      image: AppImages.bayam,
    ),
    SayurModel(
      name: "Brokoli",
      price: 100,
      condition: "Segar",
      image: AppImages.brokoli,
    ),
    SayurModel(
      name: "Buncis",
      price: 100,
      condition: "Segar",
      image: AppImages.buncis,
    ),
    SayurModel(
      name: "Kangkung",
      price: 100,
      condition: "Segar",
      image: AppImages.kangkung,
    ),
    SayurModel(
      name: "Kubis",
      price: 100,
      condition: "Segar",
      image: AppImages.kubis,
    ),
    SayurModel(
      name: "paprika",
      price: 100,
      condition: "Segar",
      image: AppImages.paprika,
    ),
    SayurModel(
      name: "Sawi",
      price: 100,
      condition: "Segar",
      image: AppImages.sawi,
    ),
    SayurModel(
      name: "Selada",
      price: 100,
      condition: "Segar",
      image: AppImages.selada,
    ),
    SayurModel(
      name: "Seledri",
      price: 100,
      condition: "Segar",
      image: AppImages.seledri,
    ),
    SayurModel(
      name: "Wortel",
      price: 100,
      condition: "Segar",
      image: AppImages.wortel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("List Sayur:", style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: namaSayur.length,
              itemBuilder: (BuildContext context, int index) {
                final item = namaSayur[index];
                return ListTile(
                  onTap: () {},
                  leading: Image.asset(item.image, width: 60),
                  title: Text(item.name),
                  subtitle: Text(item.price.toString().toRPCurrency()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
