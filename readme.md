1. open the commmand shell in any directroy for example "cd c:/users/dell/project"
2. use the command "git clone https://github.com/amreltanawy/interviewfinal.git task"
3. next u need to "cd .\task\" the folder should look something like this "c:/users/dell/project/task <master >
4.  now you are ready to type "vagrant up" in your command shell
5. next type "cd /vagrant"
6. type in the shell "vagrant ssh"
7. copy the following line in your host file "192.168.10.101	sharpmobile.task.com"
8. next "php artisan serve --host=0.0.0.0:8000"
9. now you have started the webserver successfully, you can open it from your browser using either the address "192.168.10.101:8000" or "http://sharpmobile.task.com:8000"
10. enjoy the demo.