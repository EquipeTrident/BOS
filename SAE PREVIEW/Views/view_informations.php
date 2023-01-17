<?php require "view_begin.php"; ?>

<h1> <?= e($prenom) ?> <?= e($nom) ?> </h1>


<ul>
    <li> L'étudiant : <?= $prenom === null ? '???' : e($prenom) ?> </li>
    <li> son ID étudiant  : <?= $student_id === null ? '???' : e($student_id) ?> </li>
    <li> Formation : <?= $formation_id === null ? '???' : e($formation_id) ?>
</ul>

<a href="?controller=list&action=boslist&id=<?= e($student_id)?>">

<p>
  Commentaire = <br>
</p>

<form action="" method="post">
  <textarea id="commentaire" rows="5" cols="30">Commentaire Ici</textarea>
  <br> <br> <br>
  <input type="submit" value="soumettre">
</form>

<?php require "view_end.php"; ?>
