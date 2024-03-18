*** Settings ***
Documentation   boka bil
Library     SeleniumLibrary
Library    DateTime    # Importera DateTime-biblioteket
Suite Setup     setup
Suite Teardown      Teardown


*** Variables ***
${url}      http://rental22.infotiv.net/
${title}     //*[@id="title"]
${e-mail field}     //*[@id="email"]
${pass field}       //*[@id="password"]
${login}    //*[@id="login"]
${firstname}    John
${lastname}      Doe
${phonenumber}      0123456789
${usermail}     johndoe@email.boi
${pass}     abc123
${start date}      03-15
${end date}        04-15
${continue}        //*[@id="continue"]
${car}      //*[@id="bookModelSpass5"]
${card no.}     1234567891234567
${card day}     0
${card month}   7
${cvc}          789
${confirm}      //*[@id="confirm"]
${mypage}       //*[@id="mypage"]
${logout}       //*[@id="logout"]
${current_date}    Get Time    now    result_format=%Y-%m-%d



*** Test Cases ***
car booking
    User logs into website    ${usermail}    ${pass}
    User chooses date for trip
    User books car
    User enters info
    User confirms booking
    User cancels booking
    User logs out


log in and log out function
    testing log in and log function


cancel car booking
    website log in
    choose date for trip
    choose car
    enter info
    confirm booking
    cancel booking
    log out


insert incorrect personal info
    log in
    choose date
    car
    info
    confirm
    booking cancel
    loging out

creating account with incorrect personal info
    create user


choose car through list
    log in to site
    choosing date
    choosing car


*** Keywords ***
setup
    Open Browser    browser=Chrome
    Go To    ${url}
    Wait Until Page Contains Element    ${title}
    Set Selenium Speed    0

Teardown
    Close Browser


User logs into website
    [Arguments]    ${username}    ${password}
    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Password    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]

User chooses date for trip                                                                  #lägg in 88 i 156
    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element    //*[@id="reset"]
    Click Element    //*[@id="end"]
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}

User books car
    [Documentation]     User chooses car
    [Tags]      Car
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    ${car}

User enters info
    [Documentation]     User enters personal info
    [Tags]      info
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    ${firstname} ${lastname}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[1]     ${card day}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[2]     ${card month}
    Input Text    //*[@id="cvc"]    ${cvc}
    Click Element    ${confirm}

User confirms booking
    [Documentation]     confirm booking
    [Tags]              booking
    Wait Until Page Contains Element    //*[@id="confirmMessage"]/label
    Click Element    ${mypage}
    Wait Until Page Contains Element    //*[@id="model1"]

User cancels booking
    [Documentation]     cancel booking
    [Tags]              cancel
    Click Element    //*[@id="unBook1"]
    Handle Alert    Accept
    Click Element    //*[@id="mypage"]
    Wait Until Page Contains Element    //*[@id="historyText"]

User logs out
    [Documentation]     loging out
    [Tags]              log out
    Click Element    //*[@id="logout"]
    Wait Until Page Contains Element    //*[@id="login"]



testing log in and log function
    [Documentation]     testing function log in and log out
    [Tags]              log in and log out
    Wait Until Page Contains Element    ${title}
    Input Text    ${e-mail field}    ${usermail}
    Input Password    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]
    Click Element    ${logout}
    Wait Until Page Contains Element    //*[@id="login"]


website log in
    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Password    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]

choose date for trip                                                                        #lägg in 88 i 156 ta bort denna
    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element    //*[@id="title"]
    Click Element    //*[@id="reset"]
    Click Element    //*[@id="end"]
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}

choose car
    [Documentation]     User chooses car
    [Tags]      Car
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    ${car}

enter info
    [Documentation]     User enters personal info
    [Tags]      info
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    ${firstname} ${lastname}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[1]     ${card day}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[2]     ${card month}
    Input Text    //*[@id="cvc"]    ${cvc}
    Click Element    ${confirm}

confirm booking
    [Documentation]     confirm booking
    [Tags]              booking
    Wait Until Page Contains Element    //*[@id="confirmMessage"]/label
    Click Element    ${mypage}
    Wait Until Page Contains Element    //*[@id="model1"]



cancel booking
    [Documentation]     cancel booking
    [Tags]              cancel
    Click Element    //*[@id="unBook1"]
    Handle Alert    Accept
    Click Element    //*[@id="mypage"]
    Wait Until Page Contains Element    //*[@id="historyText"]

