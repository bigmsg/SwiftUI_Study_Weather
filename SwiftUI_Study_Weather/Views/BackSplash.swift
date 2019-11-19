//
//  BackSplash.swift
//  SwiftUI_Study_Weather
//
//  Created by 관리자 on 2019/11/19.
//  Copyright © 2019 관리자. All rights reserved.
//

import SwiftUI

struct BackSplash: View {
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color("lightPink"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom))
            
            

            .edgesIgnoringSafeArea(.all)
    }
}

struct BackSplash_Previews: PreviewProvider {
    static var previews: some View {
        BackSplash()
    }
}
