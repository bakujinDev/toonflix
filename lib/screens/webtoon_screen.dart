import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_serivces.dart';

class WebtoonScreen extends StatelessWidget {
  WebtoonScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "오늘의 웹툰  ",
          style: GoogleFonts.dongle(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: ((context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        );
      }),
      separatorBuilder: (context, index) {
        return const SizedBox(width: 40);
      },
    );
  }
}
