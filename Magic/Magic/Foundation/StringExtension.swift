//
//  StringExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/11.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Initializers
public extension String {
    
    /// Create a new string from a base64 string (if applicable).
    ///
    /// - Parameter base64: base64 string.
    init?(base64: String) {
        if let string = base64.base64Decoded() {
            self.init(string)
            return
        }
        return nil
    }
}

// MARK: - Properties
public extension String {
    var JSONValue: Any? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        
        do {
            return try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
        } catch let error {
            #if DEBUG
                print("Magic Error: -- \(error)")
            #endif
            return nil
        }
    }
    
    var base64: String? {
        let data = self.data(using: .utf8)
        let base64String = data?.base64EncodedString()
        return base64String
    }
    
    var lenght: Int {
        return lengthOfBytes(using: .utf8)
    }
}

// MARK: - Methods
public extension String {
    
    /// String decoded from base64  (if applicable).
    func base64Decoded() -> String? {
        guard let decodedData = Data(base64Encoded: self) else {
            return nil
        }
        return String(data: decodedData, encoding: .utf8)
    }
    
    /// String encoded in base64 (if applicable).
    func base64Encoded() -> String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    func isValidEmail() -> Bool {
        let regular = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with: self)
    }
    
    func isValidIdentityCard() -> Bool {
        // TODO: 正则 少生日的匹配
        let regular = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regular)
        return predicate.evaluate(with: self)
    }
    
    func sexInfo() -> Bool {
        var sexNum = 0
        if lengthOfBytes(using: String.Encoding.utf8) == 15 {
            let range = Range(characters.index(startIndex, offsetBy: 14)..<characters.index(startIndex, offsetBy: 15))
            sexNum = Int(substring(with: range))!
        } else if lengthOfBytes(using: String.Encoding.utf8) == 18 {
            let range = Range(characters.index(startIndex, offsetBy: 16)..<characters.index(startIndex, offsetBy: 17))
            sexNum = Int(substring(with: range))!
        }
    
        return sexNum % 2 == 0 ? false : true
    }
    
    func uppercaseFirst() -> String {
        if lengthOfBytes(using: .utf8) <= 1 {
            return uppercased()
        }
        
        let firstChar = substring(to: characters.index(startIndex, offsetBy: 1)).uppercased()
        let otherChar = substring(from: characters.index(startIndex, offsetBy: 1)).lowercased()
        return firstChar + otherChar
    }
    
    /// Reversed string.
    func reversed() -> String {
        return String(characters.reversed())
    }
    
    func insert(_ string: String, to index: Int) -> String {
        return  String(characters.prefix(index)) + string + String(characters.suffix(characters.count-index))
    }
    
    func toDate(dateFormat: String = "yyyy-MM-dd hh-mm-ss") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self)
    }
    
    func toDouble() -> Double? {
       return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func toFloat() -> Float? {
        return Float(self)
    }
    
    func toUInt() -> UInt? {
       return NumberFormatter().number(from: self)?.uintValue
    }
    
    func toBool() -> Bool? {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    func trim() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func toURLEncoding() -> String? {
        return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
    
    mutating func URLEncoded() {
        self = addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    func toQRCodeImage(size: CGSize) -> UIImage {
        let filter = CIFilter(name: "CIQRCodeGenerator")
        let data = self.data(using: .utf8)
        
        filter?.setDefaults()
        filter?.setValue(data, forKey: "inputMessage")
        
        let qrcodeCIImage = filter?.outputImage
        
        let extent = qrcodeCIImage!.extent.integral
        let scale = min(size.width / extent.width, size.height / extent.height)
        
        let width = extent.width * scale
        let height = extent.height * scale
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let bitmapRef = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        let context = CIContext(options: nil)
        let bitmapImage = context.createCGImage(qrcodeCIImage!, from: extent)
        bitmapRef!.interpolationQuality = .none
        bitmapRef!.scaleBy(x: scale, y: scale)
        bitmapRef?.draw(bitmapImage!, in: extent)
        
        let scaledImage = bitmapRef!.makeImage()
        
        return UIImage(cgImage: scaledImage!)
    }
}

// MARK: - NSAttributedString extensions
public extension String {
    
    /// Bold string.
    public func bold() -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Underlined string
    public func underlined() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
    }
    
    /// Strikethrough string.
    public func strikethroughed() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSStrikethroughStyleAttributeName: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)])
    }
    
    /// Italic string.
    public func italice() -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
    }
    
    /// Add color to string.
    ///
    /// - Parameter color: text color.
    /// - Returns: a NSAttributedString versions of string colored with given color.
    public func colored(with color: UIColor) -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
    }
}

// MARK: - Subscript
public extension String {
    subscript(range: Range<Int>) -> String {
        get {
            let startIndex = characters.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = characters.index(self.startIndex, offsetBy: range.upperBound)
            return substring(with: Range<String.Index>(startIndex..<endIndex))
        }
        
        set {
            let startIndex = characters.index(self.startIndex, offsetBy: range.lowerBound)
            let endIndex = characters.index(self.startIndex, offsetBy: range.upperBound)
            replaceSubrange(Range<String.Index>(startIndex..<endIndex), with: newValue)
        }
    }
}
