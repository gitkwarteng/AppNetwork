//
//  ViewState.swift
//  AppNetwork
//
//  Created by Kwarteng on 16/09/2025.
//


/// Enum for managing various view states.
public enum ViewState<Content>: Equatable {
    public static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        lhs.id == rhs.id
    }
    
    /// State for view that is currently loading data
    case loading
    
    /// State for view that has finished loading
    case loaded(Int?)
    
    /// State for view that has finished loading with data
    case loadedData(Content, Int?)

    /// State for error requests
    case error(Error)
    
    /// State for views with no data
    case empty
    
    public var id: Int {
        switch self {
        case .loading:
            return 1
        case .loaded:
            return 2
        case .loadedData:
            return 3
        case .error:
            return 4
        case .empty:
            return 5
        }
    }
    
}

