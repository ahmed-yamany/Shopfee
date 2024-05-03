//
//  TabBarItem.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI

enum TabBarItemTypes: Hashable {
    case home
    case history
    case account
}

protocol TabBarItem: Identifiable {
    var type: TabBarItemTypes { get }
    var title: String { get }
    var image: Image { get }
    var onSelectedImage: Image { get }
    var view: AnyView { get }
}

struct HomeTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemTypes = .home
    var title: String = "Home"
    var image: Image = Image(systemName: "house")
    var onSelectedImage: Image = Image(systemName: "house.fill")
    var view: AnyView {
        Text("Hello Home!").eraseToAnyView()
    }
}

struct HistoryTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemTypes = .history
    var title: String = "History"
    var image: Image = Image(systemName: "doc.plaintext")
    var onSelectedImage: Image = Image(systemName: "doc.plaintext.fill")
    var view: AnyView {
        Text("Hello History!").eraseToAnyView()
    }
}

struct AccountTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemTypes = .account
    var title: String = "Account"
    var image: Image = Image(systemName: "person")
    var onSelectedImage: Image = Image(systemName: "person.fill")
    var view: AnyView {
        Text("Hello Account!").eraseToAnyView()
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
