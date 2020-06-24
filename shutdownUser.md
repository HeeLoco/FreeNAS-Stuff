https://askubuntu.com/questions/137483/how-to-create-a-shutdown-user-or-shutdown-account

I came to the same conclusion as reverendj1. Here is what I did:

Based on: http://www.cyberciti.biz/tips/shutdown-account-to-shutdown-linux-server.html http://ubuntuforums.org/archive/index.php/t-1238165.html

    Create the user
    sudo adduser --system shutdown

    Set new user's password
    sudo passwd shutdown

    Create a script that does shutdown
    sudo vi /home/shutdown/shutdown_script.sh
        single line: in script /usr/bin/sudo /sbin/shutdown -h now

    Set permissions for the script
        sudo chown shutdown:nogroup /home/shutdown/shutdown_script.sh
        sudo chmod 500 /home/shutdown/shutdown_script.sh

    Edit the user's login
    sudo vi /etc/passwd
        change
        shutdown:x:106:65534::/home/shutdown:/bin/false
        to
        shutdown:x:106:65534::/home/shutdown:/home/shutdown/shutdown_script.sh

    Edit SUDOers file to let user run shutdown: sudo visudo and add at end the following two lines:
        Cmnd_Alias SHUTDOWN=/sbin/shutdown -h now
        shutdown ALL=NOPASSWD: SHUTDOWN

In answer to the second part of my question, a poster at http://ubuntuforums.org/archive/index.php/t-1238165.html implies that creating a shutdown user makes security harder to maintain. I'm not sure why.
