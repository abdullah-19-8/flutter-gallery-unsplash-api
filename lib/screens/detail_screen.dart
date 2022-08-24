import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var url;
  DetailScreen({Key? key, this.url}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  _save() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      var response = await Dio()
          .get(widget.url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: "hello");
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * .8,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.url),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Favourite'),
              ),
              ElevatedButton(
                onPressed: () {
                  _save();
                  Navigator.pop(context);
                },
                child: const Text('Download'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
