//
//  ApplyDiscountPresenterSpy.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 25/02/24.
//

@testable import ProtocolsApp

final class ApplyDiscountPresenterSpy: ApplyDiscountPresenterProtocol {
    enum Methods {
        case showProductInfo
        case showDiscount
        case showError
    }

    private (set) var calledMethods: [Methods] = []

    func showProductInfo(name: String, price: Double, minDiscountValue: Int, maxDiscountValue: Int) {
        calledMethods.append(.showProductInfo)
    }

    func showDiscount(name: String, price: Double, priceWithDiscount: Double) {
        calledMethods.append(.showDiscount)
    }

    func showError(error: ProtocolsApp.ApplyDiscountInteractor.ApplyDiscountError, validRange: (min: Int, max: Int)) {
        calledMethods.append(.showError)
    }
}
