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

- (IBAction)clickInvia:(id)sender {
    UIAlertView *alertBtnInvia = [[UIAlertView alloc] initWithTitle:@"Bottone INVIA" message:@"Hai premuto il tasto INVIA!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    [alertBtnInvia show];
    
    self.lblMessaggio.text = self.txtNome.text;
}

- (IBAction)swcChangeInserimentoNome:(id)sender {
    if (self.swcInserimentoNome.on) {
        self.txtNome.enabled = TRUE;
        self.btnInvia.enabled = TRUE;
    } else {
        self.txtNome.enabled = FALSE;
        self.btnInvia.enabled = FALSE;
    }
}

- (IBAction)clickRichiedi:(id)sender {
//  Aggiorno i valori di temperatura ed umidita'
    NSURL *urlUpdateTemperaturaUmidita = [NSURL URLWithString:@"http://massimilianos.ns0.it:82/tempRead/0/0"];
    [NSData dataWithContentsOfURL:urlUpdateTemperaturaUmidita];
    
//  Leggo il valore della temperatura
    NSURLRequest *urlVisTemperatura=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://massimilianos.ns0.it/domusalberti/dati/ElaboraDati.php?operazione=select&valore=temperatura"]
                                                  cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                  timeoutInterval:60.0];
    NSURLResponse *responseVisTemperatura = nil;
    NSData *dataVisTemperatura = [NSURLConnection sendSynchronousRequest:urlVisTemperatura returningResponse:&responseVisTemperatura error:nil];
    NSString *resVisTemperatura = [[NSString alloc] initWithData:dataVisTemperatura encoding:NSUTF8StringEncoding];

    self.lblValTemperatura.text = [NSString stringWithFormat:@"\"%@°\"", resVisTemperatura];

//  Leggo il valore dell'umidita'
    NSURLRequest *urlVisUmidita=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://massimilianos.ns0.it/domusalberti/dati/ElaboraDati.php?operazione=select&valore=umidita"]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                              timeoutInterval:60.0];
    NSURLResponse *responseVisUmidita = nil;
    NSData *dataVisUmidita = [NSURLConnection sendSynchronousRequest:urlVisUmidita returningResponse:&responseVisUmidita error:nil];
    NSString *resVisUmidita = [[NSString alloc] initWithData:dataVisUmidita encoding:NSUTF8StringEncoding];
    
    self.lblValUmidita.text = [NSString stringWithFormat:@"\"%@%%\"", resVisUmidita];
}

/*
 Questo metodo serve per far sparire la tastiera una volta finito
 usarla, altrimenti rimarrebbe sullo schermo
*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
