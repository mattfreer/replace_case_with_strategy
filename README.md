# Replace Case with Strategy

Case statements represent a bad code smell. Case statements that switch on a type-code are often duplicated throughout a program.
The purpose of this example is to demonstrate the steps involved in a replace-case-with-strategy refactoring.

The context of the example is based around a mock football (soccer) game. The specific area of focus being the process a match official (Referee) goes through when determining what action should be taken in response to a game incident (Foul).

The code prior to the refactoring can be inspected in following commit: [0906a62](https://github.com/mattfreer/replace_case_with_strategy/commit/0906a62). The key focus of our refactoring will be the `#make_decision` method of the [Soccer::Referee](https://github.com/mattfreer/replace_case_with_strategy/blob/0906a62/lib/soccer/referee.rb) class which contains a `case` statement that switches on `incident.type`.

The first refactoring that is applied is to extract each branch of the case statement to a method. This refactoring can be seen by comparing commit [0906a62 with 4fcb773](https://github.com/mattfreer/replace_case_with_strategy/compare/0906a62...4fcb773)

The last step is to extract these branch methods to a new module (`Soccer::RefereeStrategies`). These methods are defined as `Procs` so that they can act as drop in strategies. This refactoring can be seen by comparing commit [4fcb773 with 6b65d72](https://github.com/mattfreer/replace_case_with_strategy/compare/4fcb773...6b65d72).

