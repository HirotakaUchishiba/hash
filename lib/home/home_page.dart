import 'package:flutter/material.dart';
import 'package:hash/club_list/club_list_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:70,
              ),
              Text(
                '#コンテンツ一覧',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/information/club_introduction.png",
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ClubListPage(),

                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/information/campus_map.png",
                    fit: BoxFit.cover,
                  ),
                ),
                onTap: () {
                  _campusMapLaunchInBrowser();
                },
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#Hashメディア',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        "assets/information/what_is_hash.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      _hashIntroLaunchInBrowser();
                    },
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  _campusMapLaunchInBrowser() async {
    const url = 'https://www.kansai-u.ac.jp/nenshi/campus_map/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }

  _hashIntroLaunchInBrowser() async {
    const url = 'https://hashintroduction.studio.site/';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
    } else {
      throw 'このURLにはアクセスできません';
    }
  }
}