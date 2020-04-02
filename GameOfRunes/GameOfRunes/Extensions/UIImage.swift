//
//  UIImage.swift
//  GameOfRunes
//
//  Created by Brian Yen on 2/4/20.
//  Copyright © 2020 TeamHoWan. All rights reserved.
//

import UIKit
import AVFoundation

extension UIImage {
    // TODO: Consider moving the default values into GameConfig instead
    // TODO: Look through this code and remove the force unwrapping if possible
    // TODO: May be able to combine resize/compression with the screenshot code if it leads to optimizations
    func resize(maxHeight: Float = 300.0,
                maxWidth: Float = 400.0,
                compressionQuality: Float = 0.5) -> UIImage {
        var actualHeight = Float(self.size.height)
        var actualWidth = Float(self.size.width)
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight

        //50 percent compression
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = img?.jpegData(compressionQuality: CGFloat(compressionQuality))
        UIGraphicsEndImageContext()
        return UIImage(data: imageData!) ?? UIImage()
    }

    func resizeHEIC(maxHeight: Float = 300.0,
                    maxWidth: Float = 400.0,
                    compressionQuality: Float = 0.5) throws -> UIImage {
        var actualHeight = Float(self.size.height)
        var actualWidth = Float(self.size.width)
        var imgRatio: Float = actualWidth / actualHeight
        let maxRatio: Float = maxWidth / maxHeight

        //50 percent compression
        if actualHeight > maxHeight || actualWidth > maxWidth {
            if imgRatio < maxRatio {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            }
            else if imgRatio > maxRatio {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            }
            else {
                actualHeight = maxHeight
                actualWidth = maxWidth
            }
        }
        let rect = CGRect(x: 0.0, y: 0.0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        // 1
        let data = NSMutableData()
        guard let imageDestination =
          CGImageDestinationCreateWithData(
            data, AVFileType.heic as CFString, 1, nil
          )
          else {
            throw HEICError.heicNotSupported
        }

        // 2
        guard let image = img,
            let cgImage = image.cgImage else {
          throw HEICError.cgImageMissing
        }

        // 3
        let options: NSDictionary = [
          kCGImageDestinationLossyCompressionQuality: compressionQuality
        ]

        // 4
        CGImageDestinationAddImage(imageDestination, cgImage, options)
        guard CGImageDestinationFinalize(imageDestination) else {
          throw HEICError.couldNotFinalize
        }

        let dataType = data as Data
        return UIImage(data: dataType) ?? UIImage()

    }

    //TODO: PNG OR JPEG?
    func saveImage(fileName: String) {
//        guard let data = self.jpegData(compressionQuality: 1) ?? self.pngData() else {
        guard let data = self.jpegData(compressionQuality: 1) else {
            print("Unable 1") // TODO: DEBUG
            return
        }

        guard let directory = try? FileManager.default.url(for: .documentDirectory,
                                                           in: .userDomainMask,
                                                           appropriateFor: nil,
                                                           create: false) as NSURL else {
            print("Unable 2") // TODO: DEBUG
            return
        }

        print("Directory is at: \(directory)")

        do {
            try data.write(to: directory.appendingPathComponent(fileName)!)
            return
        } catch {
            print(error.localizedDescription)
            return
        }
    }
}



enum HEICError: Error {
  case heicNotSupported
  case cgImageMissing
  case couldNotFinalize
  case cannotCoerceDataType
}
