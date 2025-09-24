//
//  Extensions.swift
//  AppNetwork
//
//  Created by Kwarteng on 22/09/2025.
//

import SwiftUI


//
//public extension View {
//    public func showState<LoadingView: View, EmptyContent: View>(
//        state: Binding<ViewState>,
//        withMessage message:String = "No results",
//        withIcon iconName:String = "mail.and.text.magnifyingglass",
//        systemIcon:Bool = true,
//        loading: LoadingView? = nil,
//        empty: EmptyContent? = nil
//    ) -> some View {
//       self
//        .overlay(alignment: .center) {
//            ZStack {
//                EmptyPlaceholderView(
//                    message: message,
//                    iconName: iconName,
//                    systemIcon: systemIcon
//                ) {
//                    empty
//                }
//                .opacity(state.wrappedValue == .empty ? 1 : 0)
//
//                loading
//                    .onAppear {
//                        print("Loading... \(state.wrappedValue)")
//                    }
//                    .opacity(state.wrappedValue == .loading ? 1 : 0)
//            }
//        }
//    }
//}
