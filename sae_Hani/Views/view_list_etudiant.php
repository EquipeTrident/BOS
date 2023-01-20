<table>
    <tr> <th>Numéro étudiant</th> <th>Nom</th> <th>Prénom</th> <th>Groupe</th> <th class="sansBordure"></th> <th class="sansBordure"></th></tr>

    <?php foreach ($liste as $pn) : ?>
    <tr>
        <td class="sansBordure"> <?= e($pn['student_id']) ?> </a></td>
        <td class="sansBordure"> <?= e(ucfirst($pn['nom'])) ?> </td>
        <td class="sansBordure"> <?= e($pn['prenom']) ?> </td>
        <td class="sansBordure"> <?= e($pn['groupe']) ?> </td>
        <td class="sansBordure">
            <a href="?controller=list&action=informations&id=<?= e($pn['student_id']) ?>">
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
