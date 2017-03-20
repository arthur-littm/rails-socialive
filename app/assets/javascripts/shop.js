// $(document).ready(function() {

  // $('#shopbtn').on("click", function() {
  //  $('#otherproducts').hide();
  // });

function shopFunction() {
    var x = document.getElementById('otherproducts');
    if (x.style.display === 'none') {
        x.style.display = 'block';
    } else {
        x.style.display = 'none';
    }
}

// });
