// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class EmbeddedSpeakersSponsor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Featured Speakers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            Container(
              height: 160,
              child: ListView(
                // Scroll behavior for iOS
                // physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 12),
                children: <Widget>[
                  _buildSpeakerItemView("Sundar Pichai", "CEO, Google"),
                  _buildSpeakerItemView("Elon Musk", "CEO, SpaceX"),
                  _buildSpeakerItemView("Mark Zuckerberg", "CEO, Facebook"),
                  _buildSpeakerItemView("Satya Nadella", "CEO, Microsoft"),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Sponsors",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                // Scroll behavior for iOS
                // physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 12),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildSponsorItemView("Google"),
                  _buildSponsorItemView("SpaceX"),
                  _buildSponsorItemView("Facebook"),
                  _buildSponsorItemView("Microsoft"),
                  _buildSponsorItemView("Amazon"),
                ],
              ),
            ),
            //Container(
            //  height: 150,
            //  child: FlareActor(
            //    "assets/Penguin.flr",
            //    alignment: Alignment.center,
            //    fit: BoxFit.cover,
            //    animation: "walk",
            //  ),
            //),
          ],
        ),
      ),
    );
  }

  Widget _buildSpeakerItemView(String name, String position) {
    return Container(
      margin: EdgeInsets.only(right: 16, top: 24, bottom: 24),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  position,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSponsorItemView(String name) {
    return Container(
      margin: EdgeInsets.only(right: 16, top: 24, bottom: 24),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
