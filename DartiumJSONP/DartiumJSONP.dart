#import('dart:html');
#import('dart:json');

dataReceived(MessageEvent e) {
  var data = JSON.parse(e.data);
  print(data['responseData']);
  data['responseData']['results'].forEach((var newsItem) {
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
  // listen for the postMessage from the main page
  window.on.message.add(dataReceived);
  
  Element script = new Element.tag("script");
  script.src = "https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=barack%20obama&callback=callbackForJsonpApi";
  document.body.elements.add(script);
}
