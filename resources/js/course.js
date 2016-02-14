$('#toggleButton').on('click', function() {
  $('#menuHide').toggle();
  if(document.getElementById('toggleButton').innerHTML == ">"){
    document.getElementById('toggleButton').innerHTML = "<";
  }
  else {
    document.getElementById('toggleButton').innerHTML = ">";
  }
});
