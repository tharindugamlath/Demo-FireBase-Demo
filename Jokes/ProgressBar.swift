//
//  ProgressBar.swift
//  Jokes
//
//  Created by Tharindu Gamlath on 6/1/16.
//  Copyright © 2016 Tharindu Gamlath. All rights reserved.
//


import UIKit

public final class ARSLineProgress {
    
    public static var shown: Bool { return ars_currentLoader != nil ? true : false }
    public static var statusShown: Bool { return ars_currentStatus != nil ? true : false }
    
    
    // MARK: Show Statuses
    
    
    /**
     Will interrupt the current .Infinite loader progress and show success animation instead.
     */
    public static func showSuccess() {
        if !statusShown { ARSStatus.show(.Success) }
    }
    
    /**
     Will interrupt the current .Infinite loader progress and show fail animation instead.
     */
    public static func showFail() {
        if !statusShown { ARSStatus.show(.Fail) }
    }
    
    
    // MARK: Show Infinite Loader
    
    
    public static func show() {
        if !shown { ARSInfiniteLoader().showOnView(nil, completionBlock: nil) }
    }
    
    public static func showWithPresentCompetionBlock(block: () -> Void) {
        if !shown { ARSInfiniteLoader().showOnView(nil, completionBlock: block) }
    }
    
    public static func showOnView(view: UIView) {
        if !shown { ARSInfiniteLoader().showOnView(view, completionBlock: nil) }
    }
    
    public static func showOnView(view: UIView, completionBlock: () -> Void) {
        if !shown { ARSInfiniteLoader().showOnView(view, completionBlock: completionBlock) }
    }
    
    
    // MARK: Show Progress Loader
    
    
    /**
     - note: initialValue should be from 0 to 100
     */
    public static func showWithProgress(initialValue value: CGFloat) {
        if !shown { ARSProgressLoader().showWithValue(value, onView: nil, progress: nil, completionBlock: nil) }
    }
    
    /**
     - note: initialValue should be from 0 to 100
     */
    public static func showWithProgress(initialValue value: CGFloat, onView: UIView) {
        if !shown { ARSProgressLoader().showWithValue(value, onView: onView, progress: nil, completionBlock: nil) }
    }
    
    /**
     - note: initialValue should be from 0 to 100
     */
    public static func showWithProgress(initialValue value: CGFloat, completionBlock: (() -> Void)?) {
        if !shown { ARSProgressLoader().showWithValue(value, onView: nil, progress: nil, completionBlock: completionBlock) }
    }
    
    /**
     - note: initialValue should be from 0 to 100
     */
    public static func showWithProgress(initialValue value: CGFloat, onView: UIView, completionBlock: (() -> Void)?) {
        if !shown { ARSProgressLoader().showWithValue(value, onView: onView, progress: nil, completionBlock: completionBlock) }
    }
    
    public static func showWithProgressObject(progress: NSProgress) {
        if !shown { ARSProgressLoader().showWithValue(0.0, onView: nil, progress: progress, completionBlock: nil) }
    }
    
    public static func showWithProgressObject(progress: NSProgress, completionBlock: (() -> Void)?) {
        if !shown { ARSProgressLoader().showWithValue(0.0, onView: nil, progress: progress, completionBlock: completionBlock) }
    }
    
    public static func showWithProgressObject(progress: NSProgress, onView: UIView) {
        if !shown { ARSProgressLoader().showWithValue(0.0, onView: onView, progress: progress, completionBlock: nil) }
    }
    
    public static func showWithProgressObject(progress: NSProgress, onView: UIView, completionBlock: (() -> Void)?) {
        if !shown { ARSProgressLoader().showWithValue(0.0, onView: onView, progress: progress, completionBlock: completionBlock) }
    }
    
    
    // MARK: Update Progress Loader
    
    
    public static func updateWithProgress(value: CGFloat) {
        ARSProgressLoader.weakSelf?.progressValue = value
    }
    
    public static func cancelPorgressWithFailAnimation(showFail: Bool) {
        ARSProgressLoader.weakSelf?.cancelWithFailAnimation(showFail, completionBlock: nil)
    }
    
