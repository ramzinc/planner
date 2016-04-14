
 <!--  2016 Arnold Francis Leslie Mpiima ,Amira Qistina Abu Shahil, Ng Lean Loong, Muhammad Ihsan Muhammad Rawi Ravi, Chong   Chien Yung  -->
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





<!-- @required Validation.jsp 
 @desc this jsp file is the front end 
 the user will input their username and password to be used in validation
  in the database
 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link type="text/css" rel="stylesheet" href="CSS/style.css">
<title>SLAMS</title>

</head>
<body>
    <!-- Begin Page Content -->
        
    <div id="container">
        <form id="form" action="Validation.jsp" method="post" enctype="application/x-www-form-urlencoded">
            <label for="username" >Username</label>
            <input type="text" id="username" name="username" placeholder="Username..." required>
            <label for ="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Password..." required>
            <div id="lower">
                <input type="submit" id="login" value="Login">
            </div><!--/ lower-->
        </form>
    </div>
    <!--/ container-->
    <!-- End Page Content -->
</body>
</html>