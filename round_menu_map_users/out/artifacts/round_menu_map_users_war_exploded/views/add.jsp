<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.sql.Array" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="app.model.Model" %>
<%@ page import="app.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>

    <title>Add New User Page</title>
    <link rel="stylesheet" href="styles/w3.css">
    <style>
        select {
            width: 550px;
            text-align-last: center
        }
    </style>
    <style>
    .container {
    display: inline;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    }

    .container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    }

    .checkmark {
    display: inline;
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    }

    .container:hover input ~ .checkmark {
    background-color: #ccc;
    }

    .container input:checked ~ .checkmark {
    background-color: #2196F3;
    }

    .checkmark:after {
    content: "";
    position: absolute;
    display: none;
    }

    .container input:checked ~ .checkmark:after {
    display: inline;
    }

    .container .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
    }
    </style>

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

<div class="w3-container w3-blue-grey w3-opacity w3-left-align">
    <h1>Fill the Gaps to Add a New User:</h1>
</div>

<div class="w3-container w3-padding">

    <%
        User userUser = (User) request.getAttribute("userUser");
        Boolean isAdded = (Boolean)request.getAttribute("isAdded");

        String name = null;
        if(userUser != null && isAdded != null) {
            if(isAdded) {
                name = userUser.getName();
            }
        }
        if(isAdded != null && isAdded) {
            out.println("<div class=\"w3-panel w3-green w3-display-container w3-card-4 w3-round\">\n" +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-green w3-border w3-border-green w3-hover-border-grey\">×</span>\n" +
                    "   <h5>User '" + name + "'successfully added!</h5>\n" +
                    "</div>");
        }
        else {
            out.println("<div class=\"w3-panel w3-red w3-display-container w3-card-4 w3-round\">\n" +
                    "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
                    "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-red w3-border w3-border-red w3-hover-border-grey\">×</span>\n" +
                    "   " + "Hm, Some Fields Are Empty,Try Again" +
                    "</div>");
        }
    %>
    <div class="w3-card-4">
        <div class="w3-container w3-center w3-green">
            <h2>Add user</h2>
        </div>
        <form method="post" class="w3-selection w3-light-grey w3-padding">
            <label>Name:
                <input type="text" name="name" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>Password:
                <input type="password" name="pass" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 30%"><br />
            </label>
            <label>
                <select size="4" name="select">
                    <option disabled>Pick Your Club:</option>
                    <%
                        String[] variants = Model.getInstance().getStandardClubs();
                        for(String i : variants) {
                            out.println("<option>" + i + "</option>");
                        }
                    %>
                </select>
            </label>
            <h3>What Kind Of Food Do You Prefer?</h3>
            <div class="w3-container w3-left w3-green">
                <%
                    String[] meals = Model.getInstance().getStandardAttitudes();
                    for(String i : meals) {
                        out.println(" <label class=\"container\">" + i);
                        out.println("<input type=\"checkbox\" name=\"meal\" value=\""  + i + " \"> ");
                        out.println(" <span class=\"checkmark\"></span>\n" +
                                "</label>");

                    }
                %>
            </div>
            <p> (Pa-ra-pa-pa-paaaa)</p>
            <div class="w3-container">
                <h2>Your Gender:</h2>
                <p>
                    <input class="w3-radio" type="radio" name="gender" value="Male">
                    <label>Male</label></p>
                <p>
                    <input class="w3-radio" type="radio" name="gender" value="Female">
                    <label>Female</label></p>
            </div>
            <h2>Choose your Avatar:</h2>
            <input type="file" accept="image/*" id="file" name="file">
            <p><table>
                <tr>
                    <th>
                        <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Submit<img src="views/icons/submit.png" width="40" height="40"></button>
                        <button type="reset" class="w3-btn w3-green w3-round-large w3-margin-bottom">Reset<img src="views/icons/reset.png" width="40" height="40"> </button>
                    </th>
                </tr>
            </table><p>

        </form>
    </div>
</div>


<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/'">Back to main</button>
</div>
</body>
</html>