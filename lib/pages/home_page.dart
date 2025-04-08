import 'package:badges/badges.dart' as badges;
import 'package:e_book/json/home_json.dart';
import 'package:e_book/pages/book_detail_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, k",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Container(
                  width: size.width * 0.8,
                  height: 40,
                  decoration: BoxDecoration(
                    color: grey.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search..."),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: primary,
                    ),
                    badgeContent: Text(
                      "3",
                      style: TextStyle(color: white),
                    ),
                    child: Icon(
                      LineIcons.shoppingBag,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            getSectionQuote(),
            SizedBox(height: 30),
            getSectionReadyToday(),
            SizedBox(height: 30),
            getSpecialForYou(),
          ],
        ),
      ),
    );
  }

  Widget getSectionQuote() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primary.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Quote of the day",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "I'd rather have roses on the table than diamonds on the necks",
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Emma Goldman",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getSectionReadyToday() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ready Today",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(readyToday),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Top 10 books for self-development",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Wrap(
          runSpacing: 10,
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: tags[index]["color"],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Text(
                  tags[index]["label"],
                  style: TextStyle(fontSize: 12, color: white),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getSpecialForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Special for you",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(specialForYouJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                                img: specialForYouJson[index]["img"],
                                title: specialForYouJson[index]["title"],
                                subTitle: specialForYouJson[index]["sub_title"],
                                price: specialForYouJson[index]["price"],
                                page: specialForYouJson[index]["page"],
                                authorName: specialForYouJson[index]
                                    ["author_name"],
                                rate:
                                    specialForYouJson[index]["rate"].toString(),
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                    specialForYouJson[index]["img"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: black.withValues(alpha: 0.2)),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                specialForYouJson[index]["favourite"]
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                              top: 100,
                              child: Container(
                                width: 65,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "\$${specialForYouJson[index]["price"]}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]["title"],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]["sub_title"],
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 13,
                            color: black.withValues(alpha: 0.4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingBar.builder(
                              initialRating: specialForYouJson[index]["rate"],
                              itemCount: 5,
                              itemSize: 14,
                              minRating: 1,
                              itemPadding: EdgeInsets.only(right: 2),
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: danger,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            Text(
                              "(${specialForYouJson[index]["rate"]})",
                              style: TextStyle(
                                fontSize: 13,
                                color: danger,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
