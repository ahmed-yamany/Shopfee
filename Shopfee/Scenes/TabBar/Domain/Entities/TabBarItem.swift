//
//  TabBarItem.swift
//  Shopfee
//
//  Created by Ahmed Yamany on 03/05/2024.
//

import SwiftUI

enum TabBarItemType: Hashable, CaseIterable {
    case home
    case history
    case account
}

protocol TabBarItem: Identifiable {
    var type: TabBarItemType { get }
    var title: String { get }
    var image: Image { get }
    var onSelectedImage: Image { get }
    var view: AnyView { get }
}

struct HomeTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemType = .home
    var title: String = "Home"
    var image: Image = Image(systemName: "house")
    var onSelectedImage: Image = Image(systemName: "house.fill")
    let view: AnyView
}

struct HistoryTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemType = .history
    var title: String = "History"
    var image: Image = Image(systemName: "doc.plaintext")
    var onSelectedImage: Image = Image(systemName: "doc.plaintext.fill")
    let view: AnyView
}

struct AccountTabBarItem: TabBarItem {
    var id = UUID()
    var type: TabBarItemType = .account
    var title: String = "Account"
    var image: Image = Image(systemName: "person")
    var onSelectedImage: Image = Image(systemName: "person.fill")
    let view: AnyView
}
