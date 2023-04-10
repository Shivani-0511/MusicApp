//
//  ViewController.swift
//  MyMusic
//
//  Created by Apple on 10/04/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var myTable: UITableView!
    var songs = [Song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        myTable.delegate = self
        myTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    func configureSongs(){
        songs.append(Song(name: "Happy Sunday",
                          albumName: "FavOne",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Happy Evening",
                          albumName: "CloseToEarth",
                          artistName: "Rando",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Happy Sunday",
                          albumName: "Family",
                          artistName: "Charli",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Happy Sunday",
                          albumName: "FavOne",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Happy Evening",
                          albumName: "CloseToEarth",
                          artistName: "Rando",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Happy Sunday",
                          albumName: "Family",
                          artistName: "Charli",
                          imageName: "cover1",
                          trackName: "song1"))
        songs.append(Song(name: "Happy Sunday",
                          albumName: "FavOne",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "Happy Evening",
                          albumName: "CloseToEarth",
                          artistName: "Rando",
                          imageName: "cover2",
                          trackName: "song2"))
        songs.append(Song(name: "Happy Sunday",
                          albumName: "Family",
                          artistName: "Charli",
                          imageName: "cover1",
                          trackName: "song1"))
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helventica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helventica", size: 17)
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //present the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else{
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc,animated: true)
        
    }

}
struct Song{
    let name:String
    let albumName:String
    let artistName:String
    let imageName:String
    let trackName:String
}

