//
//  LoadMoreView.swift
//  AppNetwork
//
//  Created by Kwarteng on 21/09/2025.
//

import SwiftUI

public struct LoadMoreView<State>: View {
    
    @Binding var state: ViewState<State>
    @Binding var nextPage: Int?
    
    var loadMore:(() async -> Void)? = nil
    
    public init(_ state: Binding<ViewState<State>>, page: Binding<Int?>, load loadMore: (() async -> Void)? = nil) {
        self._state = state
        self._nextPage = page
        self.loadMore = loadMore
    }
    
    var canLoadMore: Bool {
        guard let nextPage, nextPage > 0 else {
            return false
        }
        return true
    }
    
    public var body: some View {
        if case .loaded(.some) = state, canLoadMore {
            ProgressView()
                .task {
                    await loadMore?()
                }
        } else {
            EmptyView()
        }
    }
}
