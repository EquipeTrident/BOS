

<table>
    <tr>  <th>Type</th>  <th>Version</th>  <th>Status</th><th class="sansBordure"></th> <th class="sansBordure"></th></tr>

    <?php foreach ($liste as $doc) : ?>
    <tr>
        
        <td> <?= e($doc['type']) ?> </td>
        <td> <?= e($doc['version']) ?> </td>
        <td> <?= e($doc['status']) ?> </td>
    </tr>
    <?php endforeach ?>
</table>
