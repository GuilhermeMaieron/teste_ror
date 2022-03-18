var update_likes = setInterval(atualiza_likes, 4000);

function atualiza_likes() {
  var like_div = document.getElementById("likes-div");
  var divglobal = document.getElementById("post-div");
  var path = divglobal.getAttribute("data-url")
$.ajax({

  type: "GET",
  url: path,
  contentType: "json",
  data: {}

}).done(function(data) {

  like_div.innerText = data;

});
}
