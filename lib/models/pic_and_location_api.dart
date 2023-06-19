import 'dart:io';

class PictureAndLocation {
  /*File? image;*/
  String? latitude;
  String? longitude;
 /* String? type;*/

  PictureAndLocation({/*this.image,*/ this.latitude, this.longitude, /*this.type*/});

  PictureAndLocation.fromJson(Map<String, dynamic> json) {
    /*image = json['image'];*/
    latitude = json['latitude'];
    longitude = json['longitude'];
    /*type = json['type'];*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
   /* data['image'] = image;*/
    data['latitude'] = latitude;
    data['longitude'] = longitude;
   /* data['type'] = type;*/
    return data;
  }
}
