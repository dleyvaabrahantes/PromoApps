//
//  File.swift
//  PromoApps
//
//  Created by David on 11/6/24.
//

import Foundation
import SwiftUI

@available(iOS 16.0.0, *)
public struct PromoAppsPackage {
    @MainActor public static func PromoAppsDialog(actionNo: @escaping () -> Void, actionYes: @escaping () -> Void, title: String, nameImage: String) -> some View{
        PromoApps(actionNo: actionNo, actionYes: actionYes, title: title, nameImage: nameImage)
    }
}
