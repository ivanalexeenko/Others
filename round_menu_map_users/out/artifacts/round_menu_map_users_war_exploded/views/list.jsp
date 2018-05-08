<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Of Users Page</title>
    <link rel="stylesheet" href="styles/w3.css">
    <script>
        function mouseover() {
            this.className = "button_over";
        }
        function mouseout() {
            this.className = "button_out";
        }
        function load(){
            for(var i = 1;i <= 4;i++) {
                document.getElementById(i).onmouseover=mouseover;
                document.getElementById(i).onmouseout=mouseout;
            }
        }
    </script>
    <style>
        .button_out {
            outline: none;
            background: #9e0009;
            color: white;
            display: inline-block;
            margin: 10px;
            width: 55px;
            height: 55px;
            cursor: pointer;
            border-radius: 50%;
            box-shadow: 0 3px 20px rgba(255, 0, 0, .25),
            inset 0 2px 0 rgba(255, 0, 0, .6),
            0 7px 0 rgba(255, 0, 0, .1),
            inset 0 0 20px rgba(255, 0, 0, .1);
        }

        .button_over {
            outline: none;
            background: #1bbf5b;
            color: white;
            display: inline-block;
            margin: 10px;
            width: 55px;
            height: 55px;
            cursor: pointer;
            border-radius: 50%;
            box-shadow: 0 3px 20px rgba(0, 255, 0, .25),
            inset 0 2px 0 rgba(0, 255, 0, .6),
            0 7px 0 rgba(0, 255, 0, .1),
            inset 0 0 20px rgba(0, 255, 0, .1);
        }
    </style>

</head>
<body class="w3-light-grey" onload="load()">

<div class="w3-bar w3-blue-gray">
    <button class="button_out" onclick="location.href='/'" id="1">Main</button>
    <button class="button_out" onclick="location.href='/list'" id="2">Users</button>
    <button class="button_out" onclick="location.href='/add'" id="3">Add</button>
    <button class="button_out" onclick="location.href='/map'" id="4">Map</button>
</div>

<div class="w3-container w3-blue-grey w3-opacity w3-center-align">
    <h1>All the Users Are Here:</h1>
</div>

<div class="w3-container w3-center w3-margin-bottom w3-padding">
    <div class="w3-card-4">
        <div class="w3-container w3-light-blue">
            <h2>Users</h2>
        </div>
        <table class="w3-table-all w3-centered w3-center w3-striped">
            <tr>
                <th>Name</th>
                <th>Club</th>
                <th>Gender</th>
                <th>Meal(s)</th>
                <th> <div class="w3-container w3-centered w3-left-align w3-left">Avatar </div> </th>
            </tr>
        <%
            List<String> names = (List<String>) request.getAttribute("userNames");
            List<String> clubs = (List<String>) request.getAttribute("userClubs");
            List<String> genders = (List<String>) request.getAttribute("userGenders");
            List<String> attitudes = (List<String>) request.getAttribute("userAttitudes");
            List<String> paths = (List<String>) request.getAttribute("userPaths");



            if (names != null && !names.isEmpty()) {
                for(int i = 0;i < names.size();i++) {
                    out.println("<tr>");
                    out.println("<td>" + names.get(i) + "</td>");
                    out.println("<td>" + clubs.get(i) + "</td>");
                    out.println("<td>" + genders.get(i) + "</td>");
                    out.println("<td>" + attitudes.get(i) + "</td>");

                    StringBuffer buffer = new StringBuffer(paths.get(i));
                    buffer.replace(0,buffer.indexOf("_") + 1,"");
                    buffer.delete(buffer.indexOf(".png"),buffer.length());
                    System.out.println(buffer.toString());

                    out.println("<td> <div class=\"w3-card w3-center w3-centered\" style=\"width:10%\">");
                    out.println("<img src=\"" + "views/avatars/avatar_" + buffer.toString()  +".png" +  "\"" + "alt=\"" + paths.get(i) + " \" style=\"width:100%\">");
                    out.println(" </div></td>");


                    out.println("</tr>");
                }

            }
            else out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">\n"
                    +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                    "   <h5>There are no users yet!</h5>\n" +
                    "</div>");
        %>
        </table>
    </div>
</div>

<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/'">Back to main</button>
</div>
</body>
</html>