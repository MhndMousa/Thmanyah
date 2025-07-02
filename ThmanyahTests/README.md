# ViewModel Tests

This directory contains comprehensive unit tests for all ViewModels in the Thmanyah iOS app.

## Test Structure

### Individual Test Files

- `HomeViewModelTests.swift` - Tests for the main HomeViewModel
- `SquareViewModelTests.swift` - Tests for the SquareViewModel component
- `TwoLineViewModelTests.swift` - Tests for the TwoLineViewModel component
- `BigSquareViewModelTests.swift` - Tests for the BigSquareViewModel component
- `AllViewModelTests.swift` - Comprehensive tests for all ViewModels in one file
- `URLOpenerTests.swift` - Unit tests for URLOpener with mocked dependencies
- `URLOpenerIntegrationTests.swift` - Integration tests for URLOpener functionality

## Test Framework

All tests use the new Swift Testing framework with:

- `@Test` annotations for test functions
- `#expect` assertions for test expectations
- `import Testing` for the testing framework
- `@testable import Thmanyah` for accessing internal members

## Test Categories

### 1. Initialization Tests

- Verify ViewModels initialize with correct default values
- Test proper dependency injection
- Validate initial state

### 2. Protocol Conformance Tests

- Ensure ViewModels conform to their respective protocols
- Verify ObservableObject conformance
- Test protocol method implementations

### 3. State Management Tests

- Test `@Published` properties work correctly
- Verify state updates trigger UI updates
- Test state persistence

### 4. Method Functionality Tests

- Test all public methods are callable
- Verify method behavior with different inputs
- Test error handling scenarios

### 5. Integration Tests

- Test ViewModels work together correctly
- Verify dependency relationships
- Test data flow between components

### 6. Error Handling Tests

- Test service error scenarios
- Verify graceful error handling
- Test loading state management

## Mock Classes

Each test file includes comprehensive mock implementations:

### MockHomeService

- Simulates HomeServiceProtocol
- Configurable success/failure scenarios
- Tracks method calls and parameters

### MockURLOpener

- Simulates URLOpenerProtocol
- Tracks URL opening calls
- Records last opened URL

### MockAudioPlayer

- Simulates AudioPlayerProtocol
- Tracks audio player state
- Records queue operations

### Mock Previewables

- MockSquareViewPreviewable
- MockTwoLineViewPreviewable
- MockBigSquareViewPreviewable

## Running Tests

### Using Xcode

1. Open the project in Xcode
2. Select the test target
3. Press `Cmd+U` to run all tests
4. Or select individual test files to run specific tests

### Using Command Line

```bash
# Run all tests
xcodebuild test -scheme Thmanyah -destination 'platform=iOS Simulator,name=iPhone 15'

# Run specific test file
xcodebuild test -scheme Thmanyah -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:ThmanyahTests/HomeViewModelTests
```

## Test Coverage

The tests cover:

- ✅ All ViewModel classes
- ✅ All protocol conformance
- ✅ All public methods
- ✅ State management
- ✅ Error handling
- ✅ Integration scenarios
- ✅ Edge cases

## Best Practices

1. **Given-When-Then Structure**: All tests follow the Given-When-Then pattern for clarity
2. **Descriptive Test Names**: Test names clearly describe what is being tested
3. **Mock Dependencies**: All external dependencies are mocked for isolated testing
4. **Async Testing**: Proper async/await handling for asynchronous operations
5. **Error Scenarios**: Both success and failure paths are tested
6. **State Verification**: Tests verify both initial and updated states

## Adding New Tests

When adding new ViewModels:

1. Create a new test file named `{ViewModelName}Tests.swift`
2. Follow the existing test structure and naming conventions
3. Include all test categories (initialization, protocol conformance, etc.)
4. Add mock classes for any new dependencies
5. Update this README with new test information

## Test Maintenance

- Keep tests up to date with ViewModel changes
- Refactor tests when ViewModel interfaces change
- Add new tests for new functionality
- Remove obsolete tests when features are removed
