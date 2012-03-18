// ~/Documents/DartEditor/dart/dart-sdk/bin/frogc --compile-only --out=DartJSONP.dart.js --verbose DartJSONP.dart
#import('dart:html');
#import('dart:json');

dartCallback(String data) {
  var obj = JSON.parse(data);
  print(obj['responseData']);
  obj['responseData']['results'].forEach((var newsItem) {
    document.body.elements.add(new Element.html("""
    <div> 
      <div>${newsItem['title']}</div>
      <div>${newsItem['content']}</div>
      <div><a href="${newsItem['url']}" >Full Story</a></div>
      <br/>
    </div>"""));
  });
}

void main() {
  // this pulls in the function to ensure
  // it's compiled into the resulting JavaScript
  var f = dartCallback;
  
  Element script = new Element.tag("script");
  script.src = "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=barack%20obama&callback=callbackForJsonpApi";
  document.body.elements.add(script);
}
