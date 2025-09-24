//
//  EmptyPlaceholderView.swift
//  Linkups
//
//  Created by Kwarteng on 09/05/2025.
//

import SwiftUI

struct EmptyPlaceholderView<Content: View>: View {
    
    var message: String
    var iconName: String
    var systemIcon: Bool = false
    
    var content: Content
    
    init(message: String, iconName: String, systemIcon: Bool = false, @ViewBuilder content: () -> Content) {
        self.message = message
        self.iconName = iconName
        self.systemIcon = systemIcon
        self.content = content()
    }
    
    var body: some View {
        
        VStack {
            emptyView
            
            content
        }
        
    }
    
    var emptyView: some View {
        VStack(alignment:.center, spacing:10) {
            Group {
                if !systemIcon {
                    Image(iconName)
                        .resizable()
                        .opacity(0.4)
                } else {
                    Image(systemName: iconName)
                        .resizable()
                        .foregroundStyle(.white.opacity(0.4))
                }
            }
            
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .shadow(color: .black, radius: 2, x: 0, y: 1)
            
            Text(message)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white.opacity(0.4))
                .padding(.horizontal, 25)
                .shadow(color: .black, radius: 2, x: 0, y: 1)
        }
    }
}

