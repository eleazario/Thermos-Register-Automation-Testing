*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../resources/Keywords.robot
Suite Setup    Open New Browser
Test Setup    Open Thermos Register Page
Suite Teardown    Close All Browsers

*** Test Cases ***
Register With Empty Form Input
    Open Thermos Register Page
    
    Click Register Button
    
    Page Should Contain    Password can't be blank.
    Page Should Contain    Email can't be blank.
    Page Should Contain    Full Name can't be blank.
    Page Should Contain    Phone Number can't be blank.

Register With invalid email address format
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Email}=        Generate Random String    8    [LOWER]
    ${Phone}=        Generate Random String    11   [NUMBERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        ${Email}
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}0

    Input Customer Confirm Password    ${Password}0
    
    Sleep    4s
    Click Register Button
    
    Check if still in the register page

Register With registered email address
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Phone}=        Generate Random String    11   [NUMBERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        eleazarioanes808@gmail.com
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}0

    Input Customer Confirm Password    ${Password}0
    
    Sleep    4s
    Click Register Button
    
    Page Should Contain    This email address is already associated with an account. If this account is yours, you can 

Register with invalid phone number format
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Email}=        Generate Random String    8    [LOWER]
    ${Phone}=        Generate Random String    11   [LETTERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        ${Email}@gmail.com
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}0

    Input Customer Confirm Password    ${Password}0
    
    Sleep    4s
    Click Register Button

    Check if still in the register page

Register with invalid password format
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Email}=        Generate Random String    8    [LOWER]
    ${Phone}=        Generate Random String    11   [NUMBERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        ${Email}@gmail.com
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}

    Page Should Contain    Must be at least 8 characters
    Page Should Contain    Must contain 1 number
    Page Should Contain    Must contain 1 capital letter

    Input Customer Confirm Password    ${Password}
    
    Sleep    4s
    Click Register Button

    Check if still in the register page

Register with invalid confirm password
    ${FirstName}=    Generate Random String    8    [LETTERS]
    ${Email}=        Generate Random String    8    [LOWER]
    ${Phone}=        Generate Random String    11   [NUMBERS]
    ${Password}=     Generate Random String    7    [LETTERS]

    Open Thermos Register Page
    
    Input First Name    ${FirstName}
    Input Email        ${Email}@gmail.com
    Input Phone Number    ${Phone}
    Input Customer Password    ${Password}0

    Input Customer Confirm Password    ${Password}
    
    Sleep    4s
    Click Register Button

    Alert Should Be Present        Passwords do not match.