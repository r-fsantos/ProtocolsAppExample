//
//  ApplyDiscountViewSpy.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 23/02/24.
//

import UIKit
@testable import ProtocolsApp

final class ApplyDiscountViewSpy: ApplyDiscountViewPresentable {
    // MARK: - Stub + Spy
    enum Methods {
        case setProductLabel
        case setInfoLabel
        case showPriceWithDiscount
        case showErrorMessage
    }

    private (set) var calledMethods: [Methods] = []

    // MARK: - Protocol properties
    var delegate: ProtocolsApp.ApplyDiscountViewOutputProtocol?

    func setProductLabel(text: String) {
        calledMethods.append(.setProductLabel)
    }

    func setInfoLabel(text: String) {
        calledMethods.append(.setInfoLabel)
    }

    func showPriceWithDiscount(message: String) {
        calledMethods.append(.showPriceWithDiscount)
    }

    func showErrorMessage(message: String) {
        calledMethods.append(.showErrorMessage)
    }
}
