***Keywords***
Start Session
    Run Keyword If  "${browser}" == "headless"
    ...     Open Firefox Headless
    
    Run Keyword If  "${browser}" == "firefox"
    ...     Open Firefox

    Set Window Size     1920    957   

Finish Session
    Close Browser 

Login Session
    Start Session
    
    Go To           ${base_url} 
    Login With      ${admin_user}  ${admin_pass}

## Webdriver
Open Firefox
    Open Browser    about:blank     firefox

Open Firefox Headless
    Open Browser    about:blank     headlessfirefox     options=add_argument('--disable-dev-shm-usage')