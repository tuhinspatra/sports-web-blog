<?php

  function humanTiming ($time)
{

    $time = time() - $time; // to get the time since that moment
    $time = ($time<1)? 1 : $time;
    $tokens = array (
        31536000 => 'year',
        2592000 => 'month',
        604800 => 'week',
        86400 => 'day',
        3600 => 'hour',
        60 => 'minute',
        1 => 'second'
    );

    foreach ($tokens as $unit => $text) {
        if ($time < $unit) continue;
        $numberOfUnits = floor($time / $unit);

        if($numberOfUnits>1 && $numberOfUnits<6)
          return 'few '.$text.'s';
        if($numberOfUnits>1)
          return $numberOfUnits.' '.$text.'s';
        if($numberOfUnits==1)
          return 'a '.$text;
        else 
          return $numberOfUnits.' '.$text;
    }

}

function humanTiming1 ($time)
{

    $time = time() - $time; // to get the time since that moment
    $time = ($time<1)? 1 : $time;
    $tokens = array (
        31536000 => 'year',
        2592000 => 'month',
        604800 => 'week',
        86400 => 'day',
        3600 => 'hour',
        60 => 'minute',
        1 => 'second'
    );

    foreach ($tokens as $unit => $text) {
        if ($time < $unit) continue;
        $numberOfUnits = floor($time / $unit);
       
        if($numberOfUnits>0)
          return $numberOfUnits.' '.$text.'s';
        
        else 
          return $numberOfUnits.' '.$text;
    }

}



?>