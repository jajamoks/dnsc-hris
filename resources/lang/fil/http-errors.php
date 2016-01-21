<?php

return [

    '400' => 'The server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).',
    '401' => 'You are trying to access an administrator page.',
    '403' => 'You are not authorized to view the requested resource.',
    '404' => 'Hindi mahanap sa site ang iyong ni-request na resource. Maaring hindi ito available ngayon.',
    '405' => 'A request was made of a resource using a request method not supported by the resource.',
    '406' => 'The requested resource is only capable of generating content not acceptable according to the Accept headers sent in the request.',
    '407' => 'The client must first authenticate itself with the proxy.',
    '408' => 'The server timed out waiting for the request. The process reached the maximum time limit allowed.',
    '409' => 'The request could not be processed because of conflict in the request, such as an edit conflict in the case of multiple updates.',
    '410' => 'The resource requested is no longer available and will not be available again.',
    '498' => 'The token has expired.',
    '499' => 'This request requires token to be passed alongside.',
    '500' => 'Something went wrong with the server. Try again later',
    '501' => 'The request sent was not already implemented.',
    '502' => 'The server was acting as a gateway or proxy and received an invalid response from the upstream server.',
    '503' => 'The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.',
    '504' => 'The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.',
    '505' => 'The server does not support the HTTP protocol version used in the request.',
    '508' => 'Infinite loop detected.',
    '511' => 'You need to authenticate to gain network access.',
    '599' => 'Network connection timeout',

];
