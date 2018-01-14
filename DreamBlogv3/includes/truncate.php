<?php 

	function truncate($string,$length=360,$dots="&hellip;")
	{

	  $string= trim($string);
	  return (iconv_strlen($string)>$length)? substr($string,0,$length-iconv_strlen($dots)).$dots:$string;
	} 


?>