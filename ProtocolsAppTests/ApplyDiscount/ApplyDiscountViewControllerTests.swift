//
//  ApplyDiscountViewControllerTests.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 20/02/24.
//

import XCTest
@testable import ProtocolsApp

final class ApplyDiscountViewControllerTests: XCTestCase {
    private typealias SUT = ApplyDiscountViewController

    private var sut: ApplyDiscountViewController!
    private let interactorSpy = ApplyDiscountInteractorSpy()
    private let applyDiscountViewSpy = ApplyDiscountViewSpy()

    override func setUp() {
        sut = makeSUT()

        super.setUp()
    }

    override func tearDown() {
        sut = nil

        super.tearDown()
    }

    // MARK: - Testing Scenarios
    func test_WhenViewIsLoaded_ShouldCallDidLoadOnInteractor() {
        sut.loadViewIfNeeded()

        XCTAssertEqual(interactorSpy.calledMethods, [.didLoad])
    }

    func test_WhenViewIsLoaded_ShouldCallDidLoadOnView() {
        sut.loadViewIfNeeded()

        XCTAssertEqual(interactorSpy.calledMethods, [.didLoad])
    }

    func test_WhenCallApplyDiscount_ShouldCallApplyDiscountOnViewController() {
        sut.applyDiscount(value: "")

        XCTAssertEqual(interactorSpy.calledMethods, [.applyDiscount])
    }

    func test_WhenCallShowProductInfo_ShouldCallShowProductInfoOnView() {
        sut.showProductInfo(product: "", discountInfo: "")

        XCTAssertEqual(applyDiscountViewSpy.calledMethods, [.setProductLabel, .setInfoLabel])
    }

    func test_WhenCallShowDiscount_ShouldCallShowPriceWithDiscountOnView() {
        sut.showDiscount(message: "")

        XCTAssertEqual(applyDiscountViewSpy.calledMethods, [.showPriceWithDiscount])
    }

    func test_WhenCallShowError_ShouldCallShowErrorOnView() {
        sut.showError(message: "")

        XCTAssertEqual(applyDiscountViewSpy.calledMethods, [.showErrorMessage])
    }

    private func makeSUT() -> SUT {
        let controller = ApplyDiscountViewController(applyDiscountView: applyDiscountViewSpy)
        controller.interactor = interactorSpy
        return controller
    }
}
