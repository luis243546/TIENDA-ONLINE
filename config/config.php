<?php
define("KEY_TOKEN", "APR.wqc-354*");
define("CLIENT_ID", "AexbMl2MLhLXLLpwYUIZiZPkY73dcYZR2GFIMA4Wvl_XW3AlZcq9H71_VlxSbN-n6vnsChXH_8Ig2tKM");
define("CURRENCY", "MXN");
define("MONEDA", "$");
session_start();

$num_cart = 0;
if (isset($_SESSION['carrito']['productos'])) {
    $num_cart = count($_SESSION['carrito']['productos']);
}
