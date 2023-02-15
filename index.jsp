<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <style>
        a,
        button,
        input[type="button"],
        input[type="submit"] {
            background-color: rgb(0, 168, 224);
            border-width: 0;
            border-radius: 4px;
            color: aliceblue;
            padding: 4px 8px 4px 8px;
            margin: 6px;
            transition: all 0.1s;
            font-size: 16px;
        }

        a:hover,
        button:hover,
        input[type="button"]:hover,
        input[type="submit"]:hover {
            transform: scale(1.05);
        }

        a:active,
        button:active,
        input[type="button"]:active,
        input[type="submit"]:active {
            background-color: rgb(0, 141, 188);
        }

        a{
            text-decoration: none;
        }

        input[type="text"],input[type="password"] {
            border-style: solid;
            border-color: rgb(170, 170, 170);
            border-width: 2px;
            border-radius: 6px;
            outline: none;
            margin: 4px;
            font-size: 16px;
            padding: 4px;
            transition: all 0.2s;
        }

        input[type="text"]:focus,,input[type="password"] :focus {
                                      border-color: rgb(70, 70, 70);
                                  }

        .login{
            text-align: center;
        }

    </style>
</head>
<body>

<div id="login" class="login">
    <h1 class="login title">login</h1>
    <form action="/projectBank/Userlogin" method="post">
        <input type="text" name="username"><br>
        <input type="password" name="password"><br>
        <input type="submit" value="submit"><br>
    </form>
    <a href="register.jsp">register here</a>
</div>

<script type="text/javascript">

</script>


</body>
</html>