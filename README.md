# ProtocolsApp

App to practice Protocols implementation and review VIP Architectural Design Pattern.

## Key points of the project

Extensive practice of the following points:
- Extensive usage of protocols
- Review VIP Architectural Design Pattern
- Unit tests using XCTest
- SOLID Principles

"Downsides":
- Without PRs
- gitflow.

Project heavely inspired on [Commitando Youtube channel](https://www.youtube.com/@Comitando)

## TODOs:

- [ ] Usability
  - [ ] Adds tap gesture to dismiss keyboard when tapping outside of it
- [ ] `ApplyDiscountPresenter`
  - [ ] Apply I and D SOLID principles to NumberFormatter
  - [ ] Refactor unit tests
- [ ] Refactor protocols naming to improve readability
- [ ] Creates localizable strings
- [ ] `ApplyDiscountView`
  - [ ] Creates protocol
  - [ ] Inject reference at At `ApplyDiscountViewController`
  - [ ] Refactor unit tests
- [ ] `ApplyDiscountViewController`
  - [ ] Apply refactor of `ApplyDiscountView`
  - [ ] Apply D from SOLID principles to interactor and presenter dependencies
- [ ] Modeling
  - [ ] Abstract `Product`, maybe `Discount` too
  - [ ] Applies `Equatable` protocol to improve unit tests (AssertEqual)
- [ ] Unit tests
  - [ ] Refactor tests to assert parameters passed to methods, improving accuracy
