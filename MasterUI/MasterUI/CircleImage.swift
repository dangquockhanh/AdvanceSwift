//
//  CircleImage.swift
//  MasterUI
//
//  Created by Đặng Khánh  on 7/26/20.
//  Copyright © 2020 Đặng Khánh . All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
                 .overlay(
                     Circle().stroke(Color.white, lineWidth: 4))
                 .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
