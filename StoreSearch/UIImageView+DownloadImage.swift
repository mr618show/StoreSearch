//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by Rui Mao on 1/30/18.
//  Copyright © 2018 Rui Mao. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        let downloadTask = session.downloadTask(with: url, completionHandler: { [weak self] url, response, error in
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let strongSelf = self {
                        strongSelf.image = image
                    }
                }
            }
            
        })
        downloadTask.resume()
        return downloadTask
    }
}
