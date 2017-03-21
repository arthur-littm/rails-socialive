// $(document).ready(function() {

  // $('#shopbtn').on("click", function() {
  //  $('#otherproducts').hide();
  // });

function shopFunction() {

  var div = document.getElementById("shopbtndiv");

  console.log(div.class)
  if (div.class === 'rotated-image') {
      div.class = 'rotated-image2';
  }
  else {
      div.class = 'rotated-image';
  }
  console.log(div.class)


  var x = document.getElementById('otherproducts');
  if (x.style.display === 'none') {
      x.style.display = 'block';
  } else {
      x.style.display = 'none';
  }
}

// });
