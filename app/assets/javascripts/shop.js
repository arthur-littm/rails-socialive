function shopFunction() {

  var div = document.getElementById("shopbtndiv");
      div.classList.toggle('rotated-image');

  var x = document.getElementById('otherproducts');
  if (x.style.display === 'none') {
      x.style.display = 'block';
  } else {
      x.style.display = 'none';
  }
}
