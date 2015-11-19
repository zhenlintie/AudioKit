//
//  AKAUDecimatorWindow.swift
//  AudioKit
//
//  Autogenerated by scripts by Aurelius Prochazka. Do not edit directly.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

#if os(OSX)
    import Foundation
    import Cocoa

    /// A Window to control AKAUDecimator in Playgrounds
    public class AKAUDecimatorWindow: NSWindow {

        private let windowWidth = 400
        private let padding = 30
        private let sliderHeight = 20
        private let numberOfComponents = 3

        /// Slider to control decimation
        public let decimationSlider: NSSlider
        /// Slider to control rounding
        public let roundingSlider: NSSlider
        /// Slider to control finalMix
        public let finalMixSlider: NSSlider

        private let decimationTextField: NSTextField
        private let roundingTextField: NSTextField
        private let finalMixTextField: NSTextField

        private var decimator: AKAUDecimator

        /// Initiate the AKAUDecimator window
        public init(_ control: AKAUDecimator) {
            decimator = control
            let sliderWidth = windowWidth - 2 * padding

            decimationSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            roundingSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            finalMixSlider = NSSlider(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            decimationTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            roundingTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))
            finalMixTextField = NSTextField(frame: NSRect(x: padding, y: 0, width: sliderWidth, height: sliderHeight))

            let titleHeightApproximation = 50
            let windowHeight = padding * 2 + titleHeightApproximation + numberOfComponents * 3 * sliderHeight

            super.init(contentRect: NSRect(x: padding, y: padding, width: windowWidth, height: windowHeight),
                styleMask: NSTitledWindowMask,
                backing: .Buffered,
                `defer`: false)
            self.hasShadow = true
            self.styleMask = NSBorderlessWindowMask | NSResizableWindowMask
            self.movableByWindowBackground = true
            self.level = 7
            self.title = "AKAUDecimator"

            let viewRect = NSRect(x: 0, y: 0, width: windowWidth, height: windowHeight)
            let view = NSView(frame: viewRect)

            let topTitle = NSTextField()
            topTitle.stringValue = "AKAUDecimator"
            topTitle.editable = false
            topTitle.drawsBackground = false
            topTitle.bezeled = false
            topTitle.alignment = NSCenterTextAlignment
            topTitle.font = NSFont(name: "Lucida Grande", size: 24)
            topTitle.sizeToFit()
            topTitle.frame.origin.x = CGFloat(windowWidth / 2) - topTitle.frame.width / 2
            topTitle.frame.origin.y = CGFloat(windowHeight - padding) - topTitle.frame.height
            view.addSubview(topTitle)

            decimationTextField.stringValue = "Decimation: \(decimator.decimation) Percent"
            decimationTextField.editable = false
            decimationTextField.drawsBackground = false
            decimationTextField.bezeled = false
            decimationTextField.frame.origin.y = topTitle.frame.origin.y -  2 *  CGFloat(sliderHeight)
            view.addSubview(decimationTextField)

            decimationSlider.target = self
            decimationSlider.action = "updateDecimation"
            decimationSlider.minValue = 0
            decimationSlider.maxValue = 100
            decimationSlider.floatValue = decimator.decimation
            decimationSlider.frame.origin.y = topTitle.frame.origin.y - 3 * CGFloat(sliderHeight)
            view.addSubview(decimationSlider)
            roundingTextField.stringValue = "Rounding: \(decimator.rounding) Percent"
            roundingTextField.editable = false
            roundingTextField.drawsBackground = false
            roundingTextField.bezeled = false
            roundingTextField.frame.origin.y = topTitle.frame.origin.y -  5 *  CGFloat(sliderHeight)
            view.addSubview(roundingTextField)

            roundingSlider.target = self
            roundingSlider.action = "updateRounding"
            roundingSlider.minValue = 0
            roundingSlider.maxValue = 100
            roundingSlider.floatValue = Float(decimator.rounding)
            roundingSlider.frame.origin.y = topTitle.frame.origin.y - 6 * CGFloat(sliderHeight)
            view.addSubview(roundingSlider)
            finalMixTextField.stringValue = "Mix: \(decimator.mix) Percent"
            finalMixTextField.editable = false
            finalMixTextField.drawsBackground = false
            finalMixTextField.bezeled = false
            finalMixTextField.frame.origin.y = topTitle.frame.origin.y -  8 *  CGFloat(sliderHeight)
            view.addSubview(finalMixTextField)

            finalMixSlider.target = self
            finalMixSlider.action = "updateMix"
            finalMixSlider.minValue = 0
            finalMixSlider.maxValue = 100
            finalMixSlider.floatValue = Float(decimator.mix)
            finalMixSlider.frame.origin.y = topTitle.frame.origin.y - 9 * CGFloat(sliderHeight)
            view.addSubview(finalMixSlider)

            self.contentView!.addSubview(view)
            self.makeKeyAndOrderFront(nil)
        }

        private func updateDecimation() {
            decimator.decimation = decimationSlider.floatValue
            decimationTextField.stringValue = "Decimation \(String(format: "%0.4f", decimator.decimation)) "
        }
        private func updateRounding() {
            decimator.rounding = roundingSlider.floatValue
            roundingTextField.stringValue = "Rounding \(String(format: "%0.4f", decimator.rounding)) Percent"
        }
        private func updateMix() {
            decimator.mix = finalMixSlider.floatValue
            finalMixTextField.stringValue = "Final Mix \(String(format: "%0.4f", decimator.mix)) Percent"
        }

        /// Required initializer
        required public init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

#endif