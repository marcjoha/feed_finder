import 'package:feed_finder/feed_finder.dart';

main() async {
  var links = [
    'http://www.braziltravelblog.com/',
    'https://www.protocol.com/',
    'https://www.dcrainmaker.com/',
    'https://rikatillsammans.se/',
    'https://strengthrunning.com/'
  ];
  for (var link in links) {
    print(await FeedFinder.scrape(link));
  }
}
