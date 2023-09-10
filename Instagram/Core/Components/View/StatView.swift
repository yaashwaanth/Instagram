//
//  StatView.swift
//  Instagram
//
//  Created by G Yashwanth Sharma on 04/09/23.
//

import SwiftUI

struct StatView: View {
    let value : Int
    let title : String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(title)")
                .font(.footnote)
        }
        .frame(width: 76)
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(value: 12, title: "Posts")
    }
}