    public static func cancelPorgressWithFailAnimation(showFail: Bool, completionBlock: (() -> Void)?) {
        ARSProgressLoader.weakSelf?.cancelWithFailAnimation(showFail, completionBlock: completionBlock)
    }
    
    
    // MARK: Hide Loader
    
    
    public static func hide() {
        ars_hideLoader(ars_currentLoader, withCompletionBlock: nil)
    }
    
    public static func hideWithCompletionBlock(block: () -> Void) {
        ars_hideLoader(ars_currentLoader, withCompletionBlock: block)
    }
    
}

public struct ARSLineProgressConfiguration {
    
    public static var showSuccessCheckmark = true
    
    public static var backgroundViewCornerRadius: CGFloat = 20.0
    public static var backgroundViewPresentAnimationDuration: CFTimeInterval = 0.3
    public static var backgroundViewDismissAnimationDuration: CFTimeInterval = 0.3
    
    public static var blurStyle: UIBlurEffectStyle = .Dark
    public static var circleColorOuter: CGColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    public static var circleColorMiddle: CGColor = UIColor.ars_colorWithRGB(82.0, green: 124.0, blue: 194.0, alpha: 1.0).CGColor
    public static var circleColorInner: CGColor = UIColor.ars_colorWithRGB(60.0, green: 132.0, blue: 196.0, alpha: 1.0).CGColor
    
    public static var circleRotationDurationOuter: CFTimeInterval = 3.0
    public static var circleRotationDurationMiddle: CFTimeInterval = 1.5
    public static var circleRotationDurationInner: CFTimeInterval = 0.75
    
    public static var checkmarkAnimationDrawDuration: CFTimeInterval = 0.4
    public static var checkmarkLineWidth: CGFloat = 2.0
    public static var checkmarkColor: CGColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    
    public static var successCircleAnimationDrawDuration: CFTimeInterval = 0.7
    public static var successCircleLineWidth: CGFloat = 2.0
    public static var successCircleColor: CGColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    
    public static var failCrossAnimationDrawDuration: CFTimeInterval = 0.4
    public static var failCrossLineWidth: CGFloat = 2.0
    public static var failCrossColor: CGColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    
    public static var failCircleAnimationDrawDuration: CFTimeInterval = 0.7
    public static var failCircleLineWidth: CGFloat = 2.0
    public static var failCircleColor: CGColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    
    /**
     Use this function to restore all properties to their default values.
     */
    public static func restoreDefaults() {
        ars_config.showSuccessCheckmark = true
        
        ars_config.backgroundViewCornerRadius = 20.0
        ars_config.backgroundViewPresentAnimationDuration = 0.3
        ars_config.backgroundViewDismissAnimationDuration = 0.3
        
        ars_config.blurStyle = .Dark
        ars_config.circleColorOuter = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
        ars_config.circleColorMiddle = UIColor.ars_colorWithRGB(82.0, green: 124.0, blue: 194.0, alpha: 1.0).CGColor
        ars_config.circleColorInner = UIColor.ars_colorWithRGB(60.0, green: 132.0, blue: 196.0, alpha: 1.0).CGColor
        
        ars_config.circleRotationDurationOuter = 3.0
        ars_config.circleRotationDurationMiddle = 1.5
        ars_config.circleRotationDurationInner = 0.75
        
        ars_config.checkmarkAnimationDrawDuration = 0.4
        ars_config.checkmarkLineWidth = 2.0
        ars_config.checkmarkColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
        
        ars_config.successCircleAnimationDrawDuration = 0.7
        ars_config.successCircleLineWidth = 2.0
        ars_config.successCircleColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
        
        ars_config.failCrossAnimationDrawDuration = 0.4
        ars_config.failCrossLineWidth = 2.0
        ars_config.failCrossColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
        
        ars_config.failCircleAnimationDrawDuration = 0.7
        ars_config.failCircleLineWidth = 2.0
        ars_config.failCircleColor = UIColor.ars_colorWithRGB(130.0, green: 149.0, blue: 173.0, alpha: 1.0).CGColor
    }
    
}




// =====================================================================================================================
// MARK: - Protocols, Typealiases & Enums
// =====================================================================================================================

private typealias ars_config = ARSLineProgressConfiguration

@objc private protocol ARSLoader {
    var backgroundView: UIVisualEffectView { get set }
    optional var outerCircle: CAShapeLayer { get set }
    optional var middleCircle: CAShapeLayer { get set }
    optional var innerCircle: CAShapeLayer { get set }
    optional weak var targetView: UIView? { get set }
}

private enum ARSLoaderType {
    case Infinite
    case Progress
}




// =====================================================================================================================
// MARK: - Shared Constants
// =====================================================================================================================

private let ARS_BACKGROUND_VIEW_SIDE_LENGTH: CGFloat = 125.0

private let ARS_CIRCLE_ROTATION_TO_VALUE = 2 * CGFloat(M_PI)
private let ARS_CIRCLE_ROTATION_REPEAT_COUNT = Float(UINT64_MAX)
private let ARS_CIRCLE_RADIUS_OUTER: CGFloat = 40.0
private let ARS_CIRCLE_RADIUS_MIDDLE: CGFloat = 30.0
private let ARS_CIRCLE_RADIUS_INNER: CGFloat = 20.0
private let ARS_CIRCLE_LINE_WIDTH: CGFloat = 2.0
private let ARS_CIRCLE_START_ANGLE: CGFloat = -CGFloat(M_PI_2)
private let ARS_CIRCLE_END_ANGLE: CGFloat = 0.0

private weak var ars_currentStatus: ARSLoader?
private var ars_currentLoader: ARSLoader?
private var ars_currentCompletionBlock: (() -> Void)?




// =====================================================================================================================
// MARK: - Infinite Loader
// =====================================================================================================================

private final class ARSInfiniteLoader: ARSLoader {
    
    @objc var backgroundView: UIVisualEffectView
    @objc var outerCircle = CAShapeLayer()
    @objc var middleCircle = CAShapeLayer()
    @objc var innerCircle = CAShapeLayer()
    @objc weak var targetView: UIView?
    
    init() {
        backgroundView = ARSBlurredBackgroundRect().view
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: "orientationChanged:",
                                                         name: UIDeviceOrientationDidChangeNotification,
                                                         object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: UIDeviceOrientationDidChangeNotification,
                                                            object: nil)
    }
    
    @objc func orientationChanged(notification: NSNotification) {
        if let loader = ars_currentLoader {
            if let targetView = loader.targetView {
                ars_createdFrameForBackgroundView(loader.backgroundView, onView: targetView)
            } else {
                ars_createdFrameForBackgroundView(loader.backgroundView, onView: nil)
            }
        }
    }
    
}

private extension ARSInfiniteLoader {
    
    func showOnView(view: UIView?, completionBlock: (() -> Void)?) {
        if ars_createdFrameForBackgroundView(backgroundView, onView: view) == false { return }
        
        targetView = view
        
        ars_createCircles(outerCircle: outerCircle,
                          middleCircle: middleCircle,
                          innerCircle: innerCircle,
                          onView: backgroundView.contentView,
                          loaderType: .Infinite)
        ars_animateCircles(outerCircle: outerCircle, middleCircle: middleCircle, innerCircle: innerCircle)
        ars_presentLoader(self, onView: view, completionBlock: completionBlock)
    }
    
}




// =====================================================================================================================
// MARK: - Progress Loader
// =====================================================================================================================

private final class ARSProgressLoader: ARSLoader {
    
    @objc var backgroundView: UIVisualEffectView
    @objc var outerCircle = CAShapeLayer()
    @objc var middleCircle = CAShapeLayer()
    @objc var innerCircle = CAShapeLayer()
    var multiplier: CGFloat = 1.0
    var lastMultiplierValue: CGFloat = 0.0
    var progressValue: CGFloat = 0.0
    var progress: NSProgress?
    var failed = false
    static weak var weakSelf: ARSProgressLoader?
    @objc weak var targetView: UIView?
    
