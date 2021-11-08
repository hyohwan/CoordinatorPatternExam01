//
//  HomeViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    var viewModel: HomeViewModel?
    
    private let buttonA : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("push A", for: .normal)
        button.addTarget(self, action: #selector(buttonATapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let buttonB : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("push B", for: .normal)
        button.addTarget(self, action: #selector(buttonBTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let stack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    private func setupNavigation() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .gray
        if #available(iOS 13, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController?.navigationBar.shadowImage = UIImage()
            navigationController?.navigationBar.backgroundColor = .clear
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .gray
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.addArrangedSubview(buttonA)
        stack.addArrangedSubview(buttonB)
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc
    private func buttonATapped() {
//        detailViewModel = DetailViewModel(title: "Detail A")
        coordinator?.pushDetail(viewModel: DetailViewModel(title: "Detail A"))
    }
    
    @objc
    private func buttonBTapped() {
        coordinator?.pushDetail(viewModel: DetailViewModel(title: "Detail B"))
    }
}
