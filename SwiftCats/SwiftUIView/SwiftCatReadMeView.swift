//
//  SwiftCatReadMeView.swift
//  SwiftCats
//
//  Created by Ace Authors on 25/4/21.
//  Copyright © 2021 Yilei He. All rights reserved.

import SwiftUI

struct SwiftCatReadMeView: View {
    let uikitInfo = """
        😸 UIKit Demo:
        Demonstrate using UIKit
    """
    
    let swiftUIDemo = """
        😸 SwiftUI/Combine Demo:
        Demonstrate using SwiftUI + Combine framework
        - Switching between datasources: local/remote
        - Using Combine Framework
        - Simple filter functionality (human only)
        - Simple errors handling (network errors)
    """
    
    let techInfo = """
        😸 Nerd Info:
        - Mixed UIKit/SwiftUI/Combine Framework
        - Object Serialisation (JSON/Decoding)
        - Model-View-ViewModel (MVVM) pattern
        - Unit test and UI Automation Test, Code Coverage +86%
        - iOS 14+ (support both iPhones/iPads)
        - Autolayout (landscape/portrait)
        - Swift 5.3
    """
    
    let otherInfo = """
        Thank you for reviewing my code.
        Ace, 2021.04.25
    """
    
    var body: some View {
        ScrollView {
            VStack {
                Image("cat")
                Text("Swift Cat").bold().font(.title)
                Text("by Ace")
                Divider()
                VStack(alignment: .leading) {
                    Text(uikitInfo)
                    Divider()
                    Text(swiftUIDemo)
                    Divider()
                    Text(techInfo)
                    Divider()
                    Text(otherInfo)
                        .padding(.vertical, 12)
                        .foregroundColor(.gray)
                    Divider()
                }
                .font(.caption)
            }
            .padding(.vertical)
            .padding(.horizontal, 32)
        }
    }
}
