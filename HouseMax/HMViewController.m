//
//  HMViewController.m
//  HouseMax
//
//  Created by Massimiliano on 30/10/14.
//  Copyright (c) 2014 Massimiliano. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

NSString *arduinoAddress;
NSString *arduinoPort;

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    arduinoAddress = [[NSUserDefaults standardUserDefaults] stringForKey:@"txtSettingsAddress"];
    arduinoPort = [[NSUserDefaults standardUserDefaults] stringForKey:@"txtSettingsPort"];
    
    if (arduinoAddress == nil || arduinoPort == nil) {
        UIAlertView *alertBtnInvia = [[UIAlertView alloc] initWithTitle:@"Impostazioni Arduino" message:@"Una o più impostazioni non corrette!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertBtnInvia show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
    Questo metodo serve per far sparire la tastiera una volta finito
    usarla, altrimenti rimarrebbe sullo schermo
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (NSString *) inviaComando:(NSString *) URL {
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    return res;
}

- (IBAction)clickBtnUpdateTempHum:(id)sender {
    //  Leggo il valore della temperatura
    NSString *URLUpdateTemperatura = [NSString stringWithFormat:@"http://%@:%@/temperatureRead/0/0", arduinoAddress, arduinoPort];
    NSString *resVisTemperatura = [self inviaComando:URLUpdateTemperatura];
    
    self.lblValTemperatura.text = [NSString stringWithFormat:@"%@°", resVisTemperatura];
    
    //  Leggo il valore dell'umidita'
    NSString *URLUpdateUmidita = [NSString stringWithFormat:@"http://%@:%@/humidityRead/0/0", arduinoAddress, arduinoPort];
    NSString *resVisUmidita = [self inviaComando:URLUpdateUmidita];
    
    self.lblValUmidita.text = [NSString stringWithFormat:@"%@%%", resVisUmidita];
}

- (IBAction)changeSwcManualEnabler:(id)sender {
    NSString *URL = nil;
    
    if (self.swcManualEnabler.on) {
        self.lblRelay1.enabled = TRUE;
        self.lblRelay2.enabled = TRUE;
        self.lblRelay3.enabled = TRUE;
        self.lblRelay4.enabled = TRUE;
        
        self.swcRelay1.enabled = TRUE;
        self.swcRelay2.enabled = TRUE;
        self.swcRelay3.enabled = TRUE;
        self.swcRelay4.enabled = TRUE;
        
        URL = [NSString stringWithFormat:@"http://%@:%@/manualControlOnOff/1/1", arduinoAddress, arduinoPort];
    } else {
        self.lblRelay1.enabled = FALSE;
        self.lblRelay2.enabled = FALSE;
        self.lblRelay3.enabled = FALSE;
        self.lblRelay4.enabled = FALSE;
        
        self.swcRelay1.enabled = FALSE;
        self.swcRelay2.enabled = FALSE;
        self.swcRelay3.enabled = FALSE;
        self.swcRelay4.enabled = FALSE;
        
        URL = [NSString stringWithFormat:@"http://%@:%@/manualControlOnOff/0/0", arduinoAddress, arduinoPort];
    }
    
    NSString *result = [self inviaComando:URL];
    NSLog(@"%@", result);
}

- (IBAction)changeSwcRelay1:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay1.on) {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/3/1", arduinoAddress, arduinoPort];
    } else {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/3/0", arduinoAddress, arduinoPort];
    }
    
    NSString *result = [self inviaComando:URL];
    NSLog(@"%@", result);
}
- (IBAction)changeSwcRelay2:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay2.on) {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/4/1", arduinoAddress, arduinoPort];
    } else {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/4/0", arduinoAddress, arduinoPort];
    }
    
    NSString *result = [self inviaComando:URL];
    NSLog(@"%@", result);
}
- (IBAction)changeSwcRelay3:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay3.on) {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/5/1", arduinoAddress, arduinoPort];
    } else {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/5/0", arduinoAddress, arduinoPort];
    }
    
    NSString *result = [self inviaComando:URL];
    NSLog(@"%@", result);
}
- (IBAction)changeSwcRelay4:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay4.on) {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/6/1", arduinoAddress, arduinoPort];
    } else {
        URL = [NSString stringWithFormat:@"http://%@:%@/relayOnOff/6/0", arduinoAddress, arduinoPort];
    }
    
    NSString *result = [self inviaComando:URL];
    NSLog(@"%@", result);
}
@end
