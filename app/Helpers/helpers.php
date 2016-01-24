<?php

if (!function_exists('appendZero')) {

    function appendZero($number)
    {
        $numberToString = (String) $number;
        if (strlen($numberToString) == 1) {
            return '00' . $numberToString;
        } elseif (strlen($numberToString) == 2) {
            return '0' . $numberToString;
        } else {
            return $numberToString;
        }
    }

}

if (!function_exists('getProfilePhotoPath')) {

    function getProfilePhotoPath($employee)
    {
        if ($employee) {
            return '/uploads/' . $employee->user->username . '/profile-pictures/' . $employee->photo;
        }
        return '/img/default.png';
    }

}

if (!function_exists('getAdmin')) {

    function getAdmin()
    {
        return HumanResource::admin();
    }

}

if (!function_exists('getFinanceDirector')) {

    function getFinanceDirector()
    {
        return HumanResource::financeDirector();
    }

}

if (!function_exists('getPresident')) {

    function getPresident()
    {
        return HumanResource::president();
    }

}

if (!function_exists('nameFile')) {

    function nameFile($extension)
    {
        return str_random(32) . '.' . $extension;
    }

}

if (!function_exists('itexmo')) {

    function itexmo($number, $message)
    {
        $url    = 'https://www.itexmo.com/php_api/api.php';
        $itexmo = ['1' => $number, '2' => $message, '3' => config('hris.itexmo.api')];
        $param  = [
            'http' => [
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($itexmo),
            ],
        ];
        $context = stream_context_create($param);
        return file_get_contents($url, false, $context);
    }

}

if (!function_exists('itexmo_balance')) {

    function itexmo_balance()
    {
        $url    = 'https://www.itexmo.com/php_api/api.php';
        $itexmo = ['4' => config('hris.itexmo.api')];
        $param  = [
            'http' => [
                'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
                'method'  => 'POST',
                'content' => http_build_query($itexmo),
            ],
        ];
        $context = stream_context_create($param);
        return file_get_contents($url, false, $context);
    }
}

if (!function_exists('getNotificationLink')) {

    function getNotificationLink($notification)
    {
        return $notification->object ? $notification->object->getNotificationLink() : null;
    }

}

if (!function_exists('viewDocumentOnline')) {

    function viewDocumentOnline($file_path)
    {
        $office_path = 'http://view.officeapps.live.com/op/view.aspx?src=';
        return $office_path . $file_path;
    }

}

if (!function_exists('inclusive_dates')) {

    function inclusive_dates($date_from, $date_to, $format = 'M d, Y', $separator = '-')
    {
        return date($format, strtotime($date_from)) . ' ' . $separator . ' ' . date($format, strtotime($date_to));
    }

}

if (!function_exists('to_currency')) {

    function to_currency($currency, $locale = null)
    {
        $locale = $locale ?: config('hris.currency');
        return $locale . ' ' . number_format($currency, 2);
    }

}

if (!function_exists('excel_attach_image')) {

    function excel_attach_image($array)
    {
        $drawing = new \PHPExcel_Worksheet_Drawing();
        foreach ($array as $key => $value) {
            $drawing->{'set' . ucfirst($key)}($value);
        }
        return $drawing;
    }

}

if (!function_exists('write_form')) {

    function write_form($writer)
    {
        $writer->handle();
    }

}

if (!function_exists('hris_rating')) {

    function hris_rating($rating)
    {
        if (is_numeric($rating)) {
            return $rating . '%';
        }
        return rating;
    }

}

if (!function_exists('hris_date')) {

    function hris_date($date, $format = 'M d, Y')
    {
        if (null === $date or $date == '0000-00-00') {
            return null;
        }
        return date($format, strtotime($date));
    }

}

if (!function_exists('hris_date_range')) {

    function hris_date_range($from, $to, $separator = '-')
    {
        return hris_date($from) . ' ' . $separator . ' ' . hris_date($to);
    }

}

if (!function_exists('hris_display_string')) {

    function hris_display_string($append, $string)
    {
        if (empty($string)) {
            return null;
        }
        return $append . ' ' . $string;
    }

}

if (!function_exists('check_if_null')) {

    function check_if_null()
    {

    }
}
