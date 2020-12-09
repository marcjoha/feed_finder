import 'package:feed_finder/feed_finder.dart';

main() async {
  var links = [
    'http://www.braziltravelblog.com/',
    'https://www.protocol.com/',
    'https://www.dcrainmaker.com/',
    'https://rikatillsammans.se/',
    'https://strengthrunning.com/',
    'http://www.europe-v-facebook.org/'
  ];

  for (var link in links) {
    print("Default:");
    print(await FeedFinder.scrape(link));

    print("With disable verification:");
    print(await FeedFinder.scrape(link, verify: false));

    print("With disable parsing from body:");
    print(await FeedFinder.scrape(link, parseFromBody: false));

    print("With disable parsing from body and verification:");
    print(await FeedFinder.scrape(link, parseFromBody: false, verify: false));
  }
}
