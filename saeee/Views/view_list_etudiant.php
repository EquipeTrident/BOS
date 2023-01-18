

<table>
    <tr> <th>Numéro étudiant</th> <th>Prenom</th> <th>Nom</th> <th>Formation</th> <th class="sansBordure"></th> <th class="sansBordure"></th></tr>

    <?php foreach ($liste as $pn) : ?>
    <tr>
        <td> <?= e($pn['student_id']) ?> </a></td>
        <td> <?= e(ucfirst($pn['prenom'])) ?> </td>
        <td> <?= e($pn['nom']) ?> </td>
        <td> <?= e($pn['formation_id']) ?> </td>
        <td class="sansBordure">
            <a href="?controller=list&action=informations&id=<?= e($pn['formation_id']) ?>">
                <img class="icone" src="Content/img/profile-icon.png" alt="profile"/>
            </a>
        </td>
        <td class="sansBordure">
            <a href="?controller=list&action=boslist&id=<?= e($pn['student_id'])?>">
                <img class="icone" src="Content/img/edit-icon.png" alt="edit"/>
            </a>
        </td>
    </tr>
    <?php endforeach ?>
</table>
