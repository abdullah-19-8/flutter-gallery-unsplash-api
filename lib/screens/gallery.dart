import 'package:api_test/models/data.dart';
// import 'package:api_test/detail_screen.dart';
import 'package:api_test/services/fitch_data.dart';
import 'package:flutter/material.dart';

import 'detail_screen.dart';

// ignore: must_be_immutable
class Gallery extends StatefulWidget {
  Gallery({Key? key}) : super(key: key);
  List<Map?> mainPhoto = [];

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // ignore: prefer_typing_uninitialized_variables
  // var urlData;
  // Future apicall() async {
  //   http.Response response;
  //   response = await http.get(Uri.parse(
  //       'https://api.unsplash.com/photos/?per_page=30&client_id=jys7uENafEvKSItn2upbUG9XL0OghqoEDTGSfRW0fvo'));
  //   if (response.statusCode == 200) {
  //     // stringResponse = response.body;
  //     setState(() {
  //       urlData = jsonDecode(response.body);
  //       //listResponse = urlData!['urls'];
  //     });
  //   }
  // }

  // @override
  // void initState() {
  //   apicall();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    FitchData fitchData = FitchData();
    return FutureBuilder<Post>(
      future: fitchData.apicall(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? GridView.builder(
                itemCount: snapshot.data!.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            url: snapshot.data!.results[index].urls.full
                                .toString(),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot
                              .data!.results[index].urls.full
                              .toString()),
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
