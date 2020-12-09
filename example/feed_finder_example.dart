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
    print("Default setup:");
    print(await FeedFinder.scrape(link)); // Scrape from head, body and verify if content is right

    print("With disable verification:");
    print(await FeedFinder.scrape(link, verify: false)); // Disable verification faster results

    print("With disable parsing from head:");
    print(await FeedFinder.scrape(link, parseFromHead: false)); // You can scrape only from body

    print("With disable parsing from body:");
    print(await FeedFinder.scrape(link, parseFromBody: false)); // You can scrape only from head

    print("With disable parsing from body and verification:");
    print(await FeedFinder.scrape(link, parseFromBody: false, verify: false));
  }
}
