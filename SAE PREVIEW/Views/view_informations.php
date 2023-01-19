<?php require "view_begin.php"; ?>

<h1> <?= e($prenom) ?> <?= e($nom) ?> </h1>

<div class="profilInfo">
<ul>
    <li> L'étudiant : <?= $prenom === null ? '???' : e($prenom) ?> <?= $nom === null ? '???' : e($nom) ?> </li>
    <li> son ID étudiant  : <?= $student_id === null ? '???' : e($student_id) ?> </li>
    <li> Mail : <?= $mail === null ? '???' : e($mail) ?>
    <li> Possède Stage : <?= $stage_dentention === null ? '???' : e($stage_dentention) ?>
    <li> Entreprise ID : <?= $entreprise_id === null ? '???' : e($entreprise_id) ?>
    <li> Groupe : <?= $groupe === null ? '???' : e($groupe) ?>
    <li> Personnel ID : <?= $personnel_id === null ? '???' : e($personnel_id) ?>
    <li> Formation ID : <?= $formation_id === null ? '???' : e($formation_id) ?>
</ul>

<a href="?controller=list&action=boslist&id=<?= e($student_id)?>">Documents</a>

<p>
  Commentaire
</p>
</div>
<form action="?" method="post">
  <textarea id="commentaire" rows="5" cols="30">Commentaire Ici</textarea>
  <br> <br> <br>
  <input type="submit" value="soumettre">
</form>

<?php require "view_end.php"; ?>
