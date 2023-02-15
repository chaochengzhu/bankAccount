<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<head>
    <title>Title</title>
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

        input[type="text"],
        input[type="password"],
        input[type="date"] {
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

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus {
            border-color: rgb(70, 70, 70);
        }

        .info_table {
            background-color: rgb(235, 235, 235);
            border-radius: 12px;
            margin: auto;
            padding: 10px;
            min-width: 600px;
        }

        .warning{
            min-width: 180px;
        }

        h1{
            text-align: center;
        }
    </style>
</head>


<body>

<h1>Registration</h1>
<div class="userRegisterInfo">
    <form action="/projectBank/register" method="post" id="userForm">
        <table class="info_table">
            <tr>
                <td>username:</td>
                <td> <input type="text" name="username" id="username" required></td>
                <td class="warning">
                    <spam id="usernameWarning"></spam>
                </td>
            </tr>
            <tr>
                <td>sex:</td>
                <td><input type="radio" name="sex" value="M" checked>Male
                    <input type="radio" name="sex" value="F">Female<br>
                </td>

            </tr>
            <tr>
                <td>dob:</td>
                <td><input type="date" name="dob" id="dob"></td>
                <td class="warning">
                    <spam id="dobWarning"></spam>
                </td>
            </tr>

            <tr>
                <td>password:</td>
                <td><input type="password" name="password" id="password" required></td>
                <td class="warning">
                    <spam id="passwordWarning"></spam>
                </td>
            </tr>


            <tr>
                <td>repeat your password</td>
                <td><input type="password" name="repeat" id="repeat"></td>
                <td class="warning">
                    <spam id="repeatWarning"></spam>
                </td>
            </tr>

            <tr>
                <td>PID:</td>
                <td> <input type="text" name="PID" id="PID" required></td>
                <td class="warning">
                    <spam id="AjaxWarning"></spam>
                </td>
            </tr>

            <tr>
                <td>openMoney</td>
                <td> <input type="text" name="openMoney" id="openMoney" required></td>
                <td class="warning">
                    <spam id="openMoneyWarning"></spam>
                </td>
            </tr>

            <tr>
                <td>telephone:</td>
                <td> <input type="text" name="telephone" id="telephone" required></td>
                <td class="warning">
                    <spam id="telephoneWarning"></spam>
                </td>
            </tr>

            <tr>
                <td>address:</td>
                <td> <input type="text" name="address" id="address" required></td>
                <td class="warning">
                    <spam id="addressWarning"></spam>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: right;">
                    <input type="button" id="submit1" value="submit">
                    <button type="button" id="reset" id="reset">reset</button>
                    <a href="/projectBank/index.jsp">goback</a>
                </td>
            </tr>



        </table>
    </form>


</div>


<script type="text/javascript">

    // $("#openMoney").blur(function () {
    //
    //     var number = parseFloat($("#openMoney").val());
    //     alert(number)
    //     if(isNaN(number)){
    //         $("#openMoneyWarming").html("illegal input")
    //     }
    //
    // })


    $("#username").blur(function () {
        var value = $("#username").val();
        $.ajax({
            url: "/projectBank/checkUsername",
            type: "post",
            data: {
                "username": value
            },
            dataType: "text",
            success: function (resp) {
                $("#usernameWarning").html(resp);
            }

        })

    })


    //$(function () {
    $("#PID").blur(function () {
        var PIDvalue = $("#PID").val();
        $.ajax({
            url: "/projectBank/checkPID",
            type: "post",
            data: {
                "PID": PIDvalue
            },
            dataType: "text",
            success: function (resp) {

                $("#AjaxWarning").html(resp);
            }

        })

    })





    $("#reset").click(function () {
        document.getElementById("username").value = "";
        document.getElementById("dob").value = "";
        document.getElementById("password").value = "";
        document.getElementById("repeat").value = "";
        document.getElementById("PID").value = "";
        document.getElementById("openMoney").value = "";
        document.getElementById("telephone").value = "";
        document.getElementById("address").value = "";


    })

    document.getElementById("submit1").onclick = function () {
        /*
                    $("#username").focus();
                    $("#username").blur();
                    $("#password").focus();
                    $("#password").blur();
                    $("#telephone").focus();
                    $("#telephone").blur();
                    $("#address").focus();
                    $("#address").blur();
        */

        var value = $("#username").val();

        value = value.trim()
        if (value) {
            $("#usernameWarning").html("")
        } else {
            $("#usernameWarning").html("<font color='red'>username can not be null</font>")
        }

        value = $("#password").val();
        if (value.length < 8) {
            $("#passwordWarning").html("<font color='red'>password less than 8</font>");
        } else {
            $("#passwordWarning").html("");
        }


        value = $("#dob").val();
        if (value.length==0) {
            $("#dobWarning").html("<font color='red'>illegal input</font>");
        } else {
            var date = new Date(value);
            var yr = date.getFullYear()
            if (yr >= 1900 && yr <= 2023) {
                $("#dobWarning").html("");
            } else {
                $("#dobWarning").html("<font color='red'>illegal input</font>");
            }
        }


        if ($("#repeat").val() != $("#password").val()) {
            $("#repeatWarning").html("<font color='red'>make sure the password are the same</font>")
        } else {
            $("#repeatWarning").html("")
        }

        value = $("#telephone").val();
        if (value.length != 10) {
            $("#telephoneWarning").html("<font color='red'>illegal phone number</font>")
        } else {
            $("#telephoneWarning").html("")
        }

        value = $("#address").val();
        if (value.length == 0) {
            $("#addressWarning").html("<font color='red'>illegal adress number</font>")
        } else {
            $("#addressWarning").html("")
        }

        value = $("#openMoney").val().trim();
        if (value.length <1 || isNaN(value) || parseFloat(value) <0.01) {
            $("#openMoneyWarning").html("<font color='red'>illegal number</font>")
        } else {
            $("#openMoneyWarning").html("")
        }


        if ($("#passwordWarning").html() == "" && $("#repeatWarning").html() == "" && $("#addressWarning").html() == "" && $("#telephoneWarning").html() === "" && $("#AjaxWarning").html() === "" && $("#openMoneyWarning").html() === "" && $("#dobWarning").html() === "") {
            alert();
            document.getElementById("userForm").submit();
        }


    }



</script>
</body>

</html>