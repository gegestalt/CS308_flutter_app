import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imageList = [
  "https://image.shutterstock.com/image-vector/retro-styled-jazz-festival-poster-600w-315508430.jpg",
  "https://image.shutterstock.com/image-vector/guitar-on-dirty-background-600w-25688512.jpg",
  "https://image.shutterstock.com/image-photo/nashville-tenn-february-15-2020-600w-1663421932.jpg",
  "https://image.shutterstock.com/image-photo/miami-fl-usa-march-14-600w-1935839452.jpg",
  "https://image.shutterstock.com/image-photo/hipster-igen-teen-pretty-fashion-600w-1564166668.jpg",
];

Widget eventSlider() {
  return Container(
    margin: EdgeInsets.all(15),
    child: CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
        height: 300,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        reverse: false,
        aspectRatio: 5.0,
      ),
      itemBuilder: (context, i, id) {
        return GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white,
                )),
            //ClipRRect for image border radius
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageList[i],
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            // TODO: Redirect to events detailed page
            var url = imageList[i];
            print(url.toString());
          },
        );
      },
    ),
  );
}
