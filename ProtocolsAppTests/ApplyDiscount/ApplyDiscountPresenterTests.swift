//
//  ApplyDiscountPresenterTests.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 20/02/24.
//

import XCTest
@testable import ProtocolsApp

final class ApplyDiscountPresenterTests: XCTestCase {
    private typealias SUT = ApplyDiscountPresenter

    private var sut: ApplyDiscountPresenter!
    private let viewControllerSpy = ApplyDiscountViewControllerSpy()

    override func setUp() {
        super.setUp()

        sut = makeSUT()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    // MARK: - Testing Scenarios
    func test_WhenCallShowProductInfo_ShouldCallShowProductInfoOnViewController() {
        sut.showProductInfo(name: "", price: 0.0, minDiscountValue: 0, maxDiscountValue: 0)

        XCTAssertEqual(viewControllerSpy.calledMethods, [.showProductInfo])
    }

    func test_WhenCallShowDiscount_ShouldCallShowDiscountOnViewController() {
        sut.showDiscount(name: "", price: 0.0, priceWithDiscount: 0.0)

        XCTAssertEqual(viewControllerSpy.calledMethods, [.showDiscount])
    }

    func test_WhenCallShowError_WithInvalidNumberError_ShouldCallShowErrorOnViewController() {
        sut.showError(error: .invalidNumber, validRange: (min: 0, max: 0))

        XCTAssertEqual(viewControllerSpy.calledMethods, [.showError])
    }

    func test_WhenCallShowError_WithLessThanMinDiscountValueError_ShouldCallShowErrorOnViewController() {
        sut.showError(error: .lessThanMinDiscountValue, validRange: (min: 0, max: 0))

        XCTAssertEqual(viewControllerSpy.calledMethods, [.showError])
    }

    func test_WhenCallShowError_WithHigherThanMaxDiscountValueError_ShouldCallShowErrorOnViewController() {
        sut.showError(error: .higherThanMaxDiscountValue, validRange: (min: 0, max: 0))

        XCTAssertEqual(viewControllerSpy.calledMethods, [.showError])
    }

    private func makeSUT() -> SUT {
        let presenter = ApplyDiscountPresenter()
        presenter.viewController = viewControllerSpy
        return presenter
    }
}
