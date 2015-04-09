
    # Aland Sailing Robot #
    # PiShell startup script

    # Config script
    source config.sh
    
    # Show welcome message
    printf "\n$PI_SHELL_CLR_HEAD"
    printf "\n     *****************************************************"
    printf "\n     *                                                   *"
    printf "\n     *           .:          .:: ::    .:::::::          *"
    printf "\n     *          .: ::      .::    .::   ::    .::        *"
    printf "\n     *         .:  .::      .::         ::    .::        *"
    printf "\n     *        .::   .::       .::       : .::            *"
    printf "\n     *       .:::::: .::         .::    ::  .::          *"
    printf "\n     *      .::       .::  .::    .::   ::    .::        *"
    printf "\n     *     .::         .::   .:: ::    .::      .::      *"
    printf "\n     *                                                   *"
    printf "\n     *                 Aland Sailing Robot               *"
    printf "\n     *                  RaspberryPi Shell                *"
    printf "\n     *****************************************************"
    printf "$PI_SHELL_CLR_INFO"
    
    # Launch menu
     ./menu.sh
