Feature: Integer Arithmetic Expressions
  This feature provides a range of scenarios corresponding to the
  intended external behaviour of arithmetic expressions on integers.

  # This is just a comment.
  # You can start with a Background: that will be run before executing each scenario.

  Background:
    Given I initialise a calculator

  # Each scenario can be seen as a test that can be executed with JUnit,
  # provided that each of the steps (Given, When, And and Then) are
  # implemented in a Java mapping file (CalculatorSteps.Java)

  Scenario: Adding two integer numbers
    Given an integer operation '+'
    When I provide a first number 4
    And I provide a second number 5
    Then the operation evaluates to 9

  Scenario: Subtracting two integer numbers
    Given an integer operation '-'
    When I provide a first number 7
    And I provide a second number 5
    Then the operation evaluates to 2

  Scenario: Multiplying two integer numbers
    Given an integer operation '*'
    When I provide a first number 7
    And I provide a second number 5
    Then the operation evaluates to 35

  Scenario: Dividing two integer numbers
    Given an integer operation '/'
    When I provide a first number 7
    And I provide a second number 5
    Then the operation evaluates to 1

  Scenario: Dividing two integer numbers
    Given an integer operation '/'
    When I provide a first number 6
    And I provide a second number 0
    Then the operation should return Integer maximum value

  Scenario: Printing the sum of two integer numbers
    Given the sum of two numbers 8 and 6
    Then its INFIX notation is ( 8 + 6 )
    And its PREFIX notation is + (8, 6)
    And its POSTFIX notation is (8, 6) +

  # This is an example of a scenario in which we provide a list of numbers as input.
  # (In fact, this is not entirely true, since what is given as input is a table of
  # strings. In this case, the table is of dimension 1 * 3 (1 line and three columns).
  Scenario: Evaluation arithmetic operations over a list of integer numbers
    Given the following list of integer numbers
      | 8 | 2 | 2 |
    Then the sum is 12
    And the product is 32
    And the difference is 4
    And the quotient is 2

  # A scenario outline (or template) is a scenario that is parameterised
  # with different values. The outline comes with a set of examples.
  # The scenario will be executed with each of the provided inputs.
  Scenario Outline: Adding two integer numbers
    Given an integer operation '+'
    When I provide a first number <n1>
    And I provide a second number <n2>
    Then the operation evaluates to <result>

    Examples:
      |n1|n2|result|
      |4|5|9|
      |5|3|8|

  Scenario Outline: Dividing two integer numbers
    Given an integer operation '/'
    When I provide a first number <n1>
    And I provide a second number <n2>
    Then the operation evaluates to <result>

    Examples:
      |n1|n2|result|
      |35|5|7|
      |7|5|1|
      |5|7|0|

  Scenario Outline: Evaluating arithmetic operations with two integer parameters
    Given an integer operation <op>
    When I provide a first number <n1>
    And I provide a second number <n2>
    Then the operation evaluates to <result>

    Examples:
      | op  |n1|n2|result|
      | "+" | 4| 5|     9|
      | "-" | 8| 5|     3|
      | "*" | 7| 2|    14|
      | "/" | 6| 2|     3|

  Scenario Outline: Testing the output notation
    Given an integer operation "<op>"
    When I provide a first number 8
    And I provide a second number 6
    Then its INFIX notation is ( 8 <op> 6 )
    And its PREFIX notation is <op> (8, 6)
    And its POSTFIX notation is (8, 6) <op>
    Examples:
      | op |
      | + |
      | - |
      | * |
      | / |

  Scenario Outline: Evaluating composite expressions with a hierarchy depth higher than one
    Given an integer operation <op>
    When I provide an expression containing an integer operation <op2> with the following list of integer numbers
        | 3 | 4 | 5 |
    And I provide an expression containing an integer operation <op3> with the following list of integer numbers
        | 5 | 3 |
    And I provide a last number 5
    Then the operation evaluates to <result>
    Examples:
      | op | op2 | op3 | result |
      | "+"  |  "+"  |  "+" | 25 |
      | "-"  |  "-"  |  "-" | -13 |
      | "*"  |  "*"  |  "*" | 4500 |
      | "/"  |  "/"  |  "/" | 0 |
      | "/"  |  "+"  |  "-" | 1 |

  Scenario Outline: Testing the output notation of composite expressions with a hierarchy depth higher than one
    Given an integer operation "<op>"
    When I provide an expression containing an integer operation "<op2>" with the following list of integer numbers
      | 3 | 4 | 5 |
    And I provide an expression containing an integer operation "<op3>" with the following list of integer numbers
      | 5 | 3 |
    And I provide a last number 5
    Then its INFIX notation is ( ( 3 <op2> 4 <op2> 5 ) <op> ( 5 <op3> 3 ) <op> 5 )
    And its PREFIX notation is <op> ( <op2> ( 3, 4, 5 ), <op3> ( 5, 3 ) , 5 )
    And its POSTFIX notation is ( ( 3, 4, 5) <op2>, ( 5, 3) <op3>, 5) <op>
    Examples:
      | op | op2 | op3 |
      | /  |  +  |  - |