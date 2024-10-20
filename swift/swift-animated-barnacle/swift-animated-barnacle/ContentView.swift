//
//  ContentView.swift
//  swift-animated-barnacle
//
//  Created by m1_air on 10/18/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        HStack{
            LoginView()
        }.onAppear{
            SocketService.shared.socket.connect()
        }.onChange(of: SocketService.shared.connected, {
            if SocketService.shared.connected {
                SocketService.shared.socket.emit("fromSwiftUI", ["message":"SwiftUI connected!"])
            }
        })
    }
}

#Preview {
    ContentView()
}
