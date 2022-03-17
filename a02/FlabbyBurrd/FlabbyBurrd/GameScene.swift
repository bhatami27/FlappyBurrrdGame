//
//  GameScene.sks
//  FlabbyBurrd
//
//  Created by Bryan Hatami on 4/26/21.
//
//  Javier Jimenez jimenjav@iu.edu
//  Dylan Taylor dydtaylo@iu.edu
//  Zach Kilmer zkilmer@iu.edu
//  Bryan Hatami bhatami@iu.edu
//  iOS app name: "Flappy Burrd"
//  Submission Date: 4/27/21

// We used this website
// https://https://github.com/SaiBalaji22/Flappy-Bird-
// and
// https://www.youtube.com/watch?v=1H9EG15mycI
// as a reference for SpriteKit and Physics

import SpriteKit
import GameplayKit

var moveUp = CGVector(dx: 0, dy: 9)
var moveDown = CGVector(dx: 0, dy: -9)


struct PhysicsCategory {
    // We used this website
    // https://https://github.com/SaiBalaji22/Flappy-Bird-
    // as a reference for SpriteKit and Physics
    static let pipe: UInt32 = 3
    static let player: UInt32 = 1
    static let landFloor: UInt32 = 2
}


class GameScene: SKScene,SKPhysicsContactDelegate {
    
    var notDead = true
    var total = 0
   
    var tAtLasBird = SKTextureAtlas(named: "bird")
    var textFunction = [SKTexture]()
    var canScore: SKLabelNode!
    var resetGamePrompt: SKLabelNode!
    var player: SKSpriteNode!
    var lowerPipe: SKSpriteNode!
    var upperPipe: SKSpriteNode!
    
    var appDelegate : AppDelegate?
    var customizationModel : CustomizationModel?
    var highScoreTableModel : HighScoreTableModel?
    
    func didBegin(_ contact: SKPhysicsContact) {
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        if(bodyA.node?.name == "player" && bodyB.node?.name == "pipe" || bodyB.node?.name == "player" && bodyA.node?.name == "pipe"  )
        {
            
            notDead = false
            // We used this website
            //https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial#toc-anchor-003
            // as a reference for CoreData
            self.appDelegate = UIApplication.shared.delegate as? AppDelegate
            self.highScoreTableModel = appDelegate!.highScoreTableModel
            self.highScoreTableModel?.saveScore(total: Int16(total))
            
            player.removeFromParent()
        }
    }
    
