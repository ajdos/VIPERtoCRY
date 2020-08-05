//
//  UITextField+roundsCorner.swift
//  VIPERtoCRY
//
//  Created by Айдин Абдурахманов on 23.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

extension UITextField {
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.masksToBounds = true
        self.layer.mask = mask
    }
}


//class MyTextField: UITextField {
//
//    struct Corner {
//        var radius: CGFloat = 0
//        var rectCorner: UIRectCorner
//    }
//
//    var corners: [Corner]?
//    var borderColor = UIColor.lightGray
//    var borderWidth: CGFloat = 1
//
//    /// Используем для отрисовки - на случай
//    /// если массив `corners` инициализирован не всеми 4-мя углами
//    private lazy var cornersInternal: [Corner] = {
//        [customCorner(.topLeft),
//         customCorner(.topRight),
//         customCorner(.bottomRight),
//         customCorner(.bottomLeft)]
//    }()
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//
//    override func draw(_ rect: CGRect) {
//
//        if borderStyle != .none {
//            return
//        }
//
//        borderColor.setStroke()
//
//        let borderPath = UIBezierPath()
//        borderPath.lineWidth = borderWidth
//
//        var path = UIBezierPath()
//        let offset = borderPath.lineWidth / 2
//
//        for corner in cornersInternal {
//
//            if (corner.radius > frame.height / 2 || corner.radius > frame.width / 2) {
//                print("corner radius \(corner.radius) too big")
//            }
//
//            switch corner.rectCorner {
//
//            case .topLeft:
//                if corner.radius == 0 {
//                    path.move(to: CGPoint(x: offset, y: offset))
//                    path.addLine(to: CGPoint(x: frame.width - customCorner(.topRight).radius - offset, y: offset))
//                } else {
//                    path = UIBezierPath(arcCenter: CGPoint(x: corner.radius + offset, y: corner.radius + offset), radius: corner.radius, startAngle: CGFloat.pi, endAngle: CGFloat.pi * 3 / 2, clockwise: true)
//                    path.addLine(to: CGPoint(x: frame.width - customCorner(.topRight).radius - offset, y: offset))
//                }
//
//                borderPath.append(path)
//
//            case .topRight:
//                if corner.radius == 0 {
//                    path.move(to: CGPoint(x: frame.width - offset, y: offset))
//                    path.addLine(to: CGPoint(x: frame.width - offset, y: frame.height - customCorner(.bottomRight).radius - offset))
//                } else {
//                    path = UIBezierPath(arcCenter: CGPoint(x: frame.width - corner.radius - offset, y: corner.radius + offset), radius: corner.radius, startAngle: CGFloat.pi * 3 / 2, endAngle: 0, clockwise: true)
//                    path.addLine(to: CGPoint(x: frame.width - offset, y: frame.height - customCorner(.bottomRight).radius - offset))
//                }
//
//                borderPath.append(path)
//
//            case .bottomRight:
//                if corner.radius == 0 {
//                    path.move(to: CGPoint(x: frame.width - offset, y: frame.height - offset))
//                    path.addLine(to: CGPoint(x: offset + customCorner(.bottomLeft).radius, y: frame.height - offset))
//                } else {
//                    path = UIBezierPath(arcCenter: CGPoint(x: frame.width - corner.radius - offset, y: frame.height - corner.radius - offset), radius: corner.radius, startAngle: 0, endAngle: CGFloat.pi / 2, clockwise: true)
//                    path.addLine(to: CGPoint(x: customCorner(.bottomLeft).radius + offset, y: frame.height - offset))
//                }
//
//                borderPath.append(path)
//
//            case .bottomLeft:
//                if corner.radius == 0 {
//                    path.move(to: CGPoint(x: offset, y: frame.height - offset))
//                    path.addLine(to: CGPoint(x: offset, y: offset + customCorner(.topLeft).radius))
//                } else {
//                    path = UIBezierPath(arcCenter: CGPoint(x: corner.radius + offset, y: frame.height - corner.radius - offset), radius: corner.radius, startAngle: CGFloat.pi / 2, endAngle: CGFloat.pi, clockwise: true)
//                    path.addLine(to: CGPoint(x: offset, y: customCorner(.topLeft).radius + offset))
//                }
//
//                borderPath.append(path)
//
//            default:
//                break
//            }
//        }
//
//        borderPath.stroke()
//
//    }
//
//    // Увеличиваем размер поля если borderStyle = .none
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        corners != nil
//            ? bounds.insetBy(dx: 8, dy: 8)
//            : super.textRect(forBounds: bounds)
//    }
//
//    override func editingRect(forBounds bounds: CGRect) -> CGRect {
//        corners != nil
//            ? textRect(forBounds: bounds)
//            : super.editingRect(forBounds: bounds)
//    }
//
//    private func setup() {
//        // делаем границу невидимой, так как в противном случае
//        // кастомная граница скрывается под встроенной
//        borderStyle = .none
//    }
//
//    private func customCorner(_ corner: UIRectCorner) -> Corner {
//        let result = corners?.filter{$0.rectCorner == corner}.first
//        return (result != nil) ? result! : Corner(rectCorner: corner)
//    }
//
//}
