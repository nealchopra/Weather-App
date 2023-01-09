//
//  LoadingView.swift
//  Weather App
//
//  Created by Neal Chopra on 1/7/23.
//

import SwiftUI

struct LoadingView: View
{
    var body: some View
    {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider
{
    static var previews: some View
    {
        LoadingView()
    }
}
