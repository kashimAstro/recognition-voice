<html>
<head>
<title>Voice Recognition</title>
<script></script>
<style>
body{
   background:silver;
   margin:0 0 0 0;
   padding:0px;
   overflow:hidden;
}
.button{
   width:100%;
   height:46%;
   border:2px solid grey;
}
.boxconsole{
   background:black;
   width:100%;
   height:100%;
   margin-top:0px;
   color:white;
   padding:20px;
}
</style>
</head>
<form action="#" method="post">
<center><input name="speak" class="button" type="submit" value="speak"></center>
<center><input name="close" class="button" type="submit" value="close"></center>
</form>
<div class="boxconsole">
<b>
<?php
if(isset($_POST['speak'])){
    $ex=exec("core/./main.sh");
    echo $ex;
}	
if(isset($_POST['close'])){
    $ex=exec("pkill chromium-browser");
    echo $ex;
}
?>
</b>
</div>
</html>

