#!/bin/fish

function __find_ssh_agent_sockets -d "find ssh-agent sockets"
	find /tmp -uid (id -u) -type s -name agent.\* 2>/dev/null
end

function __test_ssh_agent_socket -d "test ssh-agent socket"
    if [ ! -x (command which ssh-add) ] ;
        # echo "ssh-add is not available; agent testing aborted"
        return 1
    end

    if [ X"$argv[1]" != X ] ;
    	set -xg SSH_AUTH_SOCK $argv[1]
    end

    if [ X"$SSH_AUTH_SOCK" = X ]
    	return 2
    end

    if [ -S $SSH_AUTH_SOCK ] ;
        ssh-add -l > /dev/null
        if [ $status = 2 ] ;
            # echo "Socket $SSH_AUTH_SOCK is dead!  Deleting!"
            rm -f $SSH_AUTH_SOCK
            return 4
        else ;
            # echo "Found ssh-agent $SSH_AUTH_SOCK"
            return 0
        end
    else ;
        # echo "$SSH_AUTH_SOCK is not a socket!"
        return 3
    end
end

function __find_ssh_keys -d "find all ssh keys"
    find ~/.ssh -regextype posix-extended -type f -not -regex ".*(\\.pub|known_hosts.*|config)" 2>/dev/null
end

function __load_ssh_keys -d "load all ssh keys to the agent"
    for key in (__find_ssh_keys)
        # echo "Loading $key to the agent"
        ssh-add $key
    end
end


function __init_ssh_agent -d "init a ssh-agent"
    # ssh agent sockets can be attached to a ssh daemon process or an
    # ssh-agent process.

    set -l AGENTFOUND 0

    # Attempt to find and use the ssh-agent in the current environment
    if __test_ssh_agent_socket ;
        set AGENTFOUND 1
    end

    # If there is no agent in the environment, search /tmp for
    # possible agents to reuse before starting a fresh ssh-agent
    # process.
    if [ $AGENTFOUND = 0 ];
        for agentsocket in (__find_ssh_agent_sockets)
            if [ $AGENTFOUND != 0 ] ;
	            break
            end
            if __test_ssh_agent_socket $agentsocket ;
	       set AGENTFOUND 1
	    end

        end
    end

    # If at this point we still haven't located an agent, it's time to
    # start a new one
    if [ $AGENTFOUND = 0 ] ;
	echo need to start a new agent
	eval (ssh-agent -c)
    end

    # Finally, show what keys are currently in the agent
    # ssh-add
    ssh-add -l > /dev/null
    if [ $status = 1 ] ;
        # echo "No keys are loaded into the agent"
        __load_ssh_keys
    end
end