    init() {
        backgroundView = ARSBlurredBackgroundRect().view
        ARSProgressLoader.weakSelf = self
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: "orientationChanged:",
                                                         name: UIDeviceOrientationDidChangeNotification,
                                                         object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: UIDeviceOrientationDidChangeNotification,
                                                            object: nil)
    }
    
    @objc func orientationChanged(notification: NSNotification) {
        if let loader = ars_currentLoader {
            if let targetView = loader.targetView {
                ars_createdFrameForBackgroundView(loader.backgroundView, onView: targetView)
            } else {
                ars_createdFrameForBackgroundView(loader.backgroundView, onView: nil)
            }
        }
    }
    
}

private extension ARSProgressLoader {
    
    // MARK: Show/Cancel
    
    func showWithValue(value: CGFloat, onView view: UIView?, progress: NSProgress?, completionBlock: (() -> Void)?) {
        if ars_createdFrameForBackgroundView(backgroundView, onView: view) == false { return }
        if let progress = progress { self.progress = progress }
        
        ars_currentCompletionBlock = completionBlock
        targetView = view
        
        ars_createCircles(outerCircle: outerCircle,
                          middleCircle: middleCircle,
                          innerCircle: innerCircle,
                          onView: backgroundView.contentView,
                          loaderType: .Progress)
        ars_animateCircles(outerCircle: outerCircle, middleCircle: middleCircle, innerCircle: innerCircle)
        ars_presentLoader(self, onView: view, completionBlock: nil)
        launchTimer()
    }
    
    func cancelWithFailAnimation(failAnim: Bool, completionBlock: (() -> Void)?) {
        if failAnim {
            ars_currentCompletionBlock = completionBlock
            failed = true
        } else {
            ars_hideLoader(ars_currentLoader, withCompletionBlock: completionBlock)
        }
    }
    
    // MARK: Configs & Animations
    
    func launchTimer() {
        ars_dispatchAfter(0.01) {
            guard let strongSelf = ARSProgressLoader.weakSelf else { return }
            
            strongSelf.incrementCircleRadius()
            strongSelf.launchTimer()
        }
    }
    
    func incrementCircleRadius() {
        if didIncrementMultiplier() == false { return }
        
        drawCirclePath()
        
        if failed && multiplier <= 0.0 {
            ARSProgressLoader.weakSelf = nil
            multiplier = 0.01
            drawCirclePath()
            failedLoading()
        } else if multiplier >= 100 {
            ARSProgressLoader.weakSelf = nil
            completed()
        }
    }
    
    func drawCirclePath() {
        let viewBounds = backgroundView.bounds
        let center = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds))
        let endAngle = CGFloat(M_PI) / 180 * 3.6 * multiplier
        let outerPath = UIBezierPath(arcCenter: center, radius: ARS_CIRCLE_RADIUS_OUTER, startAngle: 0, endAngle: endAngle, clockwise: true)
        let middlePath = UIBezierPath(arcCenter: center, radius: ARS_CIRCLE_RADIUS_MIDDLE, startAngle: 0, endAngle: endAngle, clockwise: true)
        let innerPath = UIBezierPath(arcCenter: center, radius: ARS_CIRCLE_RADIUS_INNER, startAngle: 0, endAngle: endAngle, clockwise: true)
        
        self.outerCircle.path = outerPath.CGPath
        self.middleCircle.path = middlePath.CGPath
        self.innerCircle.path = innerPath.CGPath
    }
    
    func didIncrementMultiplier() -> Bool {
        if failed {
            multiplier -= 1.5
            return true
        }
        
        let progress: CGFloat = progressSource()
        if lastMultiplierValue == progress { return false }
        
        if progress / multiplier > 2 {
            if multiplier < progress {
                multiplier += 0.75
            }
        } else {
            if multiplier < progress {
                multiplier += 0.25
            }
        }
        lastMultiplierValue = multiplier
        
        return true
    }
    
    func progressSource() -> CGFloat {
        if let progress = self.progress {
            return CGFloat(progress.fractionCompleted * 100.0)
        } else {
            return progressValue
        }
    }
    
    func completed() {
        let transform = CATransform3DMakeScale(0.01, 0.01, 1)
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.5)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(controlPoints: 0.70, -0.80, 0.68, 0.95))
        self.innerCircle.transform = transform
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.7)
        self.middleCircle.transform = transform
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.9)
        self.outerCircle.transform = transform
        CATransaction.commit()
        CATransaction.commit()
        CATransaction.commit()
        
        ars_dispatchAfter(0.9) {
            if ars_config.showSuccessCheckmark {
                ARSStatus.show(.Success)
                
                let dismissDelay = 0.5 + max(ars_config.successCircleAnimationDrawDuration, ars_config.checkmarkAnimationDrawDuration)
                
                ars_dispatchAfter(dismissDelay) {
                    ars_hideLoader(ars_currentLoader, withCompletionBlock: ars_currentCompletionBlock)
                }
            } else {
                ars_hideLoader(ars_currentLoader, withCompletionBlock: ars_currentCompletionBlock)
            }
        }
    }
    
    func failedLoading() {
        ARSStatus.show(.Fail)
        let dismissDelay = 0.5 + max(ars_config.failCircleAnimationDrawDuration, ars_config.failCrossAnimationDrawDuration)
        
        ars_dispatchAfter(dismissDelay) {
            ars_hideLoader(ars_currentLoader, withCompletionBlock: ars_currentCompletionBlock)
        }
    }
    
    func cleanup() {
        backgroundView.removeFromSuperview()
    }
    
}





