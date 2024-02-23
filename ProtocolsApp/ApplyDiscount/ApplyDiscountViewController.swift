//
//  ApplyDiscountViewController.swift
//  ProtocolsApp
//
//  Created by Renato F. dos Santos Jr on 19/02/24.
//

import UIKit

protocol ApplyDiscountViewControllerProtocol: AnyObject {
    func showProductInfo(product: String, discountInfo: String)
    func showDiscount(message: String)
    func showError(message: String)
}

final class ApplyDiscountViewController: UIViewController {
    var interactor: ApplyDiscountInteractorProtocol?

    // MARK: - Private properties
    private var applyDiscountView: ApplyDiscountViewPresentable

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ViewController"
        view.backgroundColor = .white
        interactor?.didLoad()
    }

    override func loadView() {
        super.loadView()
        view = applyDiscountView
    }

    // MARK: - Object lifecycle
    init(applyDiscountView: ApplyDiscountViewPresentable = ApplyDiscountView()) {
        self.applyDiscountView = applyDiscountView
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setup() {
        applyDiscountView.delegate = self

        let viewController = self
        let interactor = ApplyDiscountInteractor()
        let presenter = ApplyDiscountPresenter()

        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
}

extension ApplyDiscountViewController: ApplyDiscountViewControllerProtocol {
    func showProductInfo(product: String, discountInfo: String) {
        applyDiscountView.setProductLabel(text: product)
        applyDiscountView.setInfoLabel(text: discountInfo)
    }

    func showDiscount(message: String) {
        applyDiscountView.showPriceWithDiscount(message: message)
    }

    func showError(message: String) {
        applyDiscountView.showErrorMessage(message: message)
    }
}

extension ApplyDiscountViewController: ApplyDiscountViewOutputProtocol {
    func applyDiscount(value: String) {
        interactor?.applyDiscount(value: value)
    }
}
