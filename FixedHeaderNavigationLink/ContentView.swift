//
//  ContentView.swift
//  FixedHeaderNavigationLink
//
//  Created by Dan Kinney on 1/30/20.
//  Copyright © 2020 Dan Kinney. All rights reserved.
//

import SwiftUI

struct DestinationViewWithManualBack: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Expected: The back button should be visible and usable even though navigationBarHidden is true")
            .padding()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            }) {
                Text("Manual button to get back")
            }
            .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Desired: I would like a fixed header area that can have NavigationLinks embedded.  I also want a ScrollView below it with more content, also with NavigationLinks.").padding()
                
                NavigationLink(destination: DestinationViewWithManualBack()) {
                    Text("Link 1 - Does NOT work as expected").padding()
                }
                
                
                ScrollView {
                    NavigationLink(destination: Text("Navigation links work as expected when they are part of a ScrollView or List only.").padding()) {
                        Text("Link 3 - DOES work as expected").padding()
                    }
                }
            }
            .navigationBarTitle(Text(" "), displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
