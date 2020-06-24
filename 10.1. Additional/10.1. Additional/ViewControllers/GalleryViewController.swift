//
//  GalleryViewController.swift
//  10.1. Additional
//
//  Created by Ruslan Murin on 23.06.2020.
//  Copyright © 2020 Ruslan Murin. All rights reserved.
//

import UIKit
struct Albums{
    var albumNames: String
}

class AlbumsContainer {
    static func albumsNames() -> [Albums]{
        return [Albums(albumNames: "cities"), Albums(albumNames: "cats"), Albums(albumNames: "meal")]
    }
}


class GalleryViewController: UIViewController {
    @IBOutlet weak var albumTableView: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
       let albums = AlbumsContainer.albumsNames()

}

extension GalleryViewController: UITableViewDelegate, UITableViewDataSource{
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell") as! AlbumTableViewCell
        return cell
    }
}


