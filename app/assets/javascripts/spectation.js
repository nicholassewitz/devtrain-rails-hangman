$(function() {
  if ($("#game-spectate").length > 0) {
    setTimeout(update, 2000);
  }
});

function update () {
  if ($("#game-spectate").length == 0) {
    return // To stop polling when game is over
  }

  var game_id = $("#game-spectate").attr("data-id");
  var time = $(".guess:last-child").attr("data-time");
  var over = $("#game-spectate").attr("data-game-over");

  $.getScript("/games/" + game_id + ".js");

  setTimeout(update, 2000);
};
