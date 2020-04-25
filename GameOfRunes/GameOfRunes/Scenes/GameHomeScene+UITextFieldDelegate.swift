//
//  GameHomeScene+UITextFieldDelegate.swift
//  GameOfRunes
//
//  Created by Jermy on 17/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit

extension GameHomeScene: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if string.isEmpty || string == " " {
            return true
        } else if (textField.text ?? "").count > 12 {
            return false
        } else {
            // ensures all characters are alphanumerics
            return string.removingCharacters(in: .alphanumerics).isEmpty
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let processedText = (textField.text ?? "")
            .replacingOccurrences(of: "^\\s+", with: "", options: .regularExpression)
        playerName = processedText.trimmingCharacters(in: .whitespacesAndNewlines)
        textField.text = processedText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
