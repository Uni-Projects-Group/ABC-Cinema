<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${sessionScope.userID == null && sessionScope.payable == null}">
    <c:redirect url="index.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ABC Cinema</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/order.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://www.paypal.com/sdk/js?client-id=AWyPjOnNTcB2BXCzP1nKC8g6RtWJFXM_28F8z_1TxMqdRI8ram4qDIkxsD0oSMFwIWfZQ1iVYZHz5aEX"></script>
</head>
<body>

<div class="pform">
    <c:choose>
        <c:when test="${param.status == 'true'}">
            <div class="t">
                <!-- include payment SUCCESS message here -->
                <p>Passed</p>
                <a href="index.jsp">Back to Index</a>
            </div>
        </c:when>
        <c:when test="${param.status == 'false'}">
            <div class="t">
                <!-- include payment FAILED message here -->
                <p>Failed</p>
                <a href="index.jsp">Back to Index</a>
            </div>
        </c:when>
        <c:otherwise>
            <c:set var="amount" value="${sessionScope.payable}"/>
            <h1>ticket payment</h1>
            <div class="t">
                <p>Total amount: <b>$${amount}</b></p>
            </div>
            <div id="paypal-button-container"></div>
        </c:otherwise>
    </c:choose>
</div>

<script>
    paypal.Buttons({
        createOrder: function (data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        // value: '0.1'
                        value: ${amount}
                    }
                }]
            });
        },
        onApprove: function (data, actions) {
            // This function captures the funds from the transaction.
            return actions.order.capture().then(function (details) {
                // alert("Payment complete.")
                // console.log(data.orderID);
                fetch('/confirm', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'orderID='.concat(data.orderID),
                }).then((response) => {
                    if (response.status === 200) {
                        window.location = "order.jsp?status=true"
                    } else {
                        window.location = "order.jsp?status=false"
                    }
                });
            });
        },
        onCancel: function (data) {
            console.log(data);
            // alert("Payment cancelled.")
        },
        onError: function (err) {
            // console.error(err);
            alert("Something went wrong, please try again later.")
        }
    }).render('#paypal-button-container');
</script>

</body>
</html>
