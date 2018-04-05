window.addEventListener('load', function(){
  var button = document.getElementById('comments-button');
  button.addEventListener('click', function() {
    var comments = document.getElementById('article-comments');
    if (comments.classList.contains('hided-comments')) {
      comments.className = comments.className.replace('hided-comments', 'comments');
      this.textContent = 'Hide comments';
    } else {
      comments.className = comments.className.replace('comments', 'hided-comments');
      this.textContent = 'Show comments';
    }
  });
});
