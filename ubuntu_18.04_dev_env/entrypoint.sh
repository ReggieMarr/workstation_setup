#!/bin/sh# Get standard cali USER_ID variable
USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001} # Change 'me' uid to host user's uid
<<<<<<< HEAD
if [ ! -z "$USER_ID" ] && [ "$(id -u me)" != "$USER_ID" ]; then
    # Create the user group if it does not exist
    groupadd --non-unique -g "$GROUP_ID" group    # Set the user's uid and gid
    usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" me
fi

# Setting permissions on /home/me
chown -R me: /home/me # Setting permissions on docker.sock
chown me: /var/run/docker.sock
=======
if [ ! -z "$USER_ID" ] && [ "$(id -u $USER)" != "$USER_ID" ]; then
    # Create the user group if it does not exist
    groupadd --non-unique -g "$GROUP_ID" group    # Set the user's uid and gid
    usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" $USER
fi

# Setting permissions on /home/me
chown -R $USER: /home/$USER # Setting permissions on docker.sock
chown $USER: /var/run/docker.sock
>>>>>>> master
