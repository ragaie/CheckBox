//
//  CheckBox.swift
//  CheckBox
//
//  Created by Ragaie alfy on 11/16/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit

@IBDesignable open class CheckBox: UIView{
    
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    @IBOutlet weak var checkBoxLabel: UILabel!
    
    
    
    public var checked : Bool! = false
    private var checkedImage : UIImage!
    private var unCheckedImage : UIImage!
    
    
    
    
    
    
    
    public var ID : String!
    
    public var counterValue : Int! = 0
    
    
    public var delegate : CheckBoxDelegate!
 
    
    
    

    @IBInspectable public var checkBoxTitle: String = "" {
        didSet {
            
            checkBoxLabel.text = checkBoxTitle
            
        }
    }
  
    
    @IBInspectable public var fontColor: UIColor = UIColor.black {
        didSet {
            
            checkBoxLabel.textColor = fontColor
            
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 20.0{
        didSet {
            
            checkBoxLabel.font = UIFont.systemFont(ofSize: fontSize)
            
        }
    }
    

    @IBInspectable public var imageChecked : UIImage?  = UIImage.init(named: "check") {
        didSet {
            

            checkedImage = imageChecked
           // decrement.setBackgroundImage(imagedec, for: .normal)
        }
    }
    
    
    @IBInspectable public var imageUnChecked : UIImage?  = UIImage.init(named: "unCheck") {
        didSet {

            unCheckedImage = imageUnChecked
            
            checkBoxButton.setBackgroundImage(imageUnChecked, for: .normal)
        }
    }
    
    
    
    
    
    
    //MARK: Initializers
    override public init(frame : CGRect) {
        super.init(frame : frame)
        initSubviews()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
        initActionAndDelegete()
        
    }
    
    
    
    func initSubviews() {
        
        let bundle = Bundle(for: type(of: self))
        
        
        let nib = UINib(nibName: "CheckBox", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        
        addSubview(view)
        
     
        checkedImage = UIImage(named: "check" , in: bundle,compatibleWith: nil)!
        
        unCheckedImage = UIImage(named: "unCheck", in: bundle,compatibleWith: nil)!
        
        
    }
    
    func initActionAndDelegete()  {
        
        
        
        checkBoxButton.addTarget(self, action: #selector(CheckBox.ChangeStatus(_:)), for: .touchUpInside)
        
    }
    
    
    

  @objc func ChangeStatus(_ sender : UIButton){
    
    
    
    if self.checked == false {
        
        checkBoxButton.setBackgroundImage(checkedImage, for: .normal)
        self.checked = true
        
        if delegate != nil {
            
            delegate.CheckBox(self)
        }
    }else  if self.checked == true {
        
        checkBoxButton.setBackgroundImage(unCheckedImage, for: .normal)
        self.checked = false
        if delegate != nil {
            
            delegate.CheckBox(self)
        }
    }
    
        
    }
    
    
    

}
