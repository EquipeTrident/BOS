<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8"/>
		<title>Gestion de Stages</title>
		<link rel="stylesheet" href="Content/css/log.css"/>
	</head>
	<body>
		<main>

       <div class="form">
      <form action="?controller=login&action=verif" method="post">


      <img src="Content/img/logoUniv2.png" alt="">
    <span class="logintext"><p>Ouvrir une session</p></span>


    <div class="username">
        <input class="input100" type="text" name="username" placeholder="Nom d'utilisateur">
        </div>

        <div class="password" >
        <input class="input100" type="password" name="pass" placeholder="mot de passe">
        </div>


        <div class="remember">
        <label class="checkboxmsg" for="rmb">Se souvenir de moi</label>
        <input class="checkbox1" id="rmb" type="checkbox" name="remember-me">
        </div>

        <div class="logindiv">
        <input class="log" type="submit" value="Me connecter">
        </div>


        <?php
          if (isset($_POST['username'])) {
            foreach ($compte as $personne) {
              if($personne['username'] == $_POST['username'] && $personne['password'] == $_POST['password']){
                  header("Location: index.php");
              }
            }
          }
        ?>

      </form>
      </div>
    </main>
  </body>
</html>
