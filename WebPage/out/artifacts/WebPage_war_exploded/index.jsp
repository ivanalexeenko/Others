
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Ivan Alexeenko Personal Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <style>
    .img-thumbnail {
      height: 200px;
      background: #aaa;
    }
  </style>
  <style>
    .nav-item a:hover {
      color: cyan !important;
      cursor: pointer;
      background: darkblue;
    }
  </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Hi,I am Ivan & That is My Web Page =)</h1>
  <p>You're welcome!</p>
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="/">Main Page</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/about">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/postcard">Postcard</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/schedule">Schedule</a>
      </li>
    </ul>
  </div>
</nav>


<div class="container" style="margin-top:30px">
  <div class="row">
    <div class="col-sm-4">
      <h2>About Me</h2>
      <h5>Photo of me:</h5>
      <div><img src="views/images/positive.jpg" class="img-thumbnail" alt="Positive Guys Here"></div>
      <p>19 e.o. positive guy with a huge love of drawing up different staff...</p>
      <h3>Some Links</h3>
      <p>Click Click Click.</p>
      <ul class="nav nav-pills flex-column">
        <li class="nav-item">
          <a class="nav-link" href="/about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postcard">Postcard</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/schedule">Schedule</a>
        </li>
      </ul>
      <hr class="d-sm-none">
    </div>
    <div class="col-sm-8">
      <h2>TIC - TAC - TOE GAME</h2>
      <h5>My First Game Ever Made, Aug 28, 2017</h5>
        <div><img src="views/images/tic-tac-toe.jpg" class="img-thumbnail" alt="Tic Tac Toe Game"></div>
      <p>You can play this classic game versus the Computer(not smart enough) or with your Friend.</p>
        <p><a class="link" href="https://github.com/ivanalexeenko/WinAPI/tree/master/Tic-Tac-Toe%20TheGame">Download Tic-Tac-Toe on Github</a></p>
      <br>
      <h2>ARCANOID GAME</h2>
      <h5>Java Swing and Breaking the Bricks, Feb 3, 2018</h5>
        <div><img src="views/images/arcanoid.jpg" class="img-thumbnail" alt="Arkanoid Game"></div>
      <p>Simply move the Platform to destroy all the Bricks!</p>
        <p><a class="link" href="https://github.com/ivanalexeenko/Games/tree/master/LetsGetTheGameStarted">Download Arcanoid on Github</a></p>
      <h2>SIMPLE USER AUTHENTIFICATION</h2>
      <h5>My First Web Application Ever Made, April 10, 2018</h5>
      <div><img src="views/images/first-web.jpg" class="img-thumbnail" alt="User Name and Password"></div>
      <p>You can add users and see them on the other page due to list of them.</p>
      <p><a class="link" href="https://github.com/ivanalexeenko/WEB/tree/master/firstproject">Download User Sign In on Github</a></p>
      <br>
      <h2>ROCK PAPER SCISSORS LIZARD SPOCK</h2>
      <h5>This is a non-classic Rock Paper Scissors Game, April 14, 2018</h5>
      <div><img src="views/images/rock-paper-scissors.jpg" class="img-thumbnail" alt="Human vs COMPUTER"></div>
      <p>You can set any number of elements to play(3,5,7,9,11 and etc).</p>
      <p><a class="link" href="https://github.com/ivanalexeenko/WEB/tree/master/rock-paper-scissors-lizard-spock">Download Rock Paper Scissors on Github</a></p>
      <br>
    </div>
  </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
  <p>@All Rights Reserved. Belarus,Minsk, 21.04.2018.</p>
</div>

</body>
</html>
