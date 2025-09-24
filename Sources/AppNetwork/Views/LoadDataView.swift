// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public struct SimpleDataView<ContentData:Decodable, Content:View>: LoadData {
    

    @ViewBuilder public var content: (ContentData?) -> Content
    
    public var state: Binding<ViewState<ContentData>>
    
    public init(state: Binding<ViewState<ContentData>>, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
    }


}

public struct ErrorDataView<ContentData:Decodable, Content:View, ErrorView:View>: LoadDataWithError {

    public var errorView:(Error) -> ErrorView

    @ViewBuilder public var content: (ContentData?) -> Content
    
    public var state: Binding<ViewState<ContentData>>

    public init(state: Binding<ViewState<ContentData>>, errorView:@escaping (Error) -> ErrorView, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
        self.errorView = errorView
    }

}

public struct EmptyDataView<ContentData:Decodable, Content:View, EmptyDataView:View>: LoadEmptyData {
    
    public var emptyView:EmptyDataView
    
    @ViewBuilder public var content: (ContentData?) -> Content
    
    public var state: Binding<ViewState<ContentData>>
    
    public init(state: Binding<ViewState<ContentData>>, emptyView:EmptyDataView, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
        self.emptyView = emptyView
    }

}


public struct ProgressDataView<ContentData:Decodable, Content:View, LoadingView:View>: LoadDataWithProgress {
    
    public var loadingView:LoadingView
    
    @ViewBuilder public var content: (ContentData?) -> Content
    
    public var state: Binding<ViewState<ContentData>>
    
    
    public init(state: Binding<ViewState<ContentData>>, loadingView:LoadingView, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
        self.loadingView = loadingView
    }

}



public struct EmptyProgressDataView<Content:View, LoadingView:View, ContentData:Decodable, EmptyDataView:View>: LoadProgressEmptyData {
    
    public var loadingView: LoadingView
    
    public var emptyView: EmptyDataView
    
    public var state: Binding<ViewState<ContentData>>
    
    @ViewBuilder public var content:(ContentData?) -> Content
    
    public init(state: Binding<ViewState<ContentData>>, loadingView:LoadingView, emptyView:EmptyDataView, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
        self.loadingView = loadingView
        self.emptyView = emptyView
    }
    

}




public struct CompleteDataView<Content:View, LoadingView:View, ContentData:Decodable, EmptyDataView:View, ErrorView:View>: LoadCompleteData {
    
    public var loadingView: LoadingView
    
    public var emptyView: EmptyDataView
    
    public var errorView: ((Error) -> ErrorView)
    
    public var state: Binding<ViewState<ContentData>>
    
    @ViewBuilder public var content:(ContentData?) -> Content

    public init(state: Binding<ViewState<ContentData>>, loadingView:LoadingView, emptyView: EmptyDataView, errorView:@escaping (Error) -> ErrorView, @ViewBuilder content: @escaping (ContentData?) -> Content) {
        self.state = state
        self.content = content
        self.loadingView = loadingView
        self.errorView = errorView
        self.emptyView = emptyView
    }
}

