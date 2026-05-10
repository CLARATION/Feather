//
//  SettingsViewController.swift
//  Feather
//
//  Created by samsam on 5/10/26.
//

import UIKit

class SettingsViewController: UITableViewController {
	init() {
		super.init(style: .insetGrouped)
	}
	
	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.title = .localized("Settings")
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
	}
}

extension SettingsViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "SettingsCell",
			for: indexPath
		)
		
		cell.accessoryType = .disclosureIndicator
		
		var content = cell.defaultContentConfiguration()
		content.text = "hai"
		cell.contentConfiguration = content
		
		return cell
	}
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
