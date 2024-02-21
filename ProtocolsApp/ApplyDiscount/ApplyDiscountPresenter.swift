//
//  ApplyDiscountPresenter.swift
//  ProtocolsApp
//
//  Created by Renato F. dos Santos Jr on 20/02/24.
//

import UIKit

protocol ApplyDiscountPresenterProtocol: AnyObject {
    func showProductInfo(name: String,
                         price: Double,
                         minDiscountValue: Int,
                         maxDiscountValue: Int)
    func showDiscount(name: String,
                      price: Double,
                      priceWithDiscount: Double)
    func showError(error: ApplyDiscountInteractor.ApplyDiscountError,
                   validRange: (min: Int, max: Int))
}

final class ApplyDiscountPresenter: ApplyDiscountPresenterProtocol {
    weak var viewController: ApplyDiscountViewControllerProtocol?

    func showProductInfo(name: String,
                         price: Double,
                         minDiscountValue: Int,
                         maxDiscountValue: Int) {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency

        let productText = "\(name)\n\(String(describing: formatter.string(from: NSNumber(floatLiteral: price)) ?? ""))"
        let discountInfoText = "Informe um valor entre \(minDiscountValue) e \(maxDiscountValue)"

        viewController?.showProductInfo(product: productText,
                                        discountInfo: discountInfoText)
    }

    func showDiscount(name: String,
                      price: Double,
                      priceWithDiscount: Double) {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        let message = "\(name)\nde: \(String(describing: formatter.string(from: NSNumber(floatLiteral: price)) ?? ""))\npor: \(String(describing: formatter.string(from: NSNumber(floatLiteral: priceWithDiscount)) ?? ""))"
        viewController?.showDiscount(message: message)
    }

    func showError(error: ApplyDiscountInteractor.ApplyDiscountError,
                   validRange: (min: Int, max: Int)) {
        switch error {
        case .invalidNumber:
            viewController?.showError(message: "Informe um número válido")
        case .lessThanMinDiscountValue:
            viewController?.showError(message: "Informe um número maior do que \(validRange.min)")
        case .higherThanMaxDiscountValue:
            viewController?.showError(message: "Informe um número menor do que \(validRange.max)")
        }
    }
}
