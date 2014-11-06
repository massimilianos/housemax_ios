//
//  HMViewController.h
//  HouseMax
//
//  Created by Massimiliano on 30/10/14.
//  Copyright (c) 2014 Massimiliano. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnInvia;
@property (weak, nonatomic) IBOutlet UILabel *lblMessaggio;
@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@property (weak, nonatomic) IBOutlet UISwitch *swcInserimentoNome;
@property (weak, nonatomic) IBOutlet UIButton *btnRichiedi;
@property (weak, nonatomic) IBOutlet UILabel *lblValTemperatura;
@property (weak, nonatomic) IBOutlet UILabel *lblValUmidita;

- (IBAction)clickInvia:(id)sender;
- (IBAction)swcChangeInserimentoNome:(id)sender;
- (IBAction)clickRichiedi:(id)sender;

@end
