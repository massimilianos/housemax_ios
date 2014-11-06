//
//  HMViewController.h
//  HouseMax
//
//  Created by Massimiliano on 30/10/14.
//  Copyright (c) 2014 Massimiliano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblHouseMax;

@property (weak, nonatomic) IBOutlet UILabel *lblValTemperatura;
@property (weak, nonatomic) IBOutlet UILabel *lblValUmidita;
@property (weak, nonatomic) IBOutlet UIButton *btnUpdateTempHum;

@property (weak, nonatomic) IBOutlet UILabel *lblManualEnabler;
@property (weak, nonatomic) IBOutlet UISwitch *swcManualEnabler;

@property (weak, nonatomic) IBOutlet UILabel *lblRelay1;
@property (weak, nonatomic) IBOutlet UILabel *lblRelay2;
@property (weak, nonatomic) IBOutlet UILabel *lblRelay3;
@property (weak, nonatomic) IBOutlet UILabel *lblRelay4;

@property (weak, nonatomic) IBOutlet UISwitch *swcRelay1;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay2;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay3;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay4;

- (IBAction)clickBtnUpdateTempHum:(id)sender;
- (IBAction)changeSwcManualEnabler:(id)sender;

@end