// =====================================================================================================================
// MARK: - Success Status
// =====================================================================================================================

private enum ARSStatusType {
    case Success
    case Fail
}

private final class ARSStatus: ARSLoader {
    
    @objc var backgroundView: UIVisualEffectView
    
    init() {
        backgroundView = ARSBlurredBackgroundRect().view
        ars_createdFrameForBackgroundView(backgroundView, onView: nil)
    }
    
    static func show(type: ARSStatusType) {
        if let loader = ars_currentLoader {
            ars_stopCircleAnimations(loader, completionBlock: {
                drawStatus(type, loader: loader)
            })
        } else {
            let loader = ARSStatus()
            ars_presentLoader(loader, onView: nil, completionBlock: {
                drawStatus(type, loader: loader)
            })
        }
    }
    
    static func drawStatus(type: ARSStatusType, loader: ARSLoader) {
        ars_currentStatus = loader
        
        switch type {
        case .Success:
            ARSStatus.drawSuccess(loader.backgroundView)
        case .Fail:
            ARSStatus.drawFail(loader.backgroundView)
        }
        
        ars_dispatchAfter(1.25) {
            ars_hideLoader(loader, withCompletionBlock: nil)
        }
    }
    
}

private extension ARSStatus {
    
    static func drawSuccess(backgroundView: UIVisualEffectView) {
        let backgroundViewBounds = backgroundView.bounds
        let backgroundLayer = backgroundView.layer
        let outerCircleHeight = CGRectGetHeight(backgroundViewBounds)
        let outerCircleWidth = CGRectGetWidth(backgroundViewBounds)
        
        let checkmarkPath = UIBezierPath()
        checkmarkPath.moveToPoint(CGPointMake(outerCircleWidth * 0.28, outerCircleHeight * 0.53))
        checkmarkPath.addLineToPoint(CGPointMake(outerCircleWidth * 0.42, outerCircleHeight * 0.66))
        checkmarkPath.addLineToPoint(CGPointMake(outerCircleWidth * 0.72, outerCircleHeight * 0.36))
        checkmarkPath.lineCapStyle = .Square
        
        let checkmark = CAShapeLayer()
        checkmark.path = checkmarkPath.CGPath
        checkmark.fillColor = nil
        checkmark.strokeColor = ars_config.checkmarkColor
        checkmark.lineWidth = ars_config.checkmarkLineWidth
        backgroundLayer.addSublayer(checkmark)
        
        let successCircleArcCenter = CGPointMake(CGRectGetMidX(backgroundViewBounds), CGRectGetMidY(backgroundViewBounds))
        let successCircle = CAShapeLayer()
        successCircle.path = UIBezierPath(arcCenter: successCircleArcCenter,
                                          radius: ARS_CIRCLE_RADIUS_OUTER,
                                          startAngle: -CGFloat(M_PI_2),
                                          endAngle: CGFloat(M_PI) / 180 * 270,
                                          clockwise: true).CGPath
        successCircle.fillColor = nil
        successCircle.strokeColor = ars_config.successCircleColor
        successCircle.lineWidth = ars_config.successCircleLineWidth
        backgroundLayer.addSublayer(successCircle)
        
        let animationCheckmark = CABasicAnimation(keyPath: "strokeEnd")
        animationCheckmark.removedOnCompletion = true
        animationCheckmark.fromValue = 0
        animationCheckmark.toValue = 1
        animationCheckmark.fillMode = kCAFillModeBoth
        animationCheckmark.duration = ars_config.checkmarkAnimationDrawDuration
        animationCheckmark.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        checkmark.addAnimation(animationCheckmark, forKey: nil)
        
        let animationCircle = CABasicAnimation(keyPath: "strokeEnd")
        animationCircle.removedOnCompletion = true
        animationCircle.fromValue = 0
        animationCircle.toValue = 1
        animationCircle.fillMode = kCAFillModeBoth
        animationCircle.duration = ars_config.successCircleAnimationDrawDuration
        animationCircle.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        successCircle.addAnimation(animationCircle, forKey: nil)
    }
    
