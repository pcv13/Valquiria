document.addEventListener('DOMContentLoaded', function(){
  if(window.location.pathname == "/"){
//dentro de este {}solo para la ruta de arriba
var url = '/api/v1/matches/filter'
proxy('get' , url, "json" ).then(filter())

}

function filter() {
var language =document.getElementById("language").value
var game =document.getElementById("game").value

var atches_filtered=[]





}
    // function playerInMatch(size,max) {
    //   if (size < max)
    // }
    //
    // function time_to_match(start_time) {
    //   if (start_time > Date.now())
    // }
    //
    //
    //
    // function dices(Ndices,min,max) {
    //   var arrayDice=[]
    //   var total= 0
    //   for (var i = 0; i < Ndices; i++) {
    //     var dice = Math.floor(Math.random() * (max)) + min;
    //     var total= total+dice;
    //     arrayDice.push(dice);
    //   }
    // }
    //
    //
  })
