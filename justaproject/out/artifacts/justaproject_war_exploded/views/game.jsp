<%@ page import="app.entities.GameStatistics" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 17.04.2018
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Let's Play A Game,Fellow!</title>
    <link rel="stylesheet" href="styles/w3.css">
    <link rel="stylesheet" href="styles/icons.css">
    <style>
        select {
            width: 300px;
            text-align-last: center
        }
    </style>
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-centered-align">
    <h1>The Game Stats:</h1>
    <div class="w3-container w3-right-align w3-padding">
        <button class="w3-btn w3-teal w3-text-black w3-xlarge" onclick="location.href='/settings'">Configuration<i class="w3-margin-left material-icons">menu</i></button>
        <button class="w3-btn w3-teal w3-text-black w3-xlarge" onclick="location.href='/'">Home<i class="w3-margin-left material-icons">home</i></button>
        <button class="w3-btn w3-teal w3-text-black w3-xlarge" onclick="location.href='https://www.freeformatter.com/hmac-generator.html'">Check the Hash Code Out(SHA-1)<i class="w3-margin-left material-icons">search</i></button>
    </div>
</div>
<div class="w3-cell-row">
    <div class="w3-container w3-center w3-aqua w3-text-black w3-cell">
        <h1>HUMAN</h1>
    </div>
    <div class="w3-container w3-center w3-green w3-cell">
        <div class="w3-responsive w3-centered">
            <img src="views/versus.jpg" alt = "VS" style="width:10%">
        </div>
    </div>
    <div class="w3-container w3-centered w3-center w3-pink w3-text-black w3-cell">
        <h1>COMPUTER</h1>
    </div>
</div>

<div class="w3-row-padding w3-margin-top">
    <div class="w3-third">
        <div class="w3-card w3-center">
            <form method="post" class="w3-selection w3-light-grey w3-padding">
                <label>
                    <select size="3" name="select" >
                        <option disabled>Pick To Win</option>
                        <%
                            List<String> variants = new ArrayList<>();
                            variants.addAll((List<String>) request.getAttribute("pickVariants"));
                            Collections.sort(variants);
                            for(String i : variants) {
                                out.println("<option>" + i + "</option>");
                            }
                        %>
                    </select>
                </label>

                <p><button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Submit</button></p>
            </form>
        </div>
    </div>

    <div class="w3-third">
        <table class="w3-table-all">
            <tr>
                <th>Wins:</th>
                <th>Ties:</th>
                <th>Loses:</th>
            </tr>
            <tr>
                <%
                    GameStatistics gameStatistics = (GameStatistics) request.getAttribute("gameStatistics");
                    out.println("<th>" + gameStatistics.getWins() + "</th>");
                    out.println("<th>" + gameStatistics.getTies() + "</th>");
                    out.println("<th>" + gameStatistics.getLoses() + "</th>");

                %>
            </tr>
        </table>
    </div>

    <div class="w3-third">
        <div class="w3-card w3-center">
            <h1>Computer's pick:</h1>
            <%
                out.println("<p>" + "'" + gameStatistics.getComputerCurrentHash() + "'" + "</p>");
            %>
        </div>
    </div>


    <div class="w3-row-padding w3-margin-top">
        <div class="w3-third">
            <div class="w3-card">
                <div class="w3-container">
                    <h1>Human's Last Hashcode of a Pick:</h1>
                    <%
                        out.print("<p>" + "'" + gameStatistics.getHumanLastHash() + "'" + "</p>");
                    %>
                </div>
            </div>
        </div>

        <div class="w3-third">
            <div class="w3-card">

                <table>
                    <tr>
                        <th>
                            <p><------------------------------------------------></p>
                        </th>
                        <th>
                            <p><------------------------------------------------></p>
                        </th>
                        <th>
                            <p><------------------------------------------------></p>
                        </th>
                    </tr>
                </table>

            </div>
                </div>

        <div class="w3-third">
            <div class="w3-card">
                <div class="w3-container">
                    <h1>Computer's Last Hashcode of a Pick:</h1>
                    <%
                        out.print("<p>" + "'" + gameStatistics.getComputerLastHash() + "'" + "</p>");
                    %>
                </div>
            </div>
        </div>
    </div>



<div class="w3-container w3-center">
    <h1>Battle Story</h1>
</div>

<%
    List<String> gameSession = (List<String>) request.getAttribute("gameSession");
    if (gameSession != null && !gameSession.isEmpty()) {
        out.println("<ul class=\"w3-ul\">");
        for (String s : gameSession) {
            out.println("<li class=\"w3-hover-sand\">" + s + "</li>");
        }
        out.println("</ul>");
    }
%>

</div>

</body>
</html>