    static func drawFail(backgroundView: UIVisualEffectView) {
        let backgroundViewBounds = backgroundView.bounds
        let backgroundViewLayer = backgroundView.layer
        let outerCircleWidth = CGRectGetWidth(backgroundViewBounds)
        let outerCircleHeight = CGRectGetHeight(backgroundViewBounds)
        
        let crossPath = UIBezierPath()
        crossPath.moveToPoint(CGPointMake(outerCircleWidth * 0.67, outerCircleHeight * 0.32))
        crossPath.addLineToPoint(CGPointMake(outerCircleWidth * 0.32, outerCircleHeight * 0.67))
        crossPath.moveToPoint(CGPointMake(outerCircleWidth * 0.32, outerCircleHeight * 0.32))
        crossPath.addLineToPoint(CGPointMake(outerCircleWidth * 0.67, outerCircleHeight * 0.67))
        crossPath.lineCapStyle = .Square
        
        let cross = CAShapeLayer()
        cross.path = crossPath.CGPath
        cross.fillColor = nil
        cross.strokeColor = ars_config.failCrossColor
        cross.lineWidth = ars_config.failCrossLineWidth
        cross.frame = backgroundViewBounds
        backgroundViewLayer.addSublayer(cross)
        
        let failCircleArcCenter = CGPointMake(CGRectGetMidX(backgroundViewBounds), CGRectGetMidY(backgroundViewBounds))
        let failCircle = CAShapeLayer()
        failCircle.path = UIBezierPath(arcCenter: failCircleArcCenter,
                                       radius: ARS_CIRCLE_RADIUS_OUTER,
                                       startAngle: -CGFloat(M_PI_2),
                                       endAngle: CGFloat(M_PI) / 180 * 270,
                                       clockwise: true).CGPath
        failCircle.fillColor = nil
        failCircle.strokeColor = ars_config.failCircleColor
        failCircle.lineWidth = ars_config.failCircleLineWidth
        backgroundViewLayer.addSublayer(failCircle)
        
        let animationCross = CABasicAnimation(keyPath: "strokeEnd")
        animationCross.removedOnCompletion = false
        animationCross.fromValue = 0
        animationCross.toValue = 1
        animationCross.duration = ars_config.failCrossAnimationDrawDuration
        animationCross.fillMode = kCAFillModeBoth
        animationCross.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        cross.addAnimation(animationCross, forKey: nil)
        
        let animationCircle = CABasicAnimation(keyPath: "opacity")
        animationCircle.removedOnCompletion = true
        animationCircle.fromValue = 0
        animationCircle.toValue = 1
        animationCircle.fillMode = kCAFillModeBoth
        animationCircle.duration = ars_config.failCircleAnimationDrawDuration
        animationCircle.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        failCircle.addAnimation(animationCircle, forKey: nil)
    }
    
}





