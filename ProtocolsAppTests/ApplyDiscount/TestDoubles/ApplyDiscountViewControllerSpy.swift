//
//  ApplyDiscountViewControllerSpy.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 25/02/24.
//

@testable import ProtocolsApp

final class ApplyDiscountViewControllerSpy: ApplyDiscountViewControllerProtocol {
    enum Methods {
        case showProductInfo
        case showDiscount
        case showError
    }

    private (set) var calledMethods: [Methods] = []

    func showProductInfo(product: String, discountInfo: String) {
        calledMethods.append(.showProductInfo)
    }

    func showDiscount(message: String) {
        calledMethods.append(.showDiscount)
    }

    func showError(message: String) {
        calledMethods.append(.showError)
    }
}
