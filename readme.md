This is an implementation of a login and registration system that is based on the MVC architecture with integeration of google api for login and registration as part of an interview task at sharp mobile. by Amr Abdelmonem

1. open the commmand shell in any directroy for example "cd c:/users/dell/project"
2. use the command "git clone https://github.com/amreltanawy/interviewfinal.git task" to download the repository to your local machine
3. next you need to open the repository "cd .\task\" the folder should look something like this "c:/users/dell/project/task <master >
4.  now you are ready to start the vagrant box by typing "vagrant up" in your command shell
5. next open the vagrant directory by "cd /vagrant" command in your shell
6. type in the shell "vagrant ssh" to connect to the virtual machine
7. copy the following line in your host file "192.168.10.101	sharpmobile.task.com"
8. next "php artisan serve --host=0.0.0.0:8000" 
9. now you have started the webserver successfully, you can open it from your browser using either the address "192.168.10.101:8000" or "http://sharpmobile.task.com:8000"
10. enjoy the demo.