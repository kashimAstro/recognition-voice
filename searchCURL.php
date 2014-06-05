#!/usr/bin/php
<?php
/* ziggurats code seach google return URL+TITLE */
$query='';
for( $i = 1; $i < count($argv); $i++ ){
   if($i>1)
      $query.='+';
   $query.=$argv[$i];
}
if($query=='')
   $query='google';
   

$url = 'http://ajax.googleapis.com/ajax/services/search/web?rsz=large&v=1.0&hl=el&q='.$query;
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_REFERER, "");//$_SERVER['REQUEST_URI']
$body = curl_exec($ch);
curl_close($ch);
$obj=json_decode($body);

$resultArr=$obj->{'responseData'}->{'results'};
for($i=0;$i<count($resultArr);$i++){
   echo $resultArr[$i]->{'unescapedUrl'}." ";
   //echo strip_tags($resultArr[$i]->{'title'})."\n\n";   
   }

?>