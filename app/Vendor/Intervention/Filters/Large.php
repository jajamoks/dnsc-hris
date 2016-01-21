<?php

namespace DNSCHumanResource\Vendor\Intervention\Filters;

use Intervention\Image\Filters\FilterInterface;
use Intervention\Image\Image;

class Large implements FilterInterface
{

    public function applyFilter(Image $image)
    {
        return $image->fit(75, 75);
    }

}
