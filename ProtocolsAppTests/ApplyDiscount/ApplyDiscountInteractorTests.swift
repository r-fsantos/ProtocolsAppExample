//
//  ApplyDiscountInteractorTests.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 20/02/24.
//

import XCTest
@testable import ProtocolsApp

final class ApplyDiscountInteractorTests: XCTestCase {
    private typealias SUT = ApplyDiscountInteractor

    private var sut: ApplyDiscountInteractor!
    private let presenterSpy = ApplyDiscountPresenterSpy()

    override func setUp() {
        super.setUp()

        sut = makeSUT()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    // MARK: - Testing Scenarios
    func test_WhenCallDidLoad_ShouldCallProductInfo() {
        sut.didLoad()

        XCTAssertEqual(presenterSpy.calledMethods, [.showProductInfo])
    }

    func test_WhenCallApplyDiscount_WithInvalidNumber_ShouldCallShowError() {
        sut.applyDiscount(value: " ")

        XCTAssertEqual(presenterSpy.calledMethods, [.showError])
    }

    func test_WhenCallApplyDiscount_WithNumberLowerThanMinimum_ShouldCallShowError() {
        sut.applyDiscount(value: "0")

        XCTAssertEqual(presenterSpy.calledMethods, [.showError])
    }

    func test_WhenCallApplyDiscount_WithNumberHigherThanMaximum_ShouldCallShowError() {
        sut.applyDiscount(value: "50")

        XCTAssertEqual(presenterSpy.calledMethods, [.showError])
    }

    func test_WhenCallApplyDiscount_WithValidNumber_ShouldCallShowDiscount() {
        sut.applyDiscount(value: "15")

        XCTAssertEqual(presenterSpy.calledMethods, [.showDiscount])
    }

    // MARK: - TestClass configuration
    private func makeSUT() -> SUT {
        let interactor = SUT()
        interactor.presenter = presenterSpy
        return interactor
    }
}
