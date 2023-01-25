import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: Get.width,
            height: 80,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      const SizedBox(
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          child: Text(
                            "H",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4ED442),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hallo, Hamzah!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Image.asset("assets/icons/award.png"),
                          const Text(
                            "+1600",
                            style: TextStyle(
                              color: Color(0xFFFCD034),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            " Points",
                            style: TextStyle(
                              color: Color(0xFFFCD034),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: Image.asset(
                          "assets/icons/notification.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEC5F5F),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  StoryItem(),
                  StoryItem(),
                  StoryItem(),
                  StoryItem(),
                  StoryItem(),
                  StoryItem(),
                  StoryItem(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Text(
                  "Upcoming ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "course of this week",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: const [
                  CategoryItem(
                    title: "All",
                    status: true,
                  ),
                  CategoryItem(
                    title: "UI/UX",
                    status: false,
                  ),
                  CategoryItem(
                    title: "Illustrations",
                    status: false,
                  ),
                  CategoryItem(
                    title: "3D Animations",
                    status: false,
                  ),
                  CategoryItem(
                    title: "Programmer",
                    status: false,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            color: Colors.blue[100],
            child: Column(
              children: [
                CarouselSlider(
                  items: imageSliders,
                  carouselController: controller.carouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      controller.current.value = index;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map(
                    (entry) {
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: Obx(
                          () => Container(
                            width: 15,
                            height: 10,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            color: controller.current.value == entry.key
                                ? const Color(0xFFEC5F5F)
                                : const Color(0XFFEEEEEE),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final List<Widget> imageSliders = imgList
    .map(
      (item) => Container(
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(item, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    .toList();

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.status})
      : super(key: key);

  final String title;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:
            status == true ? const Color(0xFFEC5F5F) : const Color(0xFFF6F7FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: status == true ? Colors.white : const Color(0xFF9D9FA0),
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFEC5F5F),
                width: 5,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(6),
              width: Get.width * 0.15,
              height: Get.width * 0.15,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/images/avatar-1.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("assets/icons/live_circle.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
