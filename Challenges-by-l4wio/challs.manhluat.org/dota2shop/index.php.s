<pre>
<!-- index.php.s | Flag is admin's password (table: users)-->
<h1 style='text-align:center'>Dota2's Items Shop</h1>
<?php
	if(empty($_GET['cat']) || empty($_GET['id']))
		die(header("Location: ?cat=1&id=1"));

	function _query($query){
		$exec_query = mysql_query($query) or die("<h2 style='color:Red'>MYSQL QUERY FAILED: $query</h2>\n".mysql_error());
		$row = mysql_fetch_array($exec_query);
		return $row;
	}
	$db_name = 'dota2_shop';
	mysql_connect('localhost','dota2_shop','dota2_shop');
	mysql_select_db($db_name);

	$id 	= $_GET['id'];
	$cat 	= $_GET['cat'];

	$filter = _query("SELECT group_concat(column_name) FROM information_schema.columns WHERE table_schema='{$db_name}'"); // filter all column_name ....oh well done
	$filter = $filter[0].',\(,\),\.'; // ( ) . too
	if(preg_match('#('.str_replace(',','|',$filter).')#is',(string)$cat.(string)$id,$hacker))
		die("<h2 style='color:Red'>Hackers detected!!! [{$hacker[1]}]</h2>");

	$row = _query("SELECT * FROM shops WHERE id={$id}");
	echo "<title>{$row['title']}</title>\n<h1 style='color:Green'>{$row['title']}</h1>\n{$row['content']}\n\n";

	$row = _query("SELECT * FROM shops WHERE cat={$cat} AND id != {$id}");
	echo "<h2><li>Related items: <a href='?cat={$cat}&id={$row['id']}'>{$row['title']}</a></h2>";

	
?>
</pre>