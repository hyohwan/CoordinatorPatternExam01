//
//  EditorViewController.swift
//  CoordinatorPatternExam01
//
//  Created by Hyohwan Seo on 2021/11/05.
//

import UIKit

class EditorViewController: UIViewController {
    
    weak var coordinator: HomeCoordinator?
    weak var viewModel: EditorViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
    }
}
