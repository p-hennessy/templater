Author: Patrick Hennessy
E-Mail: PH7VC@mail.missouri.edu

To install this script:

1) Create a directory called ".templates" in your home directory
    cd ~
    mkdir .templates

2) Download or move all the files from this project into that folder
    mv * ~/.templates

3) You will need to set up an alias to make it eaiser to use
    #bashrc is a file that is called when you login to babbage. Alias is a command that allows you to make complex commands simpler

    vi ~/.bashrc    #Open bashrc
    alias mk2050='~/.templates/template.sh ~/cs2050 ~/.templates/template.c'

    Add that line to your .bashrc file. This will give you the command 'mk2050'

4) Source your .bashrc. This rebuilds your bashrc so you dont have to relog
    source .bashrc

5) To use the command, it follows this syntax:
    mk2050 lab2
    mk2050 hw4

    It will make a file in your cs2050 directory, following the template in template.c.

6) Show it off!

You can modify this easily for other classes by creating a template and providing other information to the alias
    The script actually takes 3 arguments: 
        1 = directory you wish to put your files in
        2 = template file you want to use
        3 = lab/hw#

    So for the databse class you can make the following command

    alias mk3380='~/.templates/template.sh ~/public_html/cs3380 ~/.templates/template.php'

Feel free to share, fork, or improve it! Cheers!