// =====================================================================================================================
// MARK: - Background Rect
// =====================================================================================================================

private struct ARSBlurredBackgroundRect {
    
    var view: UIVisualEffectView
    
    init() {
        let blur = UIBlurEffect(style: ars_config.blurStyle)
        let effectView = UIVisualEffectView(effect: blur)
        effectView.clipsToBounds = true
        
        view = effectView
    }
    
}




// =====================================================================================================================
// MARK: - Extensions & Helpers & Shared Methods
// =====================================================================================================================

private func ars_stopCircleAnimations(loader: ARSLoader, completionBlock: () -> Void) {
    
    CATransaction.begin()
    CATransaction.setAnimationDuration(0.25)
    CATransaction.setCompletionBlock(completionBlock)
    loader.outerCircle?.opacity = 0.0
    loader.middleCircle?.opacity = 0.0
    loader.innerCircle?.opacity = 0.0
    CATransaction.commit()
}

private func ars_presentLoader(loader: ARSLoader, onView view: UIView?, completionBlock: (() -> Void)?) {
    ars_currentLoader = loader
    let backgroundView = loader.backgroundView
    
    ars_dispatchOnMainQueue {
        if let targetView = view {
            targetView.addSubview(backgroundView)
        } else {
            ars_window()!.addSubview(backgroundView)
        }
        
        backgroundView.alpha = 0.1
        UIView.animateWithDuration(ars_config.backgroundViewPresentAnimationDuration, delay: 0.0, options: .CurveEaseOut, animations: {
            backgroundView.alpha = 1.0
            }, completion: { _ in completionBlock?() })
    }
}

private func ars_hideLoader(loader: ARSLoader?, withCompletionBlock block: (() -> Void)?) {
    guard let loader = loader else { return }
    
    let backgroundView = loader.backgroundView
    
    ars_dispatchOnMainQueue {
        UIView.animateWithDuration(ars_config.backgroundViewDismissAnimationDuration, delay: 0.0, options: .CurveEaseOut, animations: {
            backgroundView.alpha = 0.0
            backgroundView.transform = CGAffineTransformMakeScale(0.9, 0.9)
            }, completion: { _ in block?() })
    }
    
    ars_dispatchAfter(ars_config.backgroundViewDismissAnimationDuration) {
        ars_cleanupLoader(loader)
    }
}

private func ars_window() -> UIWindow? {
    var targetWindow: UIWindow?
    let windows = UIApplication.sharedApplication().windows
    for window in windows {
        if window.screen != UIScreen.mainScreen() { continue }
        if !window.hidden && window.alpha == 0 { continue }
        if window.windowLevel != UIWindowLevelNormal { continue }
        
        targetWindow = window
        break
    }
    
    return targetWindow
}

private func ars_createdFrameForBackgroundView(backgroundView: UIView, onView view: UIView?) -> Bool {
    let center: CGPoint
    
    if view == nil {
        guard let window = ars_window() else { return false }
        center = CGPointMake(CGRectGetMidX(window.screen.bounds), CGRectGetMidY(window.screen.bounds))
    } else {
        let viewBounds = view!.bounds
        center = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds))
    }
    
    let sideLengths = ARS_BACKGROUND_VIEW_SIDE_LENGTH
    backgroundView.frame = CGRectMake(center.x - sideLengths / 2, center.y - sideLengths / 2, sideLengths, sideLengths)
    backgroundView.layer.cornerRadius = ars_config.backgroundViewCornerRadius
    
    return true
}

