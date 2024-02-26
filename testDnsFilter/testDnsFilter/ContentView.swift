//
//  ContentView.swift
//  testDnsFilter
//
//  Created by Juben Rana on 2/20/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            LoginScreen()
//                .onOpenURL { url in
//                    GIDSignIn.sharedInstance.handle(url)
//                }
            
            Spacer()
                        
            #if os(macOS)
            Text("I'm running on macOS")
            #else
            Text("I'm running on iOS")
            #endif
            
            Spacer()
            

            Button("Activate") {
                #if os(macOS)
                ContentFilterMac.shared.activate()
                #elseif os(iOS)
                ContentFilter.shared.enable()
                #endif
            }

            Spacer()

                        
            Button("Deactivate") {
                #if os(macOS)
                ContentFilterMac.shared.deactivate()
                #elseif os(iOS)
                ContentFilter.shared.disable()
                #endif
            }
            
            Spacer()
            
            Spacer()

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
