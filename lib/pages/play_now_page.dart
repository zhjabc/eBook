import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';

class PlayNowPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;

  const PlayNowPage(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle});

  @override
  State<PlayNowPage> createState() => _PlayNowPageState();
}

class _PlayNowPageState extends State<PlayNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: getAppBar()),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: black,
          size: 22,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz,
            color: black,
            size: 30,
          ),
        ),
      ],
      title: Text(
        "Playing Now",
        style: TextStyle(
          fontSize: 18,
          color: black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    spreadRadius: 5,
                    color: black.withValues(alpha: 0.05),
                    offset: Offset(0, 10)),
              ],
              image: DecorationImage(
                  image: NetworkImage(widget.img), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 30),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            widget.subTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: black.withValues(alpha: 0.6),
            ),
          ),
          SizedBox(height: 30),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 4,
                decoration: BoxDecoration(
                  color: black.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Container(
                width: 150,
                height: 4,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "0:34:15",
                style: TextStyle(
                  fontSize: 13,
                  color: black.withValues(alpha: 0.5),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "5:34:15",
                style: TextStyle(
                  fontSize: 13,
                  color: black.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_outlined,
                    color: primary,
                    size: 25,
                  )),
              SizedBox(width: 25),
              IconButton(
                iconSize: 50,
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle,
                  color: primary,
                  size: 50,
                ),
              ),
              SizedBox(width: 25),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_outlined,
                    color: primary,
                    size: 25,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
