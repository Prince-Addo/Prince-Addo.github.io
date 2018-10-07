function applyColor(element) {
  var color = element.getAttribute('data-bg');
  document.body.style.backgroundColor = color;
}

var buttons = document.getElementsByClassName("button");

for (var i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener("mouseover", function() {
    applyColor(this);
  }, false);
}