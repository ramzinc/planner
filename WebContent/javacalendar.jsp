<%--com.dhtmlx.planner and its dervatives are property of dhtmlx  and applied under GPLv3 , for more information please visit http://javaplanner.com/--%>
<!-- Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung  -->
<!-- This file is part of SLAMS.

    SLAMS  is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

     SLAMS is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with SLAMS.  If not, see <http://www.gnu.org/licenses/>. -->
<html>
<head>
<title>SLAMS</title>
<style type="text/css">
#tfheader {
	background-color: #c3dfef;
}

#tfnewsearch {
	float: right;
	padding: 20px;
	margin-right: 20px;
}

.tftextinput {
	margin: 0;
	padding: 5px 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	border: 1px solid #0076a3;
	border-right: 0px;
	border-radius: 5px;
}

.tfbutton {
	margin: 0;
	padding: 5px 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	color: #ffffff;
	border: solid 1px #0076a3;
	border-right: 0px;
	background: #0095cd;
	background: -webkit-gradient(linear, left top, left bottom, from(#00adee),
		to(#0078a5));
	background: -moz-linear-gradient(top, #00adee, #0078a5);
	border-radius: 5px;
}

.tfbutton:hover {
	text-decoration: none;
	background: #007ead;
	background: -webkit-gradient(linear, left top, left bottom, from(#0095cc),
		to(#00678e));
	background: -moz-linear-gradient(top, #0095cc, #00678e);
}
/* Fixes submit button height problem in Firefox */
.tfbutton::-moz-focus-inner {
	border: 0;
}

.tfclear {
	clear: both;
}
</style>
</head>
<body>
	<!-- HTML for HEADER BAR -->
	<div id="tfheader">
		<form id="tfnewsearch" method="get" action="LoginPage.jsp">
			<input type="submit" value="logout" class="tfbutton"
				style="margin-left: 350px;">
		</form>

		<div class="tfclear"></div>
	</div>

	<div>  <!-- declare the getplanner method  -->                 
		<div class="planner" id="planner"><%=getPlanner(request)%></div>
         <!--import necessary libraries and Api  -->
		<%@ page import="com.dhtmlx.planner.*,com.dhtmlx.planner.data.*, com.dhtmlx.planner.api.DHXBlockTime, com.dhtmlx.planner.api.DHXTimeSpan.DHXDayOfWeek"%>
		<%! String getPlanner(HttpServletRequest request) 
		throws Exception {
		DHXPlanner s = new DHXPlanner("./codebase/", DHXSkin.TERRACE);
		s.setWidth(900);
		s.setInitialDate(2016,0,21);
		s.load("events.jsp", DHXDataFormat.JSON);
		s.data.dataprocessor.setURL("events.jsp");

		DHXBlockTime block = new DHXBlockTime();
		block.setDays(DHXDayOfWeek.SATURDAY, DHXDayOfWeek.SUNDAY);
		s.timespans.add(block);

		return s.render();
	}
	%>
	</div>
</body>
</html>