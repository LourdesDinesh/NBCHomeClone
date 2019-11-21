//
//  StringExtension.swift
//  NBCHomeClone
//
//  Created by Tringapps on 11/21/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import Foundation
extension String {
    public func isOfFormat(_ format:String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", format)
        return emailPred.evaluate(with: self)
    }
}
