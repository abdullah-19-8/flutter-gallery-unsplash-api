import 'package:api_test/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gallery extends StatefulWidget {
  Gallery({Key? key}) : super(key: key);
  List<Map?> mainPhoto = [];

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  // ignore: prefer_typing_uninitialized_variables
  var urlData;
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?per_page=30&client_id=jys7uENafEvKSItn2upbUG9XL0OghqoEDTGSfRW0fvo'));
    if (response.statusCode == 200) {
      // stringResponse = response.body;
      setState(() {
        urlData = jsonDecode(response.body);
        //listResponse = urlData!['urls'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return urlData == null
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: 30,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 6,
              crossAxisCount: 3,
              crossAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        url: urlData[index]['urls']['full'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(urlData[index]['urls']['full']),
                      //fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
