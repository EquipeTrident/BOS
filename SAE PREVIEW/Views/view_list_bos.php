

<table>
    <tr> <th>identifiant bos</th> <th>identifiant Etudiant</th> <th class="sansBordure"></th> <th class="sansBordure"></th></tr>

    <?php foreach ($liste as $pn) : ?>
    <tr>
        <td> <?= e($pn['bos_id']) ?> </td>
        <td> <?= e($pn['student_id']) ?> </td>
    </tr>
    <?php endforeach ?>
</table>
