//
//  AboutView.swift
//  E-Commerce App
//
//  Created by Alaa Abu Taha on 3/7/20.
//  Copyright © 2020 Alaa Abu Taha. All rights reserved.
//

import SwiftUI
import UIKit

struct AboutView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("About Me")
                        .font(.title)
                    Text("Made by ❤️. GitHub: alaaiosdev\n\nhttps://github.com/alaaiosdev\n\n©2020 Alaa Ajoury. All Rights Reserved.")
                        .font(.body)
                        .padding(.all)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Statistic")
                            .font(.title)
                        Text("""
E-commerce (electronic commerce)
is the buying and selling of goods and services, or the transmitting of funds or data, over an electronic network, primarily the internet.
""")
                            .font(.body)
                            .padding(.all)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Other Information")
                            .font(.title)
                        Text("""
Linkedin:
https://www.linkedin.com/in/alaa-abutaha/
""")
                            .font(.body)
                            .padding(.all)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                    }
                }
                .padding(.all)
            }
            .navigationBarTitle("About", displayMode: .inline)
            .background(Color(UIColor.secondarySystemBackground))
        }
    }
}
