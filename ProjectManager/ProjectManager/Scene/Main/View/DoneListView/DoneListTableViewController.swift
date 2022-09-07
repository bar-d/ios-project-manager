//
//  DoneListTableViewController.swift
//  ProjectManager
//
//  Created by brad, bard on 2022/09/07.
//

import UIKit

final class DoneListTableViewController: UIViewController {
    
    // MARK: - Properties
        
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return uiLabel
    }()
    
    private let indexLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.text = "9"
        
        return uiLabel
    }()
    
    private let todoItemTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DoneListTableViewCell.self, forCellReuseIdentifier: DoneListTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        
        return tableView
    }()
    
    // MARK: Initializers
    
    init(title: String) {
        self.titleLabel.text = title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoItemTableView.delegate = self
        setupSubviews()
        setupListTableViewLayout()
    }
    
    // MARK: - Functions
    
    private func setupSubviews() {
        self.view.addSubview(verticalStackView)
        
        [titleLabel, indexLabel]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        [horizontalStackView, todoItemTableView]
            .forEach { verticalStackView.addArrangedSubview($0) }
    }
    
    private func setupListTableViewLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.view.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

// MARK: - Extentions

extension DoneListTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DoneListTableViewCell.identifier, for: indexPath) as? DoneListTableViewCell
        else { return UITableViewCell() }
                
        return cell
    }
}
