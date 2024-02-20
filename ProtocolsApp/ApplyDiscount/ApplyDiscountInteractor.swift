//
//  ApplyDiscountInteractor.swift
//  ProtocolsApp
//
//  Created by Renato F. dos Santos Jr on 20/02/24.
//

import UIKit

protocol ApplyDiscountInteractorProtocol: AnyObject {
    func didLoad()
    func applyDiscount(value: String)
}

final class ApplyDiscountInteractor: ApplyDiscountInteractorProtocol {
    enum ApplyDiscountError {
        case invalidnumber
        case lessThanMinDiscountValue
        case higherThanMaxDiscountValue
    }

    var presenter: ApplyDiscountPresenterProtocol?

    let minDiscountValue: Int = 1
    let maxDiscountValue: Int = 30

    let productName: String = "Mackbook Pro"
    let productPrice: Double = 12000

    func didLoad() {
        presenter?.showProductInfo(name: productName,
                                   price: productPrice,
                                   minDiscountValue: minDiscountValue,
                                   maxDiscountValue: maxDiscountValue)
    }

    func applyDiscount(value: String) {
        let validRange = (min: minDiscountValue, maxDiscountValue)
        guard let number = Double(value) else {
            presenter?.showError(error: .invalidnumber, validRange: validRange)
            return
        }

        if number < Double(minDiscountValue) {
            presenter?.showError(error: .lessThanMinDiscountValue,
                                 validRange: validRange)
        } else if number > Double(maxDiscountValue) {
            presenter?.showError(error: .higherThanMaxDiscountValue,
                                 validRange: validRange)
        } else {
            let priceWithDiscount = productPrice * (1 - number / 100)
            presenter?.showDiscount(name: productName,
                                    price: productPrice,
                                    priceWithDiscount: priceWithDiscount)
        }
    }
}
