//
// def player_in_match
//   @match=Match.find(params[:id])
//   if @match.players.size < @match.maximum_players
//   end
// end
//
// def time_to_match
//   @match=Match.find(params[:id])
//   if @match.star_time > Time.now
//   end
// end






function playerInMatch(size,max) {
  if (size < max)
}

function time_to_match(start_time) {
  if (start_time > Date.now())
}



function dices(Ndices,min,max) {
  var arrayDice=[]
  var total= 0
  for (var i = 0; i < Ndices; i++) {
    var dice = Math.floor(Math.random() * (max)) + min;
    var total= total+dice;
    arrayDice.push(dice);
  }
}
