

import SpriteKit

enum StarColor: String {
    case yellow = "yellow", blue = "blue"
}

class CatchGameScene: SKScene, SKPhysicsContactDelegate {
    var scoreUpdateHandler: ((_ score: Int) -> Void)?
    var starColorUpdateHandler: ((_ color: StarColor) -> Void)?
    var timerUpdateHandler: ((_ timer: Int) -> Void)?
    
    var gameOver: ((_ mistakeDone: Bool) -> Void)?
    // MARK: - Properties
    private var targetColor: StarColor = .yellow
    private var score: Int = 0
    private var timer: Int = 30
    
    private let targetLabel = SKLabelNode(text: "Цель: Ловить жёлтые звёзды!")
    private let scoreLabel = SKLabelNode(text: "Счёт: 0")
    private let timerLabel = SKLabelNode(text: "Осталось времени: 30")
    
    private let basket = SKSpriteNode(imageNamed: "basket")
    
    private let starCategory: UInt32 = 0x1 << 0
    private let basketCategory: UInt32 = 0x1 << 1
    
    private var gameStarted = false
    private var mistakeDone = false

    
    // MARK: - Lifecycle
    override func didMove(to view: SKView) {
        backgroundColor = .clear
        physicsWorld.contactDelegate = self
        targetColor = Bool.random() ? .yellow : .blue
        starColorUpdateHandler?(targetColor)
        setupBasket()
        startTimer()
        spawnStars()
    }
    
    private func setupBasket() {
        
        basket.name = "basket"
        basket.position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 6)
        
        //        basket.size = CGSize(width: newWidth, height: newHeight)
        basket.size = CGSize(width: 65, height: 50)
        basket.physicsBody = SKPhysicsBody(rectangleOf: basket.size)
        basket.physicsBody?.isDynamic = false // Корзина не двигается физически
        basket.physicsBody?.categoryBitMask = basketCategory
        basket.physicsBody?.contactTestBitMask = starCategory
        basket.physicsBody?.collisionBitMask = 0 // Избегаем коллизий
        basket.physicsBody?.usesPreciseCollisionDetection = true
        addChild(basket)
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        for node in children {
            
            if ((node.name?.hasSuffix("Star")) != nil),
               node.position.y < 0 {
                node.removeFromParent()
            }
        }
    }
    
    // MARK: - Touch Handling
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            basket.position.x = location.x
        }
    }
    
    // MARK: - Game Logic
    private func startTimer() {
        let wait = SKAction.wait(forDuration: 1)
        let update = SKAction.run { [weak self] in
            self?.timer -= 1
            self?.timerUpdateHandler?(self?.timer ?? 0)
            if self?.timer == 0 {
                self?.endGame()
            }
        }
        let sequence = SKAction.sequence([wait, update])
        run(SKAction.repeatForever(sequence))
    }
    
    private func spawnStars() {
        let spawnAction = SKAction.run { [weak self] in
            self?.createStar()
        }
        let waitAction = SKAction.wait(forDuration: 0.7)
        let sequence = SKAction.sequence([spawnAction, waitAction])
        run(SKAction.repeatForever(sequence))
    }
    
    private func createStar() {
        let starColor = Bool.random() ? "yellow" : "blue"
        let star = SKSpriteNode(imageNamed: "\(starColor)Star")
        star.name = starColor
        star.size = CGSize(width: 45, height: 45)
        star.position = CGPoint(x: CGFloat.random(in: 50...frame.size.width - 50), y: frame.size.height - 50)
        star.physicsBody = SKPhysicsBody(rectangleOf: star.size)
        star.physicsBody?.isDynamic = true
        star.physicsBody?.affectedByGravity = false
        star.physicsBody?.categoryBitMask = starCategory
        star.physicsBody?.contactTestBitMask = basketCategory
        star.physicsBody?.collisionBitMask = 0
        star.physicsBody?.velocity = CGVector(dx: 0, dy: -200)
        star.physicsBody?.usesPreciseCollisionDetection = true
        addChild(star)
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        guard let star = (contact.bodyA.categoryBitMask == starCategory ? contact.bodyA.node : contact.bodyB.node) as? SKSpriteNode else { return }
        if (contact.bodyA.categoryBitMask == basketCategory && contact.bodyB.categoryBitMask == starCategory) ||
            (contact.bodyA.categoryBitMask == starCategory && contact.bodyB.categoryBitMask == basketCategory) {
            handleStarCollision(star)
        }
    }
    
    private func handleStarCollision(_ star: SKSpriteNode) {
        if star.name == targetColor.rawValue {
            score += 1
        } else {
            score = 0
            mistakeDone = true
        }
        scoreUpdateHandler?(score)
        star.removeFromParent()
    }
    
    private func endGame(won: Bool = true) {
        removeAllActions()
        removeAllChildren()
        
        gameOver?(mistakeDone)
    }
}
