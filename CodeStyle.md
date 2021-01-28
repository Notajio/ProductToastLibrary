#  Code style description and changes

## Rules

1. One line is maximum 120 characters.
2. Use clear naming. Clear is better than short. Avoid unappropriate or unclear naming.
3. Prefer optional binding to unwrap optionals in most cases.
4. Prefer testing isEmpty instead of  = ""
5. Use lower camel case for enum cases.
6. Use ternary statements on value assignation when it allows to factorize code without hurting clarity. If the tested condition is too complex, an if statement might be preferred.
7. Use if-else statements when a variable is tested against a single value.
8. Prefer multiple conditions if statements (or if let statements) rather than consecutive if statements that have single condition. For clarity, put each confition on a new line.
9. Avoid useless parameters in method declarations.
10. If a function call can be written on a single line, it should stay like this. If not, each parameter should be written on a new line. Same goes for function declaration.
11. Avoid useless casting.
12. Avoid unnecessary prefixes for classes and enums.
13. No space before colons, one space after. Exceptions are function declarations/calls on multiple line and ternary operators. 
NOTE: For this project I tried to align colons and equals symbols to match the style when it made sense. However, I usually don't do it and therefore I am still not sure about it.


## Changes

* Removed Foundation import as UIKit is enough.
* ToastType enum cases changed from upper to lower camel case to match Swift standards.
* Changed toastType parameter type frow rawValue to actual enum type. This way only expected values can be passed. Therefore guard statement is gone.
* Moved some parts of code in the correct section.
* Added some comments and removed obvious ones.
* Removed 'UIWindow.Level' prefixes.
* Variable 'configView' becomes 'messageViewConfig' as it's actually not a view but a configuration for it.
* Used optional binding for variables that were tested against nil. Removed force unwrap.
* Replaced switch by ternary expression for swipeGesture assignation to factorize code. Readability is not hurt.
* Replaced switch by if-else statements for toast view initilization as the variable is tested against a single value.
* Replaced chained if let statements by single if with multiple let statements.
* Removed sender parameter from swipeAction method.

