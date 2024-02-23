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

    func test_WhenUserTapButtonOnView_ShouldCallApplyDiscountOnViewController() {
        sut.loadViewIfNeeded()

        let stackView = sut.view.subviews.first
        let button = stackView?.subviews.first { $0.isKind(of: UIButton.self) } as? UIButton

        button?.sendActions(for: .touchUpInside)

        XCTAssertEqual(interactorSpy.calledMethods, [.didLoad, .applyDiscount])
    }

    private func makeSUT() -> SUT {
        let controller = ApplyDiscountViewController()
        controller.interactor = interactorSpy
        return controller
    }
}

final class ApplyDiscountInteractorSpy: ApplyDiscountInteractorProtocol {
    enum Methods {
        case didLoad
        case applyDiscount
    }

    private (set) var calledMethods: [Methods] = []

    func didLoad() {
        calledMethods.append(.didLoad)
    }

    func applyDiscount(value: String) {
        calledMethods.append(.applyDiscount)
    }
}