    override func didMove(to view: SKView) {
        
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.customizationModel = appDelegate!.customizationModel

        let backgroundCheck2 = customizationModel!.getBGImage()
        physicsWorld.contactDelegate = self
        
      
        if(backgroundCheck2 == 0){
            let bgPhoto = SKSpriteNode(imageNamed: "background")
            bgPhoto.size = CGSize(width: frame.size.width, height: frame.size.height)
            bgPhoto.position = CGPoint(x: frame.midX, y: frame.midY)
            bgPhoto.zPosition = -1
            addChild(bgPhoto)
            
        }
        else{
            let bgPhoto = SKSpriteNode(imageNamed: "background2")
            bgPhoto.size = CGSize(width: frame.size.width, height: frame.size.height)
            bgPhoto.position = CGPoint(x: frame.midX, y: frame.midY)
            bgPhoto.zPosition = -1
            addChild(bgPhoto)
        }
       
        
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        let floorPhoto = SKSpriteNode(imageNamed: "floor")
        floorPhoto.size = CGSize(width: frame.size.width, height:199)
        floorPhoto.position = CGPoint(x: frame.midX, y: frame.midY - 499)
        floorPhoto.physicsBody = SKPhysicsBody(rectangleOf: floorPhoto.size)
        floorPhoto.physicsBody?.isDynamic = false
        floorPhoto.physicsBody?.categoryBitMask = PhysicsCategory.pipe
        floorPhoto.physicsBody?.contactTestBitMask = PhysicsCategory.player
        floorPhoto.name = "pipe"
        addChild(floorPhoto)
        
        
        canScore = SKLabelNode()
        canScore.fontName = "04b_19"
        canScore.fontSize = 55
        canScore.fontColor = UIColor.white
        canScore.position = CGPoint(x: frame.midX - 179, y: frame.midY + 499)
        addChild(canScore)
       
       
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        for i in 1..<tAtLasBird.textureNames.count
        {
            let burr = "bird-0\(i).png"
            print(burr)
            textFunction.append(SKTexture(imageNamed: burr))
        }
        
       
        PullPlayerToGame()
        Timer.scheduledTimer(timeInterval: 1.9, target: self, selector: #selector(PolesRand), userInfo: nil, repeats: true)
    }
    
    
    func CreateUpperPipe()
    {
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        lowerPipe = SKSpriteNode(imageNamed: "poleTop")
        lowerPipe.position = CGPoint(x: frame.midX + 299, y: frame.midY - 219)
        lowerPipe.size = CGSize(width: 78, height: Int.random(in: 320...449))
        lowerPipe.physicsBody = SKPhysicsBody(rectangleOf: lowerPipe.size)
        lowerPipe.physicsBody?.categoryBitMask = PhysicsCategory.pipe
        lowerPipe.physicsBody?.contactTestBitMask = PhysicsCategory.player
        lowerPipe.physicsBody?.isDynamic = false
        lowerPipe.name = "pipe"
        addChild(lowerPipe)
        let moveToLeft = SKAction.moveTo(x: -999, duration: 1.3)
        let wait = SKAction.wait(forDuration: 1.9)
        let destroy = SKAction.run {self.lowerPipe.removeFromParent()}
        lowerPipe.run(SKAction.sequence([moveToLeft,wait,destroy]))
    }
    
    func CreateLowerPipe()
    {
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        upperPipe = SKSpriteNode(imageNamed: "poleBottom")
        upperPipe.position = CGPoint(x: frame.midX + 399, y: frame.midY + 399)
        upperPipe.size = CGSize(width: 79, height: Int.random(in: 320...499))
        upperPipe.physicsBody = SKPhysicsBody(rectangleOf: upperPipe.size)
        upperPipe.physicsBody?.categoryBitMask = PhysicsCategory.pipe
        upperPipe.physicsBody?.contactTestBitMask = PhysicsCategory.player
        upperPipe.physicsBody?.isDynamic = false
        upperPipe.name = "pipe"
        addChild(upperPipe)
        let moveToLeft = SKAction.moveTo(x: -999, duration: 1.3)
        let wait = SKAction.wait(forDuration: 1.9)
        let destroy = SKAction.run {self.upperPipe.removeFromParent()}
        upperPipe.run(SKAction.sequence([moveToLeft,wait,destroy]))
    }
    
    func PullPlayerToGame()
    {
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        player = SKSpriteNode(imageNamed:"bird-1")
        player.size = CGSize(width: 79, height: 79)
        player.position = CGPoint(x: frame.midX - 199, y: frame.midY)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.pipe
        player.physicsBody?.isDynamic = true
        player.physicsBody?.affectedByGravity = true
        player.name = "player"
        addChild(player)
        player.run(SKAction.repeatForever(SKAction.animate(with: textFunction, timePerFrame: 0.1)))  
    }
    
    @objc
    func PolesRand(){
        // We used this website
        // https://https://github.com/SaiBalaji22/Flappy-Bird-
        // as a reference for SpriteKit and Physics
        if(notDead == true){
            let i = Int.random(in: 0...1)
            if(i==0){
                print(i)
                total = total + 1
                canScore.text = "Score: \(total)"
                self.CreateLowerPipe()
            }
            else if (i==1){
                print(i)
                total = total + 1
                canScore.text = "Score: \(total)"
                self.CreateUpperPipe()
            }
        }
        else{
            
            canScore.text = "Ya Burrd is Dead"
            canScore.fontSize = 70
            canScore.fontName = "04b_19"
            canScore.position = CGPoint(x: frame.midX, y: frame.midY + 200)
            resetGamePrompt = SKLabelNode()
            resetGamePrompt.numberOfLines = 2
            resetGamePrompt.text = "Press Game Button on Tab Bar to Reset Game"
            resetGamePrompt.fontSize = 30
            resetGamePrompt.fontName = "04b_19"
            resetGamePrompt.fontColor = UIColor.black
            resetGamePrompt.position = CGPoint(x: frame.midX, y: frame.midY - 350)
            addChild(resetGamePrompt)
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        physicsWorld.gravity = moveUp
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        physicsWorld.gravity = moveDown
    }
    
    
}

