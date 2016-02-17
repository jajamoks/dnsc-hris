## Davao del Norte State College Human Resource Information System

Davao del Norte State College Human Resoure Information System is a Management Information system built with Laravel, Vuejs, jQuery, node and socket.io. This is a capstone project built with all the love in the world.

## Installation

- Install nodejs (http://nodejs.org/)
- Install bower globally by running "npm install -g bower"
- Install gulp globally by running "npm install -g gulp"
- Download composer at (http://getcomposer.org)
- Clone the repository
- cd to the root directory of the project and run "npm install"
- cd to the public directory and run "bower install"
- after the installation of node_modules, cd to the root directory of the project and run "gulp --production"

## Creating the database

- Run apache server or any available server in your machine.
- rename the file ".env.example" in the root directory of the project to ".env"
- run "php artisan key:generate" so that user sessions and other encrypted data will be secure
- import the hris.sql file to your database 
- change the database configurations in your renamed ".env" file

## Running and serving the web application

- run "php artisan serve" to serve the project and run it into the browser (make sure to put the php path in your system environment variables to make use of php artisan commands)

## Official Documentation of the PHP Framework used

Documentation for the framework can be found on the [Laravel website](http://laravel.com/docs).

### License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
