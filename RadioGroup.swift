//
//  File.swift
//  CheckBox
//
//  Created by Ragaie alfy on 11/19/17.
//  Copyright © 2017 Ragaie alfy. All rights reserved.
//

import UIKit


@IBDesignable open class RadioGroup: UIView,UITableViewDelegate,UITableViewDataSource{

    
    
    
    
    
    @IBOutlet weak var radioGrouptableView: UITableView!
    
    public var delegate : RadioGroupDelegate!
    public var dataSource : [String]! = []
    public var selectIndex : Int! = 0
    
    private var selectImage : UIImage!
    private var unSelectImage : UIImage!
    
    
    private var allButton : [UIButton]! = []
    
    
    
    
    @IBInspectable public var fontColor: UIColor = UIColor.black {
        didSet {
            
            
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 20.0{
        didSet {
            
            
        }
    }
    
    
    @IBInspectable public var imageSelect : UIImage?  = UIImage.init(named: "select") {
        didSet {
            
            
            selectImage = imageSelect
            // decrement.setBackgroundImage(imagedec, for: .normal)
        }
    }
    
    
    @IBInspectable public var imageUnSelect : UIImage?  = UIImage.init(named: "unSelect") {
        didSet {
            
            unSelectImage = imageUnSelect
            
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
        
        
        let nib = UINib(nibName: "RadioGroup", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        // to make view fit view in design you welcome.
        view.frame = self.bounds
        
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // nib.contentView.frame = bounds
        
    
       
        
       // radioGroupcell.frame = CGRect.init(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: 30)
        addSubview(view)
        
     
        selectImage = UIImage(named: "select" , in: bundle,compatibleWith: nil)!
        
        unSelectImage = UIImage(named: "unSelect", in: bundle,compatibleWith: nil)!
        
        
    }
    
    func initActionAndDelegete()  {
        
        
        
        radioGrouptableView.delegate = self
        radioGrouptableView.dataSource = self
        let bundle = Bundle(for: type(of: self))

        radioGrouptableView.register(UINib(nibName: "RadioCell", bundle: nil), forCellReuseIdentifier: "radioCellID")
 
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataSource.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
      var cell = tableView.dequeueReusableCell(withIdentifier: "radioCellID", for: indexPath)

        
            var radioButton =   cell.viewWithTag(1) as! UIButton
            var radioText =   cell.viewWithTag(2) as! UILabel
        
        radioText.text = dataSource[indexPath.row]
             radioButton.addTarget(self, action: #selector(RadioGroup.ChangeStatus(_:)), for: .touchUpInside)
        radioButton.restorationIdentifier = String(indexPath.row)
        radioText.textColor = fontColor
        
        radioText.font = UIFont.systemFont(ofSize: fontSize)
        
        allButton.append(radioButton)
        
        
        if indexPath.row == 0 {
            radioButton.setBackgroundImage(selectImage, for: .normal)
            
            
        }
        return cell
        
        
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    
    
    
    
    @objc func ChangeStatus(_ sender : UIButton){
        reSelectButtons()
        sender.setBackgroundImage(selectImage, for: .normal)
        //print("clicked button")
        
        if delegate != nil{
            
            delegate.radioGroup(self, selectIndex: Int(sender.restorationIdentifier!)!)
            
            delegate.radioGroup(self, deSelectIndex: selectIndex)
        }
        
        selectIndex = Int(sender.restorationIdentifier!)!
    }
    
    
    func reSelectButtons(){
        
        for item in allButton{
            
            item.setBackgroundImage(unSelectImage, for: .normal)
        }
        
    }
    
}





