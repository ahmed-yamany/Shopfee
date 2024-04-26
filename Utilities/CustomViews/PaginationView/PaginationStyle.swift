//
//  PaginationStyle.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import SwiftUI

// A structure representing the configuration parameters for pagination.
struct PaginationConfigurations {
    let currentIndex: Int
    var selectedIndex: Int
}

// A protocol defining the contract for a pagination style.
protocol PaginationStyle: DynamicProperty {
    associatedtype Body: View
    typealias Configurations = PaginationConfigurations
    
    @ViewBuilder
    func makeBody(configurations: Configurations) -> Body
}

// An environment key used to store the default pagination style.
struct PaginationKey: EnvironmentKey {
    static var defaultValue: any PaginationStyle = CirclePaginationStyle()
}

extension EnvironmentValues {
    // A property to access the current pagination style in the environment.
    var paginationStyle: any PaginationStyle {
        get { self[PaginationKey.self] }
        set { self[PaginationKey.self] = newValue }
    }
}

extension View {
    // A modifier to set the pagination style for a view.
    func paginationStyle(_ style: any PaginationStyle) -> some View {
        environment(\.paginationStyle, style)
    }
}

// A view that resolves the pagination style using the provided configurations.
struct ResolvedPaginationStyle<Style: PaginationStyle>: View {
    var configurations: Style.Configurations
    var style: Style
    
    var body: some View {
        style.makeBody(configurations: configurations)
    }
}

extension PaginationStyle {
    // A method to resolve and apply the pagination style using the provided configurations.
    func resolve(configurations: Configurations) -> some View {
        ResolvedPaginationStyle(configurations: configurations, style: self)
    }
}

// An environment key used to store the default selected tint color for pagination.
struct PaginationSelectTintColorKey: EnvironmentKey {
    static var defaultValue: Color = .blue
}

// An environment key used to store the default tint color for pagination.
struct PaginationTintColorKey: EnvironmentKey {
    static var defaultValue: Color = .gray
}

extension EnvironmentValues {
    // A property to access the current selected tint color for pagination in the environment.
    var paginationSelectTint: Color {
        get { self[PaginationSelectTintColorKey.self] }
        set { self[PaginationSelectTintColorKey.self] = newValue }
    }
    
    // A property to access the current tint color for pagination in the environment.
    var paginationTint: Color {
        get { self[PaginationTintColorKey.self] }
        set { self[PaginationTintColorKey.self] = newValue }
    }
}

extension View {
    // A modifier to set the selected tint color for pagination.
    func paginationSelectTint(_ color: Color) -> some View {
        environment(\.paginationSelectTint, color)
    }
    
    // A modifier to set the tint color for pagination.
    func paginationTint(_ color: Color) -> some View {
        environment(\.paginationTint, color)
    }
}
