
# Jon Daniel 5/13

## When multiple tests fail

Q - what’s going on?
- is it configurations? (how the tests setup)
- is it environment? (diff version of mysql, osx, etc.)
- are these tests just broken? (Check CI)

Don’t make changes until the build passes. May need to comment out some tests.

Focus on the deepest test possible first (not a view or controller, but more of a service, or model, or any library)
