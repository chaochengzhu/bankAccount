<!DOCTYPE html>
<html lang="en">

<head>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <meta charset="UTF-8">
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

        input[type="text"] {
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

        input[type="text"]:focus {
            border-color: rgb(70, 70, 70);
        }

        a{
            text-decoration: none;
        }

        .panel1 {
            padding: 10px;
            background-color: rgba(128, 128, 128, 0.168);
            border-width: 0;
            border-radius: 8px;
            min-height: 240px;
            width: fit-content;
            margin-bottom: 10px;
            margin-top: 20px;
            overflow: hidden;
        }

        .panel1_1 {
            float: left;
            margin-top: 18px;
            margin-right: 80px;
            margin-bottom: 30px;
        }

        .panel1_2 {
            margin-top: 18px;
            float: left;
        }

        .logout {
            float: right;
            top: 30px;
            position: relative;
            margin-right: 10px;
        }

        .logout a{
            font-size: 20px;
            text-decoration: none;
        }


        .panel1_outter {
            width: fit-content;
            height: fit-content;
            margin: auto;

        }

        .panel0 {
            height: 80px;
            width: 100%;
            background-color: cadetblue;
            position: sticky;
            top: 0px;
            box-shadow: 0px 8px 20px rgb(74, 74, 74);
        }

        .panel0 h1 {
            float: left;
            margin-left: 10px;
        }

        body {
            margin: 0px;
        }

        .checkBalance,
        .deposit {
            margin-top: 50px;
        }

        .detail {

            min-width: 680px;
            height: fit-content;
        }

        .detail_outter{
            margin: auto;
            width: fit-content;
            height: fit-content;
        }

        .hide{
            display: none;
        }



        #table_info{
            min-width: 500px;
        }



    </style>
</head>

<body>
<div class="panel0">
    <h1>Welcome Back </h1>
    <div class="logout">
        <a href="/projectBank/logout">logout</a>
    </div>
</div>

<div class="panel1_outter">
    <div class="panel1">
        <div class="panel1_1">
            <div class="transaction">
                <form action="/projectBank/transfer" method="post" id="transferService">
                    <table>
                        <tr>
                            <td>to</td>
                            <td><input type="text" name="toAct" id="toAct"></td>
                            <td>
                                <spam id="toActWarning"></spam>
                            </td>
                        </tr>

                        <tr>
                            <td>Amount($)</td>
                            <td><input type="text" name="balance" id="balance"></td>
                            <td>
                                <spam id="transactionWarning"></spam>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td> <input type="button" id="transaction" value="transaction"></td>
                            <td>
                                <spam id="transactionWarning"></spam>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="checkBalance">
                <button id="checkBalance">check your balance</button>
                <spam id="balanceWarning"></spam>
            </div>
        </div>

        <div class="panel1_2">


            <div class="withdraw">
                <form action="/projectBank/withdraw" method="post">
                    Amount($)<input type="text" name="balance" id="withdraw_balance"><br>

                    <input type="button" value="withdraw" id="submit3">
                    <spam id="withdrawWarning"></spam>
                </form>
            </div>

            <div class="deposit">
                <form action="/projectBank/deposit" method="post">
                    Amount($)<input type="text" name="balance" id="deposit_balance"><br>
                    <input type="button" value="deposit" id="submit4">
                    <spam id="depositWarning"></spam>
                </form>
            </div>


        </div>
    </div>
</div>


<div class="detail_outter">
    <div class="detail">
        <button id="yourInfo"> click to show your information</button>
        <spam id="detailInfo hide"></spam>

        <table id="table_info" class="hide">
            <tr>
                <td>username</td>
                <td id="table_username"></td>
            </tr>
            <tr>
                <td>sex</td>
                <td id="table_sex"></td>
            </tr>
            <tr>
                <td>dob</td>
                <td id="table_dob"></td>
            </tr>
            <tr>
                <td>pid</td>
                <td id="table_pid"></td>
            </tr>
            <tr>
                <td>telephone</td>
                <td id="table_telephone"></td>
            </tr>

            <tr>
                <td>address</td>
                <td id="table_address"></td>
            </tr>
            <tr>
                <td>actno</td>
                <td id="table_actno"></td>
            </tr>
            <tr>
                <td>balance</td>
                <td id="table_balance"></td>
            </tr>


        </table>

    </div>
</div>


<script>



    $(function () {

        $("#transaction").click(function () {
            if ($("#toActWarning").html() == "" && $("#balance").val() != "") {

                document.getElementById("transferService").submit();
            } else {
                $("#transactionWarning").html("<font color='red'>you must enter both blank</font>")
            }
        })

        $("#yourInfo").click(function () {
            $.ajax({
                url: "/projectBank/detail",
                type: "post",
                dataType: "text",
                success: function (resp) {

                    $("#detailInfo").html(resp);
                    var info = JSON.parse(resp);

                    for (var key of Object.keys(info)) {
                        document.getElementById("table_" + key).innerText = info[key];
                    }

                    document.getElementById("table_info").classList.remove("hide");
                }

            })

        })

        $("#fromAct").focus(function () {
            $("#fromActWarning").html("");
        })


        $("#toAct").blur(function () {
            var value = $("#toAct").val();
            $.ajax({
                url: "/projectBank/checkAccountExistence",
                type: "post",
                data: {
                    "Act": value
                },
                dataType: "text",
                success: function (resp) {
                    $("#toActWarning").html(resp);
                }

            })

        })

        $("#toAct").focus(function () {
            $("#toActWarning").html("");
        })



        $("#checkBalance").click(function () {
            $.ajax({
                url: "/projectBank/checkBalance",
                type: "post",
                dataType: "text",
                success: function (resp) {
                    $("#balanceWarning").html(resp);
                }

            })

        })



        $("#submit3").click(function () {
            if ($("#withdraw_balance").val() != "") {

                document.getElementById("submit3").parentElement.submit();
            } else {
                $("#withdrawWarning").html("<font color='red'>can not be empty</font>")
            }
        })

        $("#submit4").click(function () {
            if ($("#deposit_balance").val() != "") {

                document.getElementById("submit4").parentElement.submit();
            } else {
                $("#depositWarning").html("<font color='red'>can not be empty</font>")
            }
        })

    })
</script>
</body>

</html>