(function() {
    var input = document.querySelectorAll(".items input");
    var orders = [];
    addSelectedOrder (input, orders);
})();
                                  
function addSelectedOrder (input, orders) {
  for(var i=0; i< input.length; i++) {
    input[i].addEventListener("change", function(e){
      if(e.target.checked) {
        orders.push(e.target.id);
      } else {
        for (var k = 0; k < orders.length; k ++) {
          if(orders[k] == e.target.id) {
            orders.splice(k, 1);
          }
        }
      }
      for(var l =0; l <orders.length; l++) {
        for(var j=0; j< input.length; j++) {
          if (input[j].id == orders[l]) {
            input[j].className = "order" + (l + 1);
          }
        }
      }
    }, false);
  }
}
