//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by 何恺君 on 3/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var tweetcontents: UILabel!
    @IBOutlet weak var retweet: UIButton!
    
    @IBOutlet weak var favor: UIButton!
    
    var liked:Bool = false
    var tweetId: Int = -1

    
    
    func setlike (_ isLiked:Bool) {
        liked = isLiked
        if (liked) {
            favor.setImage(UIImage(named: "favor-icon-red"), for:UIControl.State.normal)
        }
        else {
            favor.setImage(UIImage(named: "favor-icon"), for:UIControl.State.normal)
        }
    }
    func setrepost (_ isreposted:Bool) {
        if (isreposted) {
            retweet.setImage(UIImage(named: "retweet-icon-green"), for:UIControl.State.normal)
        }
        else {
            retweet.setImage(UIImage(named: "retweet-icon"), for:UIControl.State.normal)
        }
    }
    
    @IBAction func like(_ sender: Any) {
        let tobeFavorited = !liked
        if (tobeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {self.setlike(true)}, failure: {(error) in
                print("favorite did not success:\(error)")
            })
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {self.setlike(false)}, failure: {(error) in
                print("unfavorite did not success:\(error)")
            })
        }
        
        
    }
    
    @IBAction func repost(_ sender: Any) {
        TwitterAPICaller.client?.Repost(tweetId: tweetId, success: {self.setrepost(true)}, failure: {(error) in
            print("retweet did not success:\(error)")
        })
        
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
