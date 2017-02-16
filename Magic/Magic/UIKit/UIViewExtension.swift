//
//  UIViewExtension.swift
//  Magic
//
//  Created by Broccoli on 16/9/12.
//  Copyright © 2016年 broccoliii. All rights reserved.
//

import Foundation

// MARK: - Initializers
public extension UIView {
    class func fromNib<T: UIView>(nibName: String? = nil) -> T? {
        let name: String = {
            guard let _ = nibName else {
                return nibName!
            }
            return String(describing: T.self)
        }()
        
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for subview in nibViews! {
            if let _ = subview as? T {
                return subview as? T
            }
        }
        return nil
    }
    
    class func fromNib<T: UIView>(view: T.Type) -> T? {
        let nibViews = Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)
        for subview in nibViews! {
            if let _ = subview as? T {
                return subview as? T
            }
        }
        return nil
    }
}

// MARK: - Properties
@IBDesignable
public extension UIView {
    
    /// Border color of view
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable
    /// Border width of view
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    /// Corner radius of view
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    /// Shadow color of view; also inspectable from Storyboard.
    public var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    /// Shadow offset of view; also inspectable from Storyboard.
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    /// Shadow opacity of view; also inspectable from Storyboard.
    public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    /// Shadow radius of view; also inspectable from Storyboard.
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    
    @IBInspectable
    var origin: CGPoint {
        get {
            return frame.origin
        }
        
        set {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
    }
    
    @IBInspectable
    var size: CGSize {
        get {
            return self.frame.size;
        }
        
        set {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
    }
}

// MARK: - Properties
public extension UIView {
    
    /// Take screenshot of view
    public var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0.0);
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    /// First responder.
    public var firstResponder: UIView? {
        guard !self.isFirstResponder else {
            return self
        }
        for subView in subviews {
            if subView.isFirstResponder {
                return subView
            }
        }
        return nil
    }
    
    /// Check if view is visible in screen currently and not hidden.
    public var isVisible: Bool {
        if self.window == nil || self.isHidden || self.alpha == 0 {
            return true
        }
        let viewRect = self.convert(self.bounds, to: nil)
        guard let window = UIApplication.shared.keyWindow else {
            return true
        }
        return viewRect.intersects(window.bounds) == false
    }
}

// MARK: - Properties
public extension UIView {
    
    var top: CGFloat {
        get {
            return frame.origin.y
        }
        
        set {
            var frame = self.frame
            frame.origin.y = top
            self.frame = frame
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        
        set {
            var frame = self.frame
            frame.origin.y = bottom - self.frame.size.height
            self.frame = frame
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        
        set {
            var frame = self.frame
            frame.origin.x = right - self.frame.size.width
            self.frame = frame
        }
    }
    
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        
        set {
            var frame = self.frame
            frame.origin.x = left
            self.frame = frame
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        
        set {
            var frame = self.frame;
            frame.size.width = width;
            self.frame = frame
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        
        set {
            var frame = self.frame;
            frame.size.height = height;
            self.frame = frame
        }
    }
}

// MARK: - Methods
public extension UIView {
    func contains(subView: UIView) -> Bool {
        for view in subviews {
            if view == subView {
                return true
            }
        }
        
        return false
    }
    
    // Add set of subviews to view
    func addSubviews(subviews: UIView...) {
        subviews.forEach {
            addSubview($0)
        }
    }
    
    /// Remove all subviews in view
    func removeSubViews() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    /// Remove subview whit tag
    func removeView(withTag tag: Int) {
        subviews.forEach {
            if $0.tag == tag {
                 $0.removeFromSuperview()
            }
        }
    }

    /// Remove all gesture recognizers from view
    func removeGestureRecognizers() {
        gestureRecognizers?.forEach(
            removeGestureRecognizer
        )
    }
}

fileprivate var kActivityIndicatorViewAssociativeKey = "kActivityIndicatorViewAssociativeKey"
public extension UIView {
    var activityIndicatorView: UIActivityIndicatorView {
        get {
            guard let activityIndicatorView = getAssociatedObject(&kActivityIndicatorViewAssociativeKey) as? UIActivityIndicatorView else {

                let activityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                activityIndicatorView.activityIndicatorViewStyle = .gray
                activityIndicatorView.color = .gray
                activityIndicatorView.center = center
                activityIndicatorView.frame.y = activityIndicatorView.frame.y - 40
                activityIndicatorView.hidesWhenStopped = true
                addSubview(activityIndicatorView)
                
                setAssociatedObject(activityIndicatorView, associativeKey: &kActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return activityIndicatorView
            }
            return activityIndicatorView
        }
        
        set {
            addSubview(newValue)
            setAssociatedObject(newValue, associativeKey:&kActivityIndicatorViewAssociativeKey, policy: .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setupActivityIndicator(style: UIActivityIndicatorViewStyle, color: UIColor) {
        activityIndicatorView.activityIndicatorViewStyle = style
        activityIndicatorView.color = color
    }
}


public extension UIView {
    enum ShakeDirection {
        case horizontal
        case vertical
    }
    
    func shake(_ times: Int = 10,
               currentTimes current: Int = 0,
               withDelta delta: CGFloat = 5,
               speed interval: TimeInterval = 0.03,
               shakeDirection: ShakeDirection = .horizontal,
               completion handler: (() -> Void)?) {
        
        UIView.animate(withDuration: interval, animations: {
            _ in
            self.transform = (shakeDirection == .horizontal) ?
                CGAffineTransform(translationX: delta, y: 0) :
                CGAffineTransform(translationX: 0, y: delta)
            }, completion: {
                (finished: Bool) in
                if current >= times {
                    UIView.animate(withDuration: interval, animations: {
                        _ in
                        self.transform = CGAffineTransform.identity
                        }, completion: {
                            (finished: Bool) in
                            if let handler = handler {
                                handler()
                            }
                    })
                    return
                }
                self.shake(times - 1,
                           currentTimes: current + 1,
                           withDelta: delta,
                           speed: interval,
                           shakeDirection: shakeDirection,
                           completion: handler)
        })
    }
}

// MARK: - Easy UIInterpolatingMotionEffect. 
// Learn more: http://hack.swic.name/easy-uiinterpolatingmotioneffect
extension UIView {
    func addNaturalOnTopEffect(maximumRelativeValue : Float = 20.0) {
        var motionEffect = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis);
        motionEffect.minimumRelativeValue = maximumRelativeValue;
        motionEffect.maximumRelativeValue = -maximumRelativeValue;
        addMotionEffect(motionEffect);
        
        motionEffect = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis);
        motionEffect.minimumRelativeValue = maximumRelativeValue;
        motionEffect.maximumRelativeValue = -maximumRelativeValue;
        addMotionEffect(motionEffect);
    }
    
    func addNaturalBelowEffect(maximumRelativeValue : Float = 20.0) {
        addNaturalOnTopEffect(maximumRelativeValue: -maximumRelativeValue)
    }
    
    func removeMotionEffects() {
        let motionEffects = self.motionEffects as [UIMotionEffect]
        for effect in motionEffects {
            self.removeMotionEffect(effect)
        }
    }
}

extension UIView {
    enum LineBorderDirection {
        case top
        case bottom
        case left
        case right
    }
    
    func addLineBorder(withLineColor lineColor: UIColor, direction: LineBorderDirection = .bottom) {
        let lineView = UIView()
        lineView.backgroundColor = lineColor
        self.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        if direction == .bottom {
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
        } else if direction == .top {
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
        } else if direction == .right {
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
        } else if direction == .left {
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0))
            self.addConstraint(NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 1))
        }
    }
}
