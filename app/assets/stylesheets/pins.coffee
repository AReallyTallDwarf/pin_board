# // Place all the styles related to the Pins controller here.
# // They will automatically be included in application.css.
# // You can use Sass (SCSS) here: https://sass-lang.com/
$ ->
 $('#pins').imagesLoaded ->
  $('#pins').masonry
   itemSelector: '.box'
   isFitWidth: true