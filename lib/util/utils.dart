import 'package:flutter/material.dart';

import '../settings.dart';

class BioscopifyUtils {
  
static ImageProvider imageCheck(String url) {
    if(url == null || url == '')
    {
      return new AssetImage('assets/img/image.png');
    } else {
      return new NetworkImage(Settings.API_IMAGE_URL + url);
    }
  }

static Color ratingcheck(double score) {
    if(score < 5.5) {
      return Colors.red[600];
    } else if (score < 7.5) {
      return Colors.deepOrange[400];
    } else {
      return Colors.green;
    }
  }
}