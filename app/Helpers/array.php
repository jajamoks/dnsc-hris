<?php

if (!function_exists('hris_array_map')) {

    function hris_array_map($array)
    {
        $content = [];

        $keys = array_divide($array)[0];

        for ($i = 0; $i <= (count(last($array)) - 1); $i++) {
            $virtual = [];
            foreach ($keys as $key) {
                $virtual = array_add($virtual, $key, $array[$key][$i]);
            }
            array_push($content, $virtual);
        }
        return $content;
    }

}
