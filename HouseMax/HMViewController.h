//
//  HMViewController.h
//  HouseMax
//
//  Created by Massimiliano on 30/10/14.
//  Copyright (c) 2014 Massimiliano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMViewController : UIViewController

// Intestazione Programma
@property (weak, nonatomic) IBOutlet UILabel *lblHouseMax;

// Temperatura ed Umidita'
@property (weak, nonatomic) IBOutlet UILabel *lblValTemperatura;
@property (weak, nonatomic) IBOutlet UILabel *lblValUmidita;
@property (weak, nonatomic) IBOutlet UIButton *btnUpdateTempHum;
- (IBAction)clickBtnUpdateTempHum:(id)sender;

// Abilitazione Manuale
@property (weak, nonatomic) IBOutlet UILabel *lblManualEnabler;
@property (weak, nonatomic) IBOutlet UISwitch *swcManualEnabler;
- (IBAction)changeSwcManualEnabler:(id)sender;

// Controllo Relays
@property (weak, nonatomic) IBOutlet UILabel *lblRelay1;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay1;
- (IBAction)changeSwcRelay1:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblRelay2;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay2;
- (IBAction)changeSwcRelay2:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblRelay3;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay3;
- (IBAction)changeSwcRelay3:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *lblRelay4;
@property (weak, nonatomic) IBOutlet UISwitch *swcRelay4;
- (IBAction)changeSwcRelay4:(id)sender;

@end