log out
    [Documentation]     loging out
    [Tags]              log out
    Click Element    //*[@id="logout"]
    Wait Until Page Contains Element    //*[@id="login"]


log in
    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Password    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]

choose date
    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element    //*[@id="title"]
    Click Element    //*[@id="reset"]
    Click Element    //*[@id="end"]
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}

car
    [Documentation]     User chooses car
    [Tags]      Car
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    ${car}

info
    [Documentation]     User enters incorrect personal info
    [Tags]      info
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="cardNum"]    ${card no.}
    Input Text    //*[@id="fullName"]    21
    Select From List By Index    //*[@id="confirmSelection"]/form/select[1]     ${card day}
    Select From List By Index    //*[@id="confirmSelection"]/form/select[2]     ${card month}
    Input Text    //*[@id="cvc"]    ${cvc}
    Click Element    ${confirm}

confirm
    [Documentation]     confirm booking
    [Tags]              booking
    Wait Until Page Contains Element    //*[@id="confirmMessage"]/label
    Click Element    ${mypage}
    Wait Until Page Contains Element    //*[@id="model1"]

booking cancel
    [Documentation]     cancel booking
    [Tags]              cancel
    Click Element    //*[@id="unBook1"]
    Handle Alert    Accept
    Click Element    //*[@id="mypage"]
    Wait Until Page Contains Element    //*[@id="historyText"]

loging out
    [Documentation]     loging out
    [Tags]              log out
    Click Element    //*[@id="logout"]
    Wait Until Page Contains Element    //*[@id="login"]


create user
    [Documentation]     create a new user
    [Tags]              new user
    Wait Until Page Contains Element    //*[@id="title"]
    Click Element    //*[@id="createUser"]
    Wait Until Page Contains Element    //*[@id="questionText"]
    Input Text    //*[@id="name"]    01234567
    Input Text    //*[@id="last"]    01234567
    Input Text    //*[@id="phone"]    00001112345678
    Input Text    //*[@id="emailCreate"]    vavav@email.boi
    Input Text    //*[@id="confirmEmail"]    vavav@email.boi
    Input Text    //*[@id="passwordCreate"]    abc123
    Input Text    //*[@id="confirmPassword"]    abc123
    Click Element    //*[@id="create"]
    Wait Until Page Contains Element    //*[@id="questionText"]
    Click Element    //*[@id="title"]



log in to site
    [Documentation]     User enters information to log in
    [Tags]      log in
    Input Text    ${e-mail field}    ${usermail}
    Input Password    ${pass field}    ${pass}
    Click Element    ${login}
    Wait Until Page Contains Element    //*[@id="welcomePhrase"]

choosing date
    [Documentation]     User enters date for the trip
    [Tags]      date
    Click Element    //*[@id="reset"]
    Click Element    //*[@id="end"]
    Input Text    //*[@id="end"]    ${end date}
    Click Element    ${continue}

choosing car
    [Documentation]     User chooses car
    [Tags]              Car
    Wait Until Page Contains Element    //*[@id="questionText"]

    # Välj Volvo från rull-listan
    Click Element    //*[@id="ms-list-1"]/button
    Click Element    //*[@id="ms-opt-4"]
    Click Element    //*[@id="ms-opt-3"]

    # Kontrollera att Volvo syns i rull-listan
    Element Should Be Visible    //*[@id="ms-list-1"]/button/span[contains(text(), 'Volvo')]    msg=Volvo should be present in the list

    # Välj Tesla från rull-listan
    Click Element    //*[@id="ms-list-2"]/button
    Click Element    //*[@id="ms-opt-6"]

    # Kontrollera att Volvo fortfarande syns i rull-listan även när Tesla visas
    Element Should Be Visible    //*[@id="ms-list-1"]/button/span[contains(text(), 'Volvo')]    msg=Volvo should be present in the list

    # Kontrollera att Tesla syns i rull-listan
    Element Should Be Visible    //*[@id="ms-list-1"]/button/span[contains(text(), 'Tesla')]    msg=Tesla should be present in the list

    # Kontrollera att endast Tesla syns i listan nedan
    Element Should Be Visible    //*[@id="carTable"]/tbody/tr/td[contains(text(), 'Tesla')]    msg=Only Tesla should be present in the list below
    Element Should Not Be Visible    //*[@id="carTable"]/tbody/tr/td[contains(text(), 'Volvo')]    msg=Volvo should not be present in the list below

    Wait Until Page Contains Element    //*[@id="carTable"]/tbody/tr/td[1]
