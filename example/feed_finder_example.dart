import 'package:feed_finder/feed_finder.dart';

main() async {
  var links = [
    /*
    'http://www.braziltravelblog.com/',
    'https://www.protocol.com/',
    'https://www.dcrainmaker.com/',
    'https://rikatillsammans.se/',
    'https://strengthrunning.com/',
    'http://www.europe-v-facebook.org/',
    'https://www.hotelnewsresource.com/',
    */
    'https://www.traveldailynews.com'
  ];
  for (var link in links) {
    print(await FeedFinder.scrape(link));
  }
}
