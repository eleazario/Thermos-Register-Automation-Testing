*** Settings ***
Library        SeleniumLibrary

**** Keywords ***

Open New Browser
    Open Browser    ${None}    edge

Open Thermos Register Page
    Go to    https://thermos.com/account/register
    Maximize Browser Window
    Wait Until Page Contains Element   id:create_customer

Go to Account Page
    Go To    https://thermos.com/account

Check if Page Contain Account Information
    Page Should Contain    My account

Check if still in the register page
    Sleep    4s
    Page Should Contain Element    id:create_customer

Input First Name
    [Arguments]        ${FirstName}
    Input Text        id:FirstName                    ${FirstName}
    
Input Email
    [Arguments]        ${Email}
    Input Text        id:Email                        ${Email}

Input Phone Number
    [Arguments]        ${Phone}
    Input Text        id:Phone                        ${Phone}
    
Input Customer Password        
    [Arguments]       ${Password}     
    Input Text        name:customer[password]         ${Password}

Input Customer Confirm Password
    [Arguments]        ${Password}
    Input Text        name:customer[password_confirmation]       ${Password}

Click Register Button
    Click Element     //button[normalize-space()='CREATE AN ACCOUNT']