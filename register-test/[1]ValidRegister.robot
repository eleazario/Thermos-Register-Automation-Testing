*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/Keywords.robot
Suite Setup    Open New Browser
Test Setup    Open Thermos Register Page
Suite Teardown    Close All Browsers

*** Test Cases ***
Register with valid form input
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Email}=        Generate Random String    8    [LOWER]
    ${Phone}=        Generate Random String    11   [NUMBERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        ${Email}@gmail.com
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}0

    Page Should Not Contain    Must be at least 8 characters
    Page Should Not Contain    Must contain 1 number
    Page Should Not Contain    Must contain 1 capital letter

    Input Customer Confirm Password    ${Password}0
    
    Sleep    4s
    Click Register Button

    Wait For Expected Condition        Title Is        Thermos Brand

    Go to Account Page
    Check if Page Contain Account Information