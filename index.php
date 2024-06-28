<?php

require 'config/database.php';
require 'config/config.php';
$db = new Database();
$con = $db->conectar();

$sql = $con->prepare("SELECT id, nombre, precio FROM productos WHERE activo=1");
$sql->execute();
$resultado = $sql->fetchAll(PDO::FETCH_ASSOC);

/*session_destroy();*/

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online</title>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/styles.css" rel="stylesheet">
</head>

<body>

    <header>
        <div class="navbar navbar-expnag-lg navbar-dark bg-dark ">
            <div class="container">
                <a href="index.php" class="navbar-brand">
                    <strong>Tienda Online</strong>
                </a>
                <a href="#" class="navbar-brand">Catalogo</a>
                <a href="#" class="navbar-brand">Contacto</a>
                <a href="checkout.php" class="btn btn-primary"><i class="uil uil-shopping-cart-alt"></i><span id="num_cart" class="badge bg-secondary"><?php echo $num_cart; ?></span></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarHeader">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a href="#" class="nav-link active">Catalogo</a></li>
                        <li class="nav-item"><a href="#" class="nav-link active">Contacto</a></li>
                    </ul>
                    <a href="checkout.php" class="btn btn-primary"><i class="uil uil-shopping-cart-alt"></i><span id="num_cart" class="badge bg-secondary"><?php echo $num_cart; ?></span></a>
                    <br>
                </div>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <?php foreach ($resultado as $row) { ?>
                    <div class="col">
                        <div class="card shadow-sm">
                            <?php
                            $id = $row['id'];
                            $imagen = "images/productos/" . $id . "/principal.jpg";

                            if (!file_exists($imagen)) {
                                $imagen = "images/no-photo.jpg";
                            }
                            ?>
                            <img src="<?php echo $imagen; ?>" width="300" height="400">
                            <div class="card-body">
                                <h5 class="card-title"><?php echo $row['nombre'] ?></h5>
                                <p class="card-text">$<?php echo number_format($row['precio'], 2, '.', ','); ?></p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="btn-group">
                                        <a href="details.php?id=<?php echo $row['id']; ?>&token=<?php echo hash_hmac('sha1', $row['id'], KEY_TOKEN); ?>" class="btn btn-primary">Detalles</a>
                                    </div>
                                    <button class="btn btn-outline-success" type="button" onclick="addProducto(<?php echo $row['id']; ?>, '<?php echo hash_hmac('sha1', $row['id'], KEY_TOKEN); ?>')">Agregar al carrito</button>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </main>
    <footer class="bg-light text-dark mt-4 py-4 border-top" style="position: fixed;
        bottom: 0;
        width: 100%;
        padding-top: 15px;
        padding-bottom: 15px;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>Sobre Nosotros</h5>
                    <p>Somos una empresa dedicada a ofrecer los mejores productos a precios irresistibles. Nuestro compromiso es con la calidad y la satisfacción del cliente.</p>
                </div>
                <div class="col-md-4">
                    <h5>Enlaces Rápidos</h5>
                    <ul class="list-unstyled">
                        <li><a href="index.php" class="text-dark">Inicio</a></li>
                        <li><a href="registros.php" class="text-dark">Servicios</a></li>
                        <li><a href="#" class="text-dark">Contacto</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Contacto</h5>
                    <p>
                        <i class="fa fa-map-marker"></i> Dirección: Jesus Nazareno<br>
                        <i class="fa fa-phone"></i> Teléfono: +51 919734199<br>
                        <i class="fa fa-envelope"></i> Email: luisangelcalleallcca@gmail.com
                    </p>
                    <div>
                        <a href="https://www.facebook.com/luis.ca.31392" class="text-dark me-2"><i class="fab fa-facebook"></i></a>
                        <a href="https://wa.me/51919734199?text=Gracias%20por%20contactarnos" class="text-dark me-2"><i class="fab fa-whatsapp"></i></a>
                        <a href="https://www.instagram.com/lewis_4548?igsh=ZGUzMzM3NWJiOQ==" class="text-dark me-2"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="text-center mt-3">
                copyright &copy; 2024 Mi Empresa. Todos los derechos reservados.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <script>
        function addProducto(id, token) {
            let url = 'clases/carrito.php'
            let formData = new FormData()
            formData.append('id', id)
            formData.append('token', token)

            fetch(url, {
                method: 'POST',
                body: formData,
                mode: 'cors'
            }).then(response => response.json()).then(data => {
                if (data.ok) {
                    let elemento = document.getElementById("num_cart")
                    elemento.innerHTML = data.numero
                }
            })
        }
    </script>
</body>

</html>