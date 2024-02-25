//
//  ApplyDiscountInteractorSpy.swift
//  ProtocolsAppTests
//
//  Created by Renato F. dos Santos Jr on 25/02/24.
//

@testable import ProtocolsApp

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
