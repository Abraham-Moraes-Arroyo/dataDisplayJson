//
//  ContentView.swift
//  dataDisplayJson
//
//  Created by Abraham Morales Arroyo on 3/27/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadJsonData()
    var body: some View {
        VStack {
            List(data.users) { info in
                Text(info.COMMUNITY_AREA)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
