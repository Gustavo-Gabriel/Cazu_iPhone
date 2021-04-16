//
//  ColorHex.swift
//  Cazu WatchKit Extension
//
//  Created by Gustavo Anjos on 24/03/21.
//

import UIKit

extension UIColor {

    @objc class func colorFromHex(_ hexString: String) -> UIColor {

        func cleanHexString(_ hexString: String) -> String {

            var cleanedHexString = String()

            if hexString[hexString.startIndex] == "#" {
                let index = hexString.index(hexString.startIndex, offsetBy: 1)
                cleanedHexString = String(hexString[index...])
            }

            return cleanedHexString
        }

        let cleanedHexString = cleanHexString(hexString)

        if let cachedColor = UIColor.getColorFromCache(cleanedHexString) {
            return cachedColor
        }

        let scanner = Scanner(string: cleanedHexString)

        var value: UInt32 = 0

        if scanner.scanHexInt32(&value) {

            let intValue = UInt32(value)
            let mask: UInt32 = 0xFF

            let red = intValue >> 16 & mask
            let green = intValue >> 8 & mask
            let blue = intValue & mask

            let colors: [UInt32] = [red, green, blue]
            let normalised = normaliseColors(colors)

            let newColor = UIColor(red: normalised[0], green: normalised[1], blue: normalised[2],
                                   alpha: 1)
            UIColor.storeColorInCache(cleanedHexString, color: newColor)

            return newColor

        }
        else {
            print("Error: Couldn't convert the hex string to a number, " +
                "returning UIColor.whiteColor() instead.")
            return UIColor.white
        }
    }

    fileprivate class func normaliseColors(_ colors: [UInt32]) -> [CGFloat] {
        var normalisedVersions = [CGFloat]()

        for color in colors {
            normalisedVersions.append(CGFloat(color % 256) / 255)
        }

        return normalisedVersions
    }

    fileprivate static var hexColorCache = [String : UIColor]()

    fileprivate class func getColorFromCache(_ hexString: String) -> UIColor? {
        guard let color = UIColor.hexColorCache[hexString] else {
            return nil
        }

        return color
    }

    fileprivate class func storeColorInCache(_ hexString: String, color: UIColor) {

        if UIColor.hexColorCache.keys.contains(hexString) {
            return
        }

        UIColor.hexColorCache[hexString] = color
    }

    fileprivate class func clearColorCache() {
        UIColor.hexColorCache.removeAll()
    }
}

