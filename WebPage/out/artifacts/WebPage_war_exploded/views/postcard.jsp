<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.createjs.com/soundjs-0.6.2.min.js"></script></head>
    <style>
        * {box-sizing: border-box;}
        body {font-family: Verdana, sans-serif;}
        .mySlides {display: none;}
        img {vertical-align: middle;}

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }

        /* Caption text */
        .text {
            color: #f2f2f2;
            font-size: 15px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            text-align: center;
            background: black;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

        .active {
            background-color: #717171;
        }

        /* Fading animation */
        .fade {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }

        @keyframes fade {
            from {opacity: .4}
            to {opacity: 1}
        }

        /* On smaller screens, decrease text size */
        @media only screen and (max-width: 300px) {
            .text {font-size: 11px}
        }
        img{
            width:1000px;
            height:600px;
        }
        .w3-myfont {
            font-family: "Comic Sans MS", cursive, sans-serif;
        }
    </style>
</head>
<body>
<audio id="myAudio">
    <source src="sounds/champions_league.mp3">
</audio>

<script>
    var aud = document.getElementById("myAudio");

    function playAudio() {
        aud.play();
    }

    function pauseAudio() {
        aud.pause();
    }
</script>

<div class="w3-bar w3-black">
    <a href="/" class="w3-bar-item w3-button">Main Page</a>
    <a href="/about" class="w3-bar-item w3-button">About</a>
    <a href="/postcard" class="w3-bar-item w3-button">Postcard</a>
    <a href="/schedule" class="w3-bar-item w3-button">Schedule</a>
</div>

<div class="w3-container w3-center w3-myfont w3-dark-grey">
    <h2 style="color:#9e0009; text-shadow:1px 1px 0 #e60d54">10 February is the International Footbal's Day!!!</h2>
    <p style="color:#28ff28; text-shadow:1px 1px 0 #0fe6a7">Yeeeeaaah, let's celebrate by watching emotional moments in the Champions League and listening to the CL Anthem!!!</p>
</div>

<div class="slideshow-container" onmouseover="playAudio();" onmouseleave="pauseAudio()">

    <div class="mySlides fade">
        <div class="numbertext">0 / 11</div>
        <img src="views/slideshow/champ-leaque.jpg"></div>
    <div class="text">Imagine you're stepping on the pitch and millions of people are watching at you. And then the CL anthem sounds...</div>

    <div class="mySlides fade">
        <div class="numbertext">1 / 11</div>
        <img src="views/slideshow/1.jpg"></div>
    <div class="text">David Luiz from Chelsea FC Celebrates The Goal</div>

    <div class="mySlides fade">
        <div class="numbertext">2 / 11</div>
        <img src="views/slideshow/2.jpg">
        <div class="text">Lionel Messi from FC Barcelona Scores</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">3 / 11</div>
        <img src="views/slideshow/3.jpg">
        <div class="text">AC Milan beats FC Liverpool in 2007 CL final</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">4 / 11</div>
        <img src="views/slideshow/4.jpg">
        <div class="text">Cristiano Ronaldo from Real Madrid Celebrates a goal</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">5 / 11</div>
        <img src="views/slideshow/5.jpg">
        <div class="text">Chelsea FC after winning Champions League in 2012</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">6 / 11</div>
        <img src="views/slideshow/6.jpg">
        <div class="text">Gigi Buffon's red card in Champions League semi-final vs Real Madrid</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">7 / 11</div>
        <img src="views/slideshow/7.jpg">
        <div class="text">FC Liverpool beats AC Milan after 0-3 gap in 2005</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">8 / 11</div>
        <img src="views/slideshow/8.jpg">
        <div class="text">AC Milan wins a trophy in 2007</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">9 / 11</div>
        <img src="views/slideshow/9.jpg">
        <div class="text">Michael Ballack vs Referee Tom Henning Ovrebo</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">10 / 11</div>
        <img src="views/slideshow/10.jpg">
        <div class="text">Real Madrid vs Bayern Munich: Referees rob Bayern Munich of possible semi-finals spot</div>
    </div>
    <div class="mySlides fade">
        <div class="numbertext">11 / 11</div>
        <img src="views/slideshow/11.jpg">
        <div class="text">Players of Chelsea FC celebrate Didier Drogba winning goal vs Bayern Munich</div>
    </div>
</div>
<br>

<div style="text-align:center">
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
    <span class="dot"></span>
</div>

<script>
    var slideIndex = 0;
    showSlides();
    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 3000); // Change image every 3 seconds

    }

</script>

</body>
</html>
