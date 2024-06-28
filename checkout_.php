<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://www.paypal.com/sdk/js?client-id=AexbMl2MLhLXLLpwYUIZiZPkY73dcYZR2GFIMA4Wvl_XW3AlZcq9H71_VlxSbN-n6vnsChXH_8Ig2tKM&currency=MXN"></script>
</head>

<body>

    <div id="paypal-button-container"></div>

    <script>
        paypal.Buttons({
            style: {
                color: 'blue',
                shape: 'pill',
                label: 'pay'
            },
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: 140
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                actions.order.capture().then(function(detalles) {
                    window.location.href = "complete.html";
                })
            },
            onCancel: function(data) {
                alert("pago anulado");
                console.log(data)
            }
        }).render('#paypal-button-container');
    </script>
</body>

</html>