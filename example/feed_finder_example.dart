import 'package:feed_finder/feed_finder.dart';

main() async {
  var urls = [
    'http://www.braziltravelblog.com/',
    'https://www.protocol.com/',
    'https://www.dcrainmaker.com/',
    'https://rikatillsammans.se/',
    'https://strengthrunning.com/',
    'http://www.europe-v-facebook.org/',
    'https://www.hotelnewsresource.com/',
    'https://www.traveldailynews.com'
  ];
  for (var url in urls) {
    var header = 'Looking for feeds in ' + url;
    var border = '=' * header.length;

    print('');
    print(border);
    print(header);
    print(border);
    print('');

    print('Scrape head and body; and verify potential feeds');
    print((await FeedFinder.scrape(url)).join('\n'));
    print('');

    print('Scrape head and body; but disable verification for faster results');
    print((await FeedFinder.scrape(url, verifyCandidates: false)).join('\n'));
    print('');

    print('Scrape only head');
    print((await FeedFinder.scrape(url, parseBody: false)).join('\n'));
    print('');

    print('Scrape only body');
    print((await FeedFinder.scrape(url, parseHead: false)).join('\n'));
    print('');
  }
}
