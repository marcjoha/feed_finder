import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

/// A convenicence class for finding feeds on a website
///
/// FeedFinder is looking for both RSS and Atom feeds, both as structured
/// elements in <head> and as unstructured links in the <body>.
class FeedFinder {
  /// Returns feeds found on `url`
  static Future<List<String>> scrape(String url) async {
    var results = <String>[];
    var candidates = <String>[];

    // Get and parse website
    var response;
    var document;
    try {
      response = await http.get(url);
      document = parse(response.body);
    } catch (e) {
      return results;
    }

    var uri = Uri.parse(url).removeFragment();
    var base = uri.scheme + '://' + uri.host;

    // Look for feed candidates in head
    for (var link in document.querySelectorAll("link[rel='alternate']")) {
      var type = link.attributes['type'];
      if (type != null) {
        if (type.contains('rss') || type.contains('xml')) {
          var href = link.attributes['href'];
          if (href != null) {
            // Fix relative URLs
            href = href.startsWith('/') ? base + href : href;
            candidates.add(href);
          }
        }
      }
    }

    // Look for feed candidates in body
    for (var a in document.querySelectorAll('a')) {
      var href = a.attributes['href'];
      if (href != null) {
        if (href.contains('rss') ||
            href.contains('xml') ||
            href.contains('feed')) {
          // Fix relative URLs
          href = href.startsWith('/') ? base + href : href;
          href = href.endsWith('/') ? href.substring(0, href.length - 2) : href;

          // Fix naked URLs
          href = !href.startsWith('http') ? base + '/' + href : href;

          candidates.add(href);
        }
      }
    }

    // Remove duplicates
    candidates = candidates.toSet().toList();

    // Verify candidates
    for (var candidate in candidates) {
      try {
        await http.get(candidate);
      } catch (e) {
        continue;
      }

      results.add(candidate);
    }

    return results;
  }
}
