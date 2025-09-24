//
//  File.swift
//  AppNetwork
//
//  Created by Kwarteng on 23/09/2025.
//

import SwiftUI


/// Load Data manager protocol. This defines how data is loaded by a view.
/// Various data managers should conform to this protocol and implement fetchData method.
public protocol LoadData: View {
    
    associatedtype ContentData: Decodable
    associatedtype Content: View
    associatedtype LoadingView: View
    associatedtype EmptyDataView: View
    associatedtype ErrorView: View
    
    var state: Binding<ViewState<ContentData>> {get set }
    
    @ViewBuilder var content:(ContentData?) -> Content { get set }
    
    func getProgressView() -> LoadingView
    func getEmptyView() -> EmptyDataView
    func getErrorView(_ error: Error) -> ErrorView
    
}


public extension LoadData {
    
    @ViewBuilder public var body: some View {
        
        switch state.wrappedValue {
        case .loadedData(let data, _): content(data)
        case .loaded: content(nil)
        default: getOtherStateView()
        }
    }
    
    func getProgressView() -> some View {
        ProgressView()
    }
    
    func getEmptyView() -> some View {
        Text("No data available")
    }
    
    func getErrorView(_ error: Error) -> some View {
        Text("An error occurred: \(error.localizedDescription)")
    }
    
    
    func getOtherStateView() -> some View {

        VStack(alignment: .center) {
            switch state.wrappedValue {
            case .loading:
                getProgressView()
            case .error(let error):
                getErrorView(error)
            case .empty:
                getEmptyView()
            default:
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)

    }
}


public protocol LoadDataWithProgress: LoadData {
    
    associatedtype LoadingView: View
    
    var loadingView: LoadingView {get set}
    
}

public extension LoadDataWithProgress {
    
    public func getProgressView() -> LoadingView {
        loadingView
    }
    
}


public protocol LoadDataWithError: LoadData {
    
    associatedtype ErrorView: View
    
    var errorView:(Error) -> ErrorView {get set}

}

public extension LoadDataWithError {
    
    func getErrorView(_ error: Error) -> ErrorView {
        errorView(error)
    }
}


public protocol LoadEmptyData: LoadData {
    
    associatedtype EmptyDataView: View
    
    var emptyView: EmptyDataView {get set}
    
}

public extension LoadEmptyData {
    
    public func getEmptyView() -> EmptyDataView {
        emptyView
    }
    
}


typealias LoadProgressEmptyData = LoadDataWithProgress & LoadEmptyData


typealias LoadProgressWithErrorData = LoadDataWithProgress & LoadDataWithError


typealias LoadCompleteData = LoadDataWithProgress & LoadEmptyData & LoadDataWithError


