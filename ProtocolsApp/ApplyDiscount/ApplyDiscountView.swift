//
//  ApplyDiscountView.swift
//  ProtocolsApp
//
//  Created by Renato F. dos Santos Jr on 19/02/24.
//

import UIKit

protocol ApplyDiscountViewInputProtocol {
    func setProductLabel(text: String)
    func setInfoLabel(text: String)
    func showPriceWithDiscount(message: String)
    func showErrorMessage(message: String)
}

protocol ApplyDiscountViewOutputProtocol {
    func applyDiscount(value: String)
}


final class ApplyDiscountView: UIView {
    var delegate: ApplyDiscountViewOutputProtocol?

    // MARK: - Private properties
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.alignment = .center
        element.spacing = 16
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var productLabel: UILabel = {
        let element = UILabel()
        element.textColor = .black
        element.font = .boldSystemFont(ofSize: 16)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var valueTextField: UITextField = {
        let element = UITextField()
        element.placeholder = "10%"
        element.borderStyle = .roundedRect
        element.keyboardType = .numberPad
        element.layer.cornerRadius = 5
        element.rightViewMode = .always
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var infoLabel: UILabel = {
        let element = UILabel()
        element.textColor = .systemGray
        element.font = .systemFont(ofSize: 11)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var button: UIButton = {
        let element = UIButton()
        element.setTitle("Aplicar Desconto", for: .normal)
        element.backgroundColor = .systemBlue
        element.layer.cornerRadius = 5
        element.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var productWithDiscountLabel: UILabel = {
        let element = UILabel()
        element.textColor = .blue
        element.font = .systemFont(ofSize: 16)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.isHidden = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    // MARK: - Actions
    @objc func didTapButton() {
        delegate?.applyDiscount(value: valueTextField.text ?? "0")
    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    // TODO: - Apply ViewCodable protocol
    private func buildViewHierarchy() {
        addSubview(stackView)
        let subViews = [productLabel, valueTextField, infoLabel, button, productWithDiscountLabel]
        subViews.forEach { stackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),

            valueTextField.widthAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

    private func setupAdditionalConfiguration() {
        stackView.setCustomSpacing(4, after: valueTextField)
        stackView.setCustomSpacing(40, after: infoLabel)
    }
}


extension ApplyDiscountView: ApplyDiscountViewInputProtocol {
    func setProductLabel(text: String) {
        productLabel.text = text
    }

    func setInfoLabel(text: String) {
        infoLabel.text = text
    }

    func showPriceWithDiscount(message: String) {
        productWithDiscountLabel.textColor = .green
        productWithDiscountLabel.text = message
        productWithDiscountLabel.isHidden = false
    }

    func showErrorMessage(message: String) {
        productWithDiscountLabel.textColor = .red
        productWithDiscountLabel.text = message
        productWithDiscountLabel.isHidden = false
    }
}
