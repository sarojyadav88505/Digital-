import 'dart:convert';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:digitization/Api/api.dart';
import 'package:digitization/const/const.dart';

import 'package:flutter/material.dart';

import 'loading_effect.dart';

Widget carousel(BuildContext context) {
  Future getSlide() async {
    var response = await Api().getData('slide');
    var data = json.decode(response.body);
    return data;
  }

  return FutureBuilder(
      future: getSlide(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data == null
            ? Center(
                child: loadingEffect(),
              )
            : SizedBox(
                height: 160.0,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomLeft,
                  dotSize: 0.5,
                  dotSpacing: 10,
                  animationDuration: const Duration(seconds: 1),
                  images: [
                    Image.network(
                      url + snapshot.data[0]['image'],
                      fit: BoxFit.scaleDown,
                      scale: 1.0,
                    ),
                    Image.network(url + snapshot.data[1]['image'],
                        fit: BoxFit.cover),
                    Image.network(url + snapshot.data[2]['image'],
                        fit: BoxFit.cover),
                    Image.network(url + snapshot.data[3]['image'],
                        fit: BoxFit.cover),
                    Image.network(url + snapshot.data[4]['image'],
                        fit: BoxFit.cover),
                  ],
                ),
              );
      });
}
