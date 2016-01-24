<?php
/*
 * Set specific configuration variables here
 */
return [
    // Whether all characters supplied must be replaced with their closest ASCII counterparts
    'ascii'       => false,

    // Image shape: circle or square
    'shape'       => 'circle',

    // Image width, in pixel
    'width'       => 100,

    // Image height, in pixel
    'height'      => 100,

    // Number of characters used as initials. If name consists of single word, the first N character will be used
    'chars'       => 3,

    // font size
    'fontSize'    => 34,

    // Fonts used to render text.
    // If contains more than one fonts, randomly selected based on name supplied
    // You can provide absolute path, path relative to folder resources/laravolt/avatar/fonts/, or mixed.
    'fonts'       => ['OpenSans-Bold.ttf'],

    // List of foreground colors to be used, randomly selected based on name supplied
    'foregrounds' => [
        '#FFFFFF',
    ],

    // List of background colors to be used, randomly selected based on name supplied
    'backgrounds' => [
        '#F76C51',
        '#9CC96B',
        '#4EBCDA',
        '#5FA2DD',
        '#EBAA4B',
    ],

    'border'      => [
        'size'  => 0,

        // border color, available value are:
        // 'foreground' (same as foreground color)
        // 'background' (same as background color)
        // or any valid hex ('#aabbcc')
        'color' => 'foreground',
    ],
];
