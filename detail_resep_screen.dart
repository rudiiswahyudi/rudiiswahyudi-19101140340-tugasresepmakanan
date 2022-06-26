// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resep_cooking/providers/resep_provider.dart';

class DetailResepScreen extends StatefulWidget {
  final String? title;
  final String? id;
  const DetailResepScreen({this.title, this.id, Key? key}) : super(key: key);

  @override
  State<DetailResepScreen> createState() => _DetailResepScreenState();
}

class _DetailResepScreenState extends State<DetailResepScreen> {
//  final ResepDetailProvider _detailprovider = ResepDetailProvider();
  @override
  void initState() {
    // _detailprovider.setId(widget.id);
    // _provider.id = widget.id;
    // print(_provider.id);
    // _provider.ShowDetailResep(widget.id);
    // print(widget.id);
    // Provider.of<ResepDetailProvider>(context,listen: false).showDetailResep();
    super.initState();
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    // _provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  final res = Provider.of<ResepDetailProvider>(context,listen: false).showDetailResep(widget.id);
    //  print(res);

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Consumer<ResepProvider>(
        builder: (context, resepProvider, child) {
          return SingleChildScrollView(
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        "${resepProvider.detailResepModel.results!.thumb}"),
                    Text(
                      "${resepProvider.detailResepModel.results!.title}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 10.0),
                    Text(
                      "Porsi : ${resepProvider.detailResepModel.results!.servings}",
                      // style: GoogleFonts.montserrat(
                      // textStyle: TextStyle(
                      // fontSize: 20,
                    ),
                    // ),
                    // ),
                    const SizedBox(height: 10.0),
                    Text(
                        "Lama Pengerjaan : ${resepProvider.detailResepModel.results!.times}"),
                    const SizedBox(height: 10.0),
                    Text(
                        "Level Pengerjaan : ${resepProvider.detailResepModel.results!.dificulty}"),
                    const SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.user}"),
                    const SizedBox(height: 10.0),
                    Text(
                        "Penulis : ${resepProvider.detailResepModel.results!.author!.datePublished}"),
                    const SizedBox(height: 10.0),

                    Text(
                        "Deskripsi : ${resepProvider.detailResepModel.results!.desc}"),
                    const SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: resepProvider
                          .detailResepModel.results!.needItem!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Text(
                                // ignore: unnecessary_string_interpolations
                                "${resepProvider.detailResepModel.results!.needItem![index].itemName!}"),
                            Image.network(
                                // ignore: unnecessary_string_interpolations
                                "${resepProvider.detailResepModel.results!.needItem![index].thumbItem!}"),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                        "Bahan-Bahan : ${resepProvider.detailResepModel.results!.ingredient}"),

                    const SizedBox(height: 10.0),
                    const Text("STEP : "),
                    Text("${resepProvider.detailResepModel.results!.step}"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
