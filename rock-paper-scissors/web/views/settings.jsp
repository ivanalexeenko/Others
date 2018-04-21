<%@ page import="java.util.List" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="app.entities.GameStatistics" %>
<%@ page import="app.service.Configuration" %><%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 16.04.2018
  Time: 18:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game Configuration</title>
    <link rel="stylesheet" href="styles/w3.css">
    <link rel="stylesheet" href="styles/icons.css">
</head>
<body class="w3-light-grey">
<div class="w3-container w3-blue-grey w3-opacity w3-left-align">
    <h1>The Battle Matrix</h1>
    <div class="w3-container w3-right-align w3-padding">
        <p><button class="w3-btn w3-teal w3-text-black w3-xlarge" onclick="location.href='/'">Home<i class="w3-margin-left material-icons">home</i></button></p>
    </div>
</div>
    <%
        if((boolean)request.getAttribute("isDefault")) {
            out.println("<div class=\"w3-container w3-light-grey\">\n<p style=\"text-shadow:1px 1px 0 #444\">Settings have been set by Default</p>\n</div>");
        }
    %>

<div class="w3-responsive">
    <table class="w3-table-all">
        <tr>
            <%
                GameStatistics gameStatistics = (GameStatistics) request.getAttribute("gameStatistics");
                List<String> variants = (List<String>) request.getAttribute("pickVariants");
                int[][] battleMatrix = (int[][])request.getAttribute("battleMatrix");
                out.println("<td>" + "" + "</td>");
                for(String i: variants) {
                    out.println("<td>" + i +"</td>");
                }
                for(int i = 0;i < battleMatrix.length;i++) {

                    out.println("<tr>");
                    out.println("<td>" + variants.get(i) +"</td>");
                    for(int j = 0;j < battleMatrix.length;j++) {
                        out.println("<td>" + gameStatistics.toWord(battleMatrix[i][j]) +"</td>");
                    }
                    out.println("</tr>");
                }
            %>
        </tr>
    </table>
</div>
<%
    out.println("<div class=\"w3-panel w3-light-blue w3-display-container w3-card-4 w3-round\">\n" +
            "   <span onclick=\"this.parentElement.style.display='none'\"\n" +
            "   class=\"w3-button w3-margin-right w3-display-right w3-round-large w3-hover-light-blue w3-border w3-border-light-blue w3-hover-border-grey\">×</span>\n" +
            "   " + "A Little Hint: In order to understand a table read it from left to right and then to the top" +
            "</div>");
%>

</body>
</html>
