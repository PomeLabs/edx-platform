Feature: Course Team
    As a course author, I want to be able to add others to my team

    Scenario: Users can add other users
        Given I have opened a new course in Studio
        And the user "alice" exists
        And I am viewing the course team settings
        When I add "alice" to the course team
        And "alice" logs in
        Then she does see the course on her page

    Scenario: Added users cannot delete or add other users
        Given I have opened a new course in Studio
        And the user "bob" exists
        And I am viewing the course team settings
        When I add "bob" to the course team
        And "bob" logs in
        Then he cannot delete users
        And he cannot add users

    Scenario: Users can delete other users
        Given I have opened a new course in Studio
        And the user "carol" exists
        And I am viewing the course team settings
        When I add "carol" to the course team
        And I delete "carol" from the course team
        And "carol" logs in
        Then she does not see the course on her page

    Scenario: Users cannot add users that do not exist
        Given I have opened a new course in Studio
        And I am viewing the course team settings
        When I add "dennis" to the course team
        Then I should see "Could not find user by email address" somewhere on the page

    Scenario: Admins should be able to make other people into admins
        Given I have opened a new course in Studio
        And the user "emily" exists
        And I am viewing the course team settings
        And I add "emily" to the course team
        When I make "emily" a course team admin
        And "emily" logs in
        And she selects the new course
        And she views the course team settings
        Then "emily" should be marked as an admin
        And she can add users
        And she can delete users

    Scenario: Admins should be able to remove other admins
        Given I have opened a new course in Studio
        And the user "frank" exists as a course admin
        And I am viewing the course team settings
        When I remove admin rights from "frank"
        And "frank" logs in
        And he selects the new course
        And he views the course team settings
        Then "frank" should not be marked as an admin
        And he cannot add users
        And he cannot delete users
