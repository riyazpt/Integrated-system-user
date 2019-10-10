# Integrated-system-user
Small Application Role Management using lumen 5.4<br/>
### Lumen
Lumen is a micro-framework built on top of Laravel. The framework is used to build faster REST APIs.I have used Lumen 5.4 for this project.<br/>
Ref:	 https://lumen.laravel.com/

### Json Web token(JWT)
JWT  token grand access to resources on authentication. The package tymon/jwt  is used with lumen for generating token.<br/>
Ref: 	https://jwt.io/<br/>
https://iwader.co.uk/post/tymon-jwt-auth-with-lumen-5-2<br/>

## How to set up the project.
1	Open MySQL in your machine.<br/>
2	Create a blank  Database and name it as  integrated_system.<br/>
3	Import  integrated_system.sql  file to integrated_system database.<br/>
4	Go to project folder and open .env file.<br/>
5	Set your MySQL access credentials.<br/>
 DB_USERNAME=your db username.<br/>
DB_PASSWORD= your db password<br/>
6	Go to project folder via command line<br/>
7	Type following command and hit enter.<br/>
php -S localhost:8000 -t public<br/>
     Example c:\Integrated-system-user>php -S localhost:8000 -t public<br/>
Server would be running at localhost:8000<br/>

### API Specification
The main endpoint of this project  is http http://localhost:8000/<br/>
Where basically you will have the URLs open (you don't need the header token):<br/><br/>

### POST http://localhost:8000/auth/login
To get Jwt authentication token you have to login to the system using credentials of superadmin.Data is to be sent in json format. Once you have logged in you have to send token in each request header.<br/>

#### Sample Payload
{
<br/>
"user_name": "superadmin", <br/>
"password": "123"<br/>
}
<br/>
### Sample Success Response

{
"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXV0aFwvbG9naW4iLCJpYXQiOjE1NzA2OTQxMjQsImV4cCI6MTU3MDY5NzcyNCwibmJmIjoxNTcwNjk0MTI0LCJqdGkiOiJWZFVaWTAwcmJxSFE1Y3NIIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.WLRxruEpI5uBNA8GrrfZsJRYm3Q9HUBgXyzTH1RXk3A"
}
<br/>
### POST http://localhost:8000/api/v1/create/user
For creating a new user you can make use of this API.<br/>
### Sample Payload
{
<br/>
"user_name": "fayas", <br/>
"password": "1234",<br/>
" role_id ": "4",<br/>
}
<br/>

### Sample Success Response
{
    "message": "User created"
}
<br/>

### POST http://localhost:8000/api/v1/update/user/{user_id}
example:http://localhost:8000/api/v1/update/user/2

For updating a existing user you can make use of this API.You can’t change the role of super user.<br/>

### Sample Payload
{
<br/>
"role_id ": "2",
<br/>
}
<br/>
### Sample Success Response
{
    "message": "User Updated"
}

### if composer install not working

if the composer install not working properly please unzip vendor.zip folder and replace existing vendor folder
