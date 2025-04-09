import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book/json/home_json.dart';
import 'package:e_book/pages/play_now_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BookDetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String authorName;
  final String rate;

  const BookDetailPage(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.page,
      required this.authorName,
      required this.rate});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: black.withValues(alpha: 0.2)),
          ),
          SizedBox(
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                BlurryContainer(
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 22,
                              color: white,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.bookmark, color: white),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlayNowPage(
                                        img: widget.img,
                                        title: widget.title,
                                        subTitle: widget.subTitle,
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.headphones, color: white),
                              ),
                              IconButton(
                                onPressed: () {
                                  getBottomSheetSetting();
                                },
                                icon: Icon(Icons.settings, color: white),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.subTitle,
                              style: TextStyle(fontSize: 16, color: white),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          getFirstSection(),
          SizedBox(height: 30),
          getSecondSection(),
          SizedBox(height: 30),
          getThirdSection(),
          getFourSection(),
        ],
      ),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: <Widget>[
            Text(
              "\$${widget.price}",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Price",
              style: TextStyle(
                fontSize: 14,
                color: black.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              widget.page,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Page",
              style: TextStyle(
                fontSize: 14,
                color: black.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "${widget.rate}",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3),
            Text(
              "Rating",
              style: TextStyle(
                fontSize: 14,
                color: black.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "About",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            text:
                "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop.",
            style: TextStyle(
              color: black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            children: [
              TextSpan(
                  text: "more",
                  style: TextStyle(
                    color: primary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ))
            ],
          ),
        ),
        SizedBox(height: 15),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: EdgeInsets.only(right: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: storeTags[index]["color"],
                ),
                child: Text(
                  storeTags[index]["label"],
                  style: TextStyle(fontSize: 12, color: white),
                ),
              ),
            );
          }),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.authorName,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "1896-1900",
                      style: TextStyle(
                          fontSize: 13, color: black.withValues(alpha: 0.5)),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "32 Books",
                  style: TextStyle(
                    fontSize: 13,
                    color: black.withValues(alpha: 0.5),
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget getThirdSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reviews",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Column(
          children: List.generate(reviewsPeople.length, (index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(reviewsPeople[index]["img"]),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewsPeople[index]["name"],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: reviewsPeople[index]["rate"],
                            itemCount: 5,
                            itemSize: 14,
                            minRating: 1,
                            itemPadding: EdgeInsets.only(right: 2),
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: danger,
                            ),
                            onRatingUpdate: (rating) {},
                          )
                        ],
                      )
                    ],
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: reviewsPeople[index]["text"],
                      style: TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      children: [
                        TextSpan(
                            text: "more",
                            style: TextStyle(
                              color: primary,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getFourSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Similar books",
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
            children: List.generate(similarBooksJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                                img: similarBooksJson[index]["img"],
                                title: similarBooksJson[index]["title"],
                                subTitle: similarBooksJson[index]["sub_title"],
                                price: similarBooksJson[index]["price"],
                                page: similarBooksJson[index]["page"],
                                authorName: similarBooksJson[index]
                                    ["author_name"],
                                rate:
                                    similarBooksJson[index]["rate"].toString(),
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
                                    similarBooksJson[index]["img"]),
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
                                similarBooksJson[index]["favourite"]
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
                                    "\$${similarBooksJson[index]["price"]}",
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
                          similarBooksJson[index]["title"],
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
                          similarBooksJson[index]["sub_title"],
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
                              initialRating: similarBooksJson[index]["rate"],
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
                              "(${similarBooksJson[index]["rate"]})",
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

  getBottomSheetSetting() {
    List themes = [
      Color(0xFFFFFFFF),
      Color(0xFF000000),
      Color(0xFFF0CEA0),
    ];
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        themes.length,
                        (index) {
                          if (index == 0) {
                            return Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: themes[index],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: black.withValues(alpha: 0.7),
                                  width: 0.5,
                                ),
                              ),
                            );
                          }
                          return Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: themes[index],
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: primary,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "TT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: primary,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "Tt",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: double.infinity,
                        height: 4,
                        decoration: BoxDecoration(
                          color: black.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: 150,
                        height: 4,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 145),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Aa",
                      style: TextStyle(
                        fontSize: 13,
                        color: black.withValues(alpha: 0.8),
                      ),
                    ),
                    Text(
                      "Aa",
                      style: TextStyle(
                        fontSize: 20,
                        color: black.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: double.infinity,
                        height: 4,
                        decoration: BoxDecoration(
                          color: black.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: 150,
                        height: 4,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 145),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.light_mode,
                      color: black.withValues(alpha: 0.6),
                      size: 18,
                    ),
                    Icon(
                      Icons.light_mode,
                      color: black.withValues(alpha: 0.6),
                      size: 28,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