private func ars_createCircles(outerCircle outerCircle: CAShapeLayer, middleCircle: CAShapeLayer, innerCircle: CAShapeLayer, onView view: UIView, loaderType: ARSLoaderType) {
    let circleRadiusOuter = ARS_CIRCLE_RADIUS_OUTER
    let circleRadiusMiddle = ARS_CIRCLE_RADIUS_MIDDLE
    let circleRadiusInner = ARS_CIRCLE_RADIUS_INNER
    let viewBounds = view.bounds
    let arcCenter = CGPointMake(CGRectGetMidX(viewBounds), CGRectGetMidY(viewBounds))
    var path: UIBezierPath
    
    switch loaderType {
    case .Infinite:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusOuter,
                            startAngle: ARS_CIRCLE_START_ANGLE,
                            endAngle: ARS_CIRCLE_END_ANGLE,
                            clockwise: true)
    case .Progress:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusOuter,
                            startAngle: 0, endAngle:
            CGFloat(M_PI) / 180 * 3.6 * 1,
                            clockwise: true)
    }
    ars_configureLayer(outerCircle, forView: view, withPath: path.CGPath, withBounds: viewBounds, withColor: ars_config.circleColorOuter)
    
    switch loaderType {
    case .Infinite:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusMiddle,
                            startAngle: ARS_CIRCLE_START_ANGLE,
                            endAngle: ARS_CIRCLE_END_ANGLE,
                            clockwise: true)
    case .Progress:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusMiddle,
                            startAngle: 0,
                            endAngle: CGFloat(M_PI) / 180 * 3.6 * 1,
                            clockwise: true)
    }
    ars_configureLayer(middleCircle, forView: view, withPath: path.CGPath, withBounds: viewBounds, withColor: ars_config.circleColorMiddle)
    
    switch loaderType {
    case .Infinite:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusInner,
                            startAngle: ARS_CIRCLE_START_ANGLE,
                            endAngle: ARS_CIRCLE_END_ANGLE,
                            clockwise: true)
    case .Progress:
        path = UIBezierPath(arcCenter: arcCenter,
                            radius: circleRadiusInner,
                            startAngle: 0,
                            endAngle: CGFloat(M_PI) / 180 * 3.6 * 1,
                            clockwise: true)
    }
    ars_configureLayer(innerCircle, forView: view, withPath: path.CGPath, withBounds: viewBounds, withColor: ars_config.circleColorInner)
}

private func ars_configureLayer(layer: CAShapeLayer, forView view: UIView, withPath path: CGPath, withBounds bounds: CGRect, withColor color: CGColor) {
    layer.path = path
    layer.frame = bounds
    layer.lineWidth = ARS_CIRCLE_LINE_WIDTH
    layer.strokeColor = color
    layer.fillColor = UIColor.clearColor().CGColor
    view.layer.addSublayer(layer)
}

private func ars_animateCircles(outerCircle outerCircle: CAShapeLayer, middleCircle: CAShapeLayer, innerCircle: CAShapeLayer) {
    ars_dispatchOnMainQueue {
        let outerAnimation = CABasicAnimation(keyPath: "transform.rotation")
        outerAnimation.toValue = ARS_CIRCLE_ROTATION_TO_VALUE
        outerAnimation.duration = ars_config.circleRotationDurationOuter
        outerAnimation.repeatCount = ARS_CIRCLE_ROTATION_REPEAT_COUNT
        outerCircle.addAnimation(outerAnimation, forKey: "outerCircleRotation")
        
        let middleAnimation = outerAnimation.copy() as! CABasicAnimation
        middleAnimation.duration = ars_config.circleRotationDurationMiddle
        middleCircle.addAnimation(middleAnimation, forKey: "middleCircleRotation")
        
        let innerAnimation = middleAnimation.copy() as! CABasicAnimation
        innerAnimation.duration = ars_config.circleRotationDurationInner
        innerCircle.addAnimation(innerAnimation, forKey: "middleCircleRotation")
    }
}

private func ars_cleanupLoader(loader: ARSLoader) {
    loader.backgroundView.removeFromSuperview()
    ars_currentLoader = nil
    ars_currentCompletionBlock = nil
}

private extension UIColor {
    
    static func ars_colorWithRGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha)
    }
    
}

private func ars_dispatchAfter(time: Double, block: dispatch_block_t) {
    let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
    dispatch_after(dispatchTime, dispatch_get_main_queue(), block)
}

private func ars_dispatchOnMainQueue(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue(), block)
}

