# JD - Robot Framework POC
This repository contains a Proof of Concept to run E2E tests using Robot Framework

## What is in the project
The project contains three main folders:
- keywords: contains all the actions used in the tests.
- variables: contains all the variables/selectors used in the tests.
- tests: contains all the feature tests developed.

Also, it contains the following files:
- .editorconfig: sets some configs related with spacing and empty lines in the project.
- .gitignore: sets the files and folders that should not be in the repository.
- README.md: contains information about the project.
- requirements.txt: contains all the requirements to setup and run the project.

## Which tests are developed
As example, the following tests were automated:
- **Test 1** *(homepage.robot)*
```gherkin
    Given the shop user loads the shops main page
    Then the cookies modal must be loaded
    When the shop user clicks in the accept cookies button
    Then the cookies modal must not be visible
```

- **Test 2** *(brandpage.robot)*
```gherkin
    Given the shop user loads the shops main page
    And the shop user clicks in the accept cookies button
    When the shop user types a search term
    And the shop user clicks in the search button
    Then the brand page should be visible
```

- **Test 3** *(producpage.robot)*
```gherkin
    Given the shop user loads the shops main page
    And the shop user clicks in the accept cookies button
    When the shop user goes to the brand page
    And the shop user selects a product
    Then the product page should be visible
```

- **Test 4** *(cartpage.robot)*
```gherkin
    Given the shop user loads the shops main page
    And the shop user clicks in the accept cookies button
    When the shop user goes to the product page
    And the shop user clicks in the add to cart button
    Then the cart page should be loaded with the selected product
```

## How to setup the project
To setup the project, one should have python installed and run the following command:

```shell
    pip install -r requirements.txt
```

This command will install all the necessary libraries to run the project.

## How to run the tests
To run the tests, one should run the following command:

```shell
    robot tests
```

This command will run all the test inside the **tests** folder.

By default, it runs in the *TST* environment, in *Chrome* browser in *Mobile* view in *headless* mode. The defaults could be changed in the var_default.resource file.

One can change these default values by passing other ones as parameters. To run in *Desktop* view in *Firefox* browser and *not headless*, one should run the following command:

```shell
    robot -v DEVICE:Desktop -v BROWSER:Firefox -v IS_HEADLESS:False tests
```

This command will run all tests in the *TST* environment, in *Firefox* browser in *Desktop* view in *not headless* mode.

To run each test separately, one should include the "-i *test_tag*". For example, to run the Test1, one should run the following command:

```shell
    robot -v DEVICE:Desktop -v BROWSER:Firefox -v IS_HEADLESS:False -i test1 tests
```

This command will run only the tests tagged with the test1 tag from the tests folder with the above explained configuration.

## Disclaimer
The mobile version for Firefox and the iPhone were not implemented.
