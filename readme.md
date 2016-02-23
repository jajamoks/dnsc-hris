## Davao del Norte State College Human Resource Information System

Davao del Norte State College Human Resoure Information System is a Management Information system built with Laravel PHP Framework, Vuejs, jQuery, node and socket.io. This is a capstone project built with all the love in the world. 

## Installation

- Install nodejs (http://nodejs.org/)
- Install bower globally by running `npm install -g bower`
- Install gulp globally by running `npm install -g gulp`
- Download composer at (http://getcomposer.org)
- Clone the repository
- cd to the root directory of the project and run `npm install` to install the node_modules needed in the project
- cd to the public directory and run `bower install`
- After the installation of node_modules, cd to the root directory of the project and run `gulp --production` or `gulp` to compile the required fonts, css and js files. (Make sure gulp is installed globally)

## Creating the database

- Run apache server or any available server in your machine.
- rename the file ".env.example" in the root directory of the project to ".env"
- run `php artisan key:generate` so that user sessions and other encrypted data will be secure
- import the hris.sql file to your database
- run `php artisan migrate` (<b><i>WARNING</i></b>: Migrations file are not updated. This might cause errors in the system. Better not run this, just import the hris.sql file only.) 
- change the database configurations in your renamed ".env" file

## Running and serving the web application

- run `php artisan serve` to serve the project and run it into the browser (make sure to put the php path in your system environment variables to make use of php artisan commands)
- type "localhost:8000" (by default) in the url box of the browser to view the website

## Running the node server to make use of realtime features

- Install redis at http://redis.org/ and run
- cd to the root directory of the project and run `npm start`
- in the root directory of the project run also `php artisan queue:listen`

## Official website

The official website can be found in (http://hris.dnscpanabo.com/)

## Official Documentation of the Framework used

- <b>Laravel</b> Documentation for the framework can be found on the [Laravel website](http://laravel.com/docs).
- <b>Vue.js</b> Visit [Vuejs website](http://vuejs.org) for more information
- <b>Socket.io</b> Used for realtime functionality in the system. [Socket.io](http://socket.io)
- <b>[Node.js](http://nodejs.org)</b>

### License

The Laravel framework is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
