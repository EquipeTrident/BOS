<table>
    <tr> <th>document ID</th> <th>Type</th> <th>student ID</th> <th>Version</th> <th class="sansBordure"></th> <th class="sansBordure"></th></tr>

    <?php foreach ($liste as $doc) : ?>
    <tr>
        <td> <?= e($doc['document_id']) ?> </td>
        <td> <?= e($doc['type']) ?> </td>
        <td> <?= e($doc['student_id']) ?> </td>
        <td> <?= e($doc['version']) ?> </td>
    </tr>
    <?php endforeach ?>
</table>
