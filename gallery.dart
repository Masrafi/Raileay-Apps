import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:url_launcher/url_launcher.dart';



class Mas extends StatelessWidget {
  final imageList = [
    'https://kodetr.herokuapp.com/banners/post/flutter/flutter_photoview.webp',
    'https://kodetr.herokuapp.com/banners/post/flutter/fluttermap.webp',
    'https://awazo.com/photo/2014/8328C609_0027L1.jpg',
    'https://image.shutterstock.com/z/stock-photo-dhaka-bangladesh-august-hundreds-of-ticket-seekers-thronged-kamalapur-railway-station-1154039839.jpg',
    'https://image.shutterstock.com/z/stock-photo-dhaka-bangladesh-january-unidentified-muslim-pilgrims-return-from-bishwa-ijtema-on-1058831099.jpg',
    'https://image.shutterstock.com/z/stock-photo-noapara-railway-station-noapar-jashore-bangladesh-july-long-rail-line-people-and-1466086988.jpg',
    'https://cdni.rt.com/files/2018.08/article/5b7c0a5dfc7e938d5d8b457e.jpg',
    'http://www.asianews.it/files/img/BANGLADESH_-_0924_-_Eid-ul-Azha.jpg',
    'https://www.dailyinqilab.com/news_original/1466876769_p-13.jpg',
    'http://www.nirapadnews.com/english/wp-content/uploads/2014/12/demutrain.jpg',
    'https://www.info57.com/wp-content/uploads/2019/05/Banalata-express-Train-Schedule-2019.jpg',
    'https://dailyasianage.com/library/1466892279_4.jpg',
    'https://thumbs.dreamstime.com/z/street-children-street-children-bangladesh-railway-120674449.jpg',
    'https://i.pinimg.com/236x/02/f1/3f/02f13fc6446037d12c52e9d36614be6b--bangladesh-travel-tips.jpg',
    'http://1.bp.blogspot.com/-W8RS96XfcEA/Tq0bZe8OzOI/AAAAAAAAQJw/SKGQRfb-Fo8/s1600/007_Bangladesh+Train+Surfing.jpg',
    'http://www.slate.com/content/dam/slideshows/arts/brow_beat/2011/11/11/train-riding-in-bangladesh/jcr%3acontent/slideshow/0/images%252Fslides%252Ftrain_02.JPG'



  ];

  _launchURL() async {
    const url = 'https://www.google.com/search?rlz=1C1CHBD_enBD874BD875&biw=1366&bih=625&tbm=isch&sxsrf=ACYBGNR8yvQBj66JQRHR7DxQMT4ZJQH4iQ%3A1577364535882&sa=1&ei=N6wEXoLCNfOO4-EPsNej8AQ&q=bangladesh+railway+photography&oq=bangladesh+railway&gs_l=img.1.1.35i39l2j0l8.0.0..61762...0.0..0.114.210.1j1......0......gws-wiz-img.0gsTzdViOh4';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo View',
      home: Scaffold(
        appBar: AppBar(
          leading: RaisedButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.keyboard_backspace,size: 20.0),
                //Text('BACK',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0)),
              ],
            ),
            onPressed: (){
              Navigator.pop(context);
            },
            color: Colors.blue,
            textColor: Colors.white,
            //padding: EdgeInsets.all(2.0),
            splashColor: Colors.grey,
          ),

          title: Center(child: Text('Photo Gallery',style: TextStyle(fontFamily: 'Signatra',fontSize: 40.0),)),
          actions: <Widget>[
            RaisedButton(
              onPressed: (){
                _launchURL();
              },
              child: Text('More',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),

              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(0.0),
              splashColor: Colors.grey,
            ),
          ],
        ),
        body: PhotoViewGallery.builder(
          itemCount: imageList.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: NetworkImage(
                imageList[index],
              ),

              minScale: PhotoViewComputedScale.contained * 0.8,
              maxScale: PhotoViewComputedScale.covered * 2,
            );
          },
          scrollPhysics: BouncingScrollPhysics(),
          backgroundDecoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
          loadingChild: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
