import 'package:badges/badges.dart' as badges;
import 'package:e_book/json/favourite_json.dart';
import 'package:e_book/pages/book_detail_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
          children: [
            SizedBox(height: 10),
            getSearchAndCart(),
            SizedBox(height: 30),
            getFavouriteList(),
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

  Widget getFavouriteList() {
    var size = MediaQuery.of(context).size;

    return Wrap(
      spacing: 15,
      runSpacing: 20,
      children: List.generate(favouriteBooksJson.length, (index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BookDetailPage(
                              img: favouriteBooksJson[index]["img"],
                              title: favouriteBooksJson[index]["title"],
                              subTitle: favouriteBooksJson[index]["sub_title"],
                              price: favouriteBooksJson[index]["price"],
                              page: favouriteBooksJson[index]["page"],
                              authorName: favouriteBooksJson[index]
                                  ["author_name"],
                              rate:
                                  favouriteBooksJson[index]["rate"].toString(),
                            )));
              },
              child: Stack(
                children: [
                  Container(
                    width: (size.width - 55) / 2,
                    height: (size.width + 40) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: NetworkImage(
                              favouriteBooksJson[index]["img"],
                            ),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: white,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: danger,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: (size.width - 55) / 2,
              child: Text(
                favouriteBooksJson[index]["title"],
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: (size.width - 55) / 2,
              child: Text(
                favouriteBooksJson[index]["title"],
                maxLines: 1,
                style: TextStyle(
                    fontSize: 13, color: black.withValues(alpha: 0.4)),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: (size.width - 55) / 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  RatingBar.builder(
                    initialRating: favouriteBooksJson[index]["rate"],
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
                  SizedBox(width: 10),
                  Text(
                    "(${favouriteBooksJson[index]["rate"]})",
                    style: TextStyle(
                      fontSize: 13,
                      color: danger,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
