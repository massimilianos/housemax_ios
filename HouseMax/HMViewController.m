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

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (IBAction)clickBtnUpdateTempHum:(id)sender {
    //    UIAlertView *alertBtnInvia = [[UIAlertView alloc] initWithTitle:@"Bottone INVIA" message:@"Hai premuto il tasto INVIA!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    //    [alertBtnInvia show];
    
    //  Aggiorno i valori di temperatura ed umidita'
    NSURL *urlUpdateTemperaturaUmidita = [NSURL URLWithString:@"http://massimilianos.ns0.it:82/tempRead/0/0"];
    [NSData dataWithContentsOfURL:urlUpdateTemperaturaUmidita];
    
    //  Leggo il valore della temperatura
    NSURLRequest *urlVisTemperatura=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://massimilianos.ns0.it/domusalberti/dati/ElaboraDati.php?operazione=select&valore=temperatura"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *responseVisTemperatura = nil;
    NSData *dataVisTemperatura = [NSURLConnection sendSynchronousRequest:urlVisTemperatura returningResponse:&responseVisTemperatura error:nil];
    NSString *resVisTemperatura = [[NSString alloc] initWithData:dataVisTemperatura encoding:NSUTF8StringEncoding];
    
    self.lblValTemperatura.text = [NSString stringWithFormat:@"%@°", resVisTemperatura];
    
    //  Leggo il valore dell'umidita'
    NSURLRequest *urlVisUmidita=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://massimilianos.ns0.it/domusalberti/dati/ElaboraDati.php?operazione=select&valore=umidita"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *responseVisUmidita = nil;
    NSData *dataVisUmidita = [NSURLConnection sendSynchronousRequest:urlVisUmidita returningResponse:&responseVisUmidita error:nil];
    NSString *resVisUmidita = [[NSString alloc] initWithData:dataVisUmidita encoding:NSUTF8StringEncoding];
    
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
        
        URL = @"http://massimilianos.ns0.it:82/manualControl/1/1";
    } else {
        self.lblRelay1.enabled = FALSE;
        self.lblRelay2.enabled = FALSE;
        self.lblRelay3.enabled = FALSE;
        self.lblRelay4.enabled = FALSE;
        
        self.swcRelay1.enabled = FALSE;
        self.swcRelay2.enabled = FALSE;
        self.swcRelay3.enabled = FALSE;
        self.swcRelay4.enabled = FALSE;
        
        URL = @"http://massimilianos.ns0.it:82/manualControl/0/0";
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (IBAction)changeSwcRelay1:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay1.on) {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/3/1";
    } else {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/3/0";
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
//    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (IBAction)changeSwcRelay2:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay2.on) {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/4/1";
    } else {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/4/0";
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
//    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (IBAction)changeSwcRelay3:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay3.on) {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/5/1";
    } else {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/5/0";
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
//    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
- (IBAction)changeSwcRelay4:(id)sender {
    NSString *URL = nil;
    
    if (self.swcRelay4.on) {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/6/1";
    } else {
        URL = @"http://massimilianos.ns0.it:82/digitalWrite/6/0";
    }
    
    NSURLRequest *url=[NSURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:url returningResponse:&response error:nil];
//    NSString *res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
