//
//  imageProcessingUtil.swift
//  Mahir_Client
//
//  Created by Mohamed Hashem on 5/29/17.
//  Copyright © 2017 MAC. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class imageProcessingUtil
{
    static func GenerateThumbnail(videoURL:URL) -> UIImage?
    {
        // generating thumbnail
        do {
            let asset = AVURLAsset(url: videoURL, options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            return UIImage(cgImage: cgImage)
            // lay out this image view, or if it already exists, set its image property to uiImage
           } catch let error as NSError {
            print("Error generating thumbnail: \(error)")
        }
        return nil
    }
}

