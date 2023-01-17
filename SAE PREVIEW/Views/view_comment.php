<?php require "view_begin.php"; ?>

<h1> <?= e($prenom) ?> <?= e($nom) ?> </h1>

<form action="?controller=list&action=informations&id=<?= e($pn['student_id']) ?>" method="post">
<input type="textarea" name="comment" value="Commentaire Ici" rows="50" cols="33">
</form>

<?php require "view_end.php"; ?>
