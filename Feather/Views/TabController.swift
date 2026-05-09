//
//  TabbarController.swift
//  Feather
//
//  Created by samsam on 5/8/26.
//

import UIKit
import SwiftUI

final class TabController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		_setupTabs()
	}
	
	private func _setupTabs() {
		let files = _createNavigation(
			with: .localized("Files"),
			using: UIImage(systemName: "folder.fill"),
			controller: UIViewController()
		)
		
		let sources = _createNavigation(
			with: .localized("Sources"),
			using: UIImage(systemName: "globe.desk.fill"),
			controller: UIHostingController(rootView: SourcesView()),
			withNavigation: false,
		)
		
		let library = _createNavigation(
			with: .localized("Apps"),
			using: UIImage(systemName: "square.grid.2x2.fill"),
			controller: UIHostingController(rootView: LibraryView()),
			withNavigation: false,
		)
		
		let settings = _createNavigation(
			with: .localized("Settings"),
			using: UIImage(systemName: "gearshape.2.fill"),
			controller: UIHostingController(rootView: SettingsView()),
			withNavigation: false,
		)
		
		self.setViewControllers([
			files,
			sources,
			library,
			settings,
		], animated: false)
	}
	
	#warning("remove swiftui remnants")
	private func _createNavigation(
		with title: String,
		using image: UIImage?,
		controller: UIViewController,
		withNavigation: Bool = true
	) -> UIViewController {
		if withNavigation {
			let nav = UINavigationController(rootViewController: controller)
			nav.tabBarItem.title = title
			nav.tabBarItem.image = image
			nav.viewControllers.first?.navigationItem.title = title
			return nav
		} else {
			controller.tabBarItem.title = title
			controller.tabBarItem.image = image
			controller.navigationItem.title = title
			return controller
		}
	}
}
