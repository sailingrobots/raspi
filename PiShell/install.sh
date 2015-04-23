
    # Aland Sailing Robot #
    # Raspberry Pi  install script #
    
    #-----------------------------------------------------------
    
    source repos.sh
    
    print_result()
    {
            if $1
            then 
                    printf "$PI_SHELL_CLR_OK"
                    printf "Success\n"
            else 
                    printf "$PI_SHELL_CLR_ERR"
                    printf "Failed\n"
            fi
    }

    cd $INSTALLATION_PATH
    printf "$PI_SHELL_CLR_INFO\nDownloading $SAILBOT_REPO_MAIN into $SAILBOT_CLR_DIR$INSTALLATION_PATH$SAILBOT_REPO_MAIN/$PI_SHELL_CLR_INFO\n"
    print_result "git clone https://github.com/pophaax/$SAILBOT_REPO_MAIN"
    cd $SAILBOT_REPO_MAIN
    for MODULE in ${SAILBOT_REPO_MODULES[@]}
    do
            printf "$PI_SHELL_CLR_INFO\nDownloading $MODULE module into $PI_SHELL_CLR_DIR$SAILBOT_INSTALLATION_PATH$SAILBOT_REPO_MAIN/$MODULE/$PI_SHELL_CLR_INFO\n"
            print_result "git clone https://github.com/pophaax/$MODULE"
    done

    printf "$PI_SHELL_CLR_ASK\nDo you wish to create a database?\n$PI_SHELL_CLR_OPT"
    select option in "Yes" "No"
    do
            case $option in
                Yes ) printf "$PI_SHELL_CLR_INFO\nCreating database in $PI_SHELL_CLR_DIR$INSTALLATION_PATH$SAILBOT_REPO_MAIN/$PI_SHELL_CLR_INFO\n"
                                    if sqlite3 asr.db < $INSTALLATION_PATHraspi/createtables.sql;
                                    then print_result true; else print_result false; break; fi
                                    printf "$PI_SHELL_CLR_ASK\nServer settings:\n$PI_SHELL_CLR_OPT"
                                    read -p "Boat name: " BOATID
                                    read -p "Boat password: " BOATPWD
                                    read -p "Server address: " SRVADDR
                                    printf "$PI_SHELL_CLR_INFO"
                                    if sqlite3 asr.db "INSERT INTO server(id, boat_id, boat_pwd, srv_addr) VALUES('1', '$BOATID', '$BOATPWD', '$SRVADDR')";
                                    then print_result true; else print_result false; fi
                                    break;;
                    No ) printf "$PI_SHELL_CLR_INFO\nSkipping database\n"
                                    break;;
            esac
    done
    
    # Return to menu
    cd $PI_SHELL_PATH
    ./menu.sh