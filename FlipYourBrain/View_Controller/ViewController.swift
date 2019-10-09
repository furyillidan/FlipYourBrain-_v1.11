//
//  ViewController.swift
//  Memory Game
//
//  Created by Neo on 2018/1/12.
//  Copyright © 2018年 inow. All rights reserved.
//

import UIKit
import GoogleMobileAds

//用code生成view 然後將生成的座標取亂數 將view亂數排列

class ViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var tryAgain: UIButton!
    
    @IBOutlet weak var gameView: UIView!
    
    @IBOutlet weak var gameViewBg: UIImageView!
    
    let animalsPic = [UIImage(named: "animal4"),UIImage(named: "animal3"),UIImage(named: "animal2"),UIImage(named: "animal1")]
    
    let lifePic = [UIImage(named: "life1"),UIImage(named: "life2"),UIImage(named: "life3"),UIImage(named: "life4")]
    
    let trafficPic = [UIImage(named: "traffic1"),UIImage(named: "traffic2"),UIImage(named: "traffic3"),UIImage(named: "traffic4")]
    
    let travelPic = [UIImage(named: "travel1"),UIImage(named: "travel2"),UIImage(named: "travel3"),UIImage(named: "travel4")]
    
    var titleWidth: CGFloat!
    var titleHeight : CGFloat!
    //存放view
    var tilesArr : NSMutableArray = []
    //存放座標
    var centerArr : NSMutableArray = []
    //比較狀態
    var compareState : Bool = false
    var firstTile : MyLabel!
    var secondTile : MyLabel!
    var temArrayEn = [String]()
    var temArrayCn = [String]()

    let _userDefaluts = UserDefaults.standard
    
    var useWordRandom = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]

    var flipDelayTime:Double = 0.45
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.delegate = self
        bannerView.adUnitID = AD_UUID
        bannerView.rootViewController = self
        let request = GADRequest()
        bannerView.load(request)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        checkWhichTypeArray()
        takeRandomWord()
        resetGame(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.resetGame(self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let myTouch:UITouch = touches.first!
        
        //判斷那張牌被翻到
        if (tilesArr.contains(myTouch.view as Any)) {
            let thisTiles: MyLabel = myTouch.view as! MyLabel
            UIView.transition(with: thisTiles,
                              duration: 0.55,
                              options: UIViewAnimationOptions.transitionFlipFromRight,
                              //翻牌後的狀態
                              animations: {

                                thisTiles.text = thisTiles.wordString
                                thisTiles.backgroundColor = UIColor(red: 1 ,green: 0.9, blue: 0.9, alpha: 1)
                                thisTiles.isUserInteractionEnabled = false

            },
                              completion: { (true) in
                                if (self.compareState) {
                                    self.compareState = false
                                    self.secondTile = thisTiles
                                    self.compareAction()
                                   
                                }else{
                                    self.firstTile = thisTiles
                                    self.compareState = true
                                }
            })
        }
    }
    
    
//match後翻到背面顯示
    func flipMatchThenBack (anyInp: Array<Any>) {
        
        for anyObj in anyInp {
            let thisTile = anyObj as! MyLabel
            
            UIView.transition(with: thisTile,
                              duration: flipDelayTime,
                              options: UIViewAnimationOptions.transitionFlipFromRight,
                              animations: {
                                
                                thisTile.alpha = 0
                                thisTile.isUserInteractionEnabled = false
            },
                              completion: nil)
            
        }
        
        
    }
    
    
    //判斷match
    func compareAction() {

        if (firstTile.tagNumber == secondTile.tagNumber) {
            //將要比較的兩個 參數帶入 判斷match的func
             self.flipMatchThenBack(anyInp: [firstTile,secondTile])
            
        }else{
            //牌背面狀態
            UIView.transition(with: self.view,
                              duration: flipDelayTime,
                              options: UIViewAnimationOptions.transitionCrossDissolve,
                              animations: {
                                self.firstTile.text = "?"
                                self.secondTile.text = "?"
                                self.firstTile.backgroundColor = UIColor(red: 0.8, green: 0.7, blue: 0.9, alpha: 1)
                                self.secondTile.backgroundColor = UIColor(red:0.8, green: 0.7, blue: 0.9, alpha: 1)
                            
                                self.secondTile.isUserInteractionEnabled = true
                                self.firstTile.isUserInteractionEnabled = true
                            
            },
                              completion: nil)
        }
    }
    
    //取亂數值佈局view
    func randomizeAction () {
        
        for tile in tilesArr {
            let randIndex:Int = Int(arc4random()) % centerArr.count
            let randCen: CGPoint = centerArr[randIndex] as! CGPoint
            
            (tile as! MyLabel).center = randCen
            centerArr.removeObject(at: randIndex)
            
        }
    }
    
    
    //datamodel中的資料會被清光 因為為了不重複有執行remove
    func takeRandomWord(){
 
//        print(primarySchoolEn.count)
        for index in 0...8 {
            
//        let random = Int(arc4random_uniform(UInt32(primarySchoolEn.count)))
            let random = notRepeatingRandom(0, temArrayEn.count - 1, 9)
        useWordRandom.remove(at: index)
        useWordRandom.remove(at: index + 9)
        useWordRandom.insert(temArrayEn[random[index]], at: index)
        useWordRandom.insert(temArrayCn[random[index]], at: index + 9)
//            primarySchoolEn.remove(at: random[index])
//            primarySchoolCh.remove(at: random[index])
        }
//        useWordRandom.remove(at: 18)
//        useWordRandom.remove(at: 18)
//        temArrayEn.removeAll()
//        temArrayCn.removeAll()
    }
    
    
    func notRepeatingRandom (_ from:Int, _ to:Int, _ qut:Int?) -> [Int]
    {
        var myRandomNumbers = [Int]() //All our generated numbers
        var numberOfNumbers = qut //How many numbers to generate
        
        let lower = UInt32(from) //Generate from this number..
        let higher = UInt32(to+1) //To this one
        
        if numberOfNumbers == nil || numberOfNumbers! > (to-from) + 1
        {
            numberOfNumbers = (to-from) + 1
        }
        
        while myRandomNumbers.count != numberOfNumbers
        {
            let myNumber = arc4random_uniform(higher - lower) + lower
            
            if !myRandomNumbers.contains(Int(myNumber))
            {
                myRandomNumbers.append(Int(myNumber))
            }
        }
        
        return myRandomNumbers
    }
    
    
    func checkWhichTypeArray () {
        let type = _userDefaluts.object(forKey: "Type") as! String
        let number = Int(arc4random()) % travelPic.count
        switch type {
        case "travel":
            temArrayEn = travelEn
            temArrayCn = travelCh
            gameViewBg.image = travelPic[number]
            _userDefaluts.removeObject(forKey: "Type")
        
        case "life" :
            temArrayEn = lifeEn
            temArrayCn = lifeCh
            gameViewBg.image = lifePic[number]
            _userDefaluts.removeObject(forKey: "Type")
            
        case "traffic" :
            temArrayEn = trafficEn
            temArrayCn = trafficCh
            gameViewBg.image = trafficPic[number]
            _userDefaluts.removeObject(forKey: "Type")
        case "animal" :
            temArrayEn = animalEn
            temArrayCn = animalCn
            gameViewBg.image = animalsPic[number]
            _userDefaluts.removeObject(forKey: "Type")
        default:
            return
        }
    }
    
    
    //setting layout
    func blockMakerAction () {

        
        titleWidth = gameView.frame.size.width / 3
        titleHeight = gameView.frame.size.height / 6
        var xCen:CGFloat = titleWidth / 2
        var yCen:CGFloat = titleHeight / 2
        
        let tileFrame: CGRect = CGRect(x: 0, y: 0, width: titleWidth - 5, height: titleHeight - 5)
       
        
        var counter:Int = 0
        var markCounter:Int = 0
        var nextCounter:Int = 0
        
        //設置直排數量
        for _ in 0...5 {
            //設置橫排數量
            for _ in 0...2  {
            let tile:MyLabel = MyLabel(frame: tileFrame)
            let backPicView:UIImageView = UIImageView(frame: tileFrame)
                
            // counter大於10 時 會回歸 1
            if  markCounter > 8 {

                tile.wordString = useWordRandom[markCounter]
                tile.tagNumber = nextCounter
                nextCounter += 1
             
            }else{
               
                tile.text = String(counter)
                tile.wordString = useWordRandom[counter]
                tile.tagNumber = counter
                
                }
    
            tile.layer.cornerRadius = 40
            tile.textAlignment = NSTextAlignment.center
            tile.font = UIFont.boldSystemFont(ofSize: 17)
            
            let cen: CGPoint = CGPoint(x: xCen , y:yCen)
            
                tile.isUserInteractionEnabled = true
                
        tile.center = cen
        tile.backgroundColor = UIColor(red: 0.8, green: 0.7, blue: 0.9, alpha: 1)
        tile.lineBreakMode = .byWordWrapping
        tile.numberOfLines = 0
        
       
        gameView.addSubview(tile)
        tile.addSubview(backPicView)
        
                
            tilesArr.add(tile)
            centerArr.add(cen)
            
            xCen = xCen + titleWidth
            counter += 1
            markCounter += 1

        }
            xCen = titleWidth / 2
            yCen = yCen + titleHeight
            
        }
        
        dump(tilesArr)
        dump(centerArr)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetGame(_ sender: Any) {
        for anyView in gameView.subviews {
            anyView.removeFromSuperview()
        }
        
        tilesArr = []
        centerArr = []
        
        compareState = false
        
        takeRandomWord()
        //先佈局
        blockMakerAction()
        //在排亂數
        randomizeAction()
        
        for anyTile in tilesArr {
            (anyTile as! MyLabel).text = "?"
        }
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return  true
    }
    
    
}



//幫lable新增一個 tagNumber的屬性
class MyLabel: UILabel {
    var tagNumber: Int!
    var wordString: String!
//    var mark : Int!
//    var nextCounet : Int!
}
//
//class MyPicView: UIImageView {
//    var tagNumber: Int!
//    var mark: Int!
//}

