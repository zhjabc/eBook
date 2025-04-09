import 'package:badges/badges.dart' as badges;
import 'package:e_book/json/my_book_json.dart';
import 'package:e_book/pages/book_detail_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class MyBookPage extends StatefulWidget {
  const MyBookPage({super.key});

  @override
  State<MyBookPage> createState() => _MyBookPageState();
}

class _MyBookPageState extends State<MyBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            getSearchAndCart(),
            SizedBox(height: 30),
            getContinueReading(),
            SizedBox(height: 30),
            getUnread()
          ],
        ),
      ),
    );
  }

  Widget getSearchAndCart() {
    var size = MediaQuery.of(context).size;

    return Row(
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
    );
  }

  Widget getContinueReading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Continue reading (${continueReadingJson.length})",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(continueReadingJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                                img: continueReadingJson[index]["img"],
                                title: continueReadingJson[index]["title"],
                                subTitle: continueReadingJson[index]
                                    ["sub_title"],
                                price: continueReadingJson[index]["price"],
                                page: continueReadingJson[index]["page"],
                                authorName: continueReadingJson[index]
                                    ["author_name"],
                                rate: continueReadingJson[index]["rate"]
                                    .toString(),
                              )));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 200,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image:
                              NetworkImage(continueReadingJson[index]["img"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 150,
                      child: Text(
                        continueReadingJson[index]["title"],
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 150,
                      child: Text(
                        continueReadingJson[index]["sub_title"],
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 13,
                          color: black.withValues(alpha: 0.4),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Stack(
                              children: [
                                Container(
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: black.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Container(
                                  width: continueReadingJson[index]
                                      ["percentage"],
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "${continueReadingJson[index]["percentage"]}%",
                            style: TextStyle(
                              fontSize: 13,
                              color: black.withValues(alpha: 0.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget getUnread() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Unread (${unReadJson.length})",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Column(
          children: List.generate(unReadJson.length, (index) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailPage(
                          img: unReadJson[index]["img"],
                          title: unReadJson[index]["title"],
                          subTitle: unReadJson[index]["sub_title"],
                          price: unReadJson[index]["price"],
                          page: unReadJson[index]["page"],
                          authorName: unReadJson[index]["author_name"],
                          rate: unReadJson[index]["rate"].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 80,
                    height: 105,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: NetworkImage(unReadJson[index]["img"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        unReadJson[index]["title"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        unReadJson[index]["sub_title"],
                        style: TextStyle(
                          fontSize: 13,
                          color: black.withValues(alpha: 0.4),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RatingBar.builder(
                              initialRating: unReadJson[index]["rate"],
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
                              "(${unReadJson[index]["rate"]})",
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
                )
              ],
            );
          }),
        )
      ],
    );
  }
}
