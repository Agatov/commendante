json.widget do
  json.partial! 'account/widgets/widget', widget: @widget
end

json.profile do
  json.partial! 'account/users/user', user: @profile
end

raw_code = '
var GetReview = {};
GetReview.WidgetUID = "***";

(function(d, w) {
  var h = d.getElementsByTagName("head")[0],
      script = d.createElement("script"),
      css = d.createElement("link");


  script.async = true;
  script.type = "application/javascript";
  script.src = "http://getreview.ru/widget/widget.js?version=0.1";

  css.rel = "stylesheet";
  css.type = "text/css";
  css.href = "http://getreview.ru/widget/widget.css?version=0.1";

  h.appendChild(script);
  h.appendChild(css);

})(document, window)
'

json.widget_code Uglifier.new.compile(raw_code).gsub("***", @widget.uid)

