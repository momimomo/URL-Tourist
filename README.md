                                       .;'.'o0KXNNNNNNWWWWWWWWWNNNNXXX0c....                                   
                                      .'..,oOKKXNNNWWWWWWWWWWWWNNNNXXXKOl'..                                   
                                     ....'lk0KXXNNNWWWWWWWWWWWNNNNNXXXK0Ol...                                  
                                     ....;ldO0KXNNNWWWWWWWWWWWWWWWNNXK00ko;....                                
                .                    . ..;clxOKXXNNWWWWWWWWWWWWWWWNXXK0Odc;. ...              ....             
         ...........   .            .   .':cldOKXXNWWMMWWWWWWWWWWWNXKKOdc:,.  ..        ............           
       ...':llloddddoc::,..         .    .;codx0XXNNWWWWWMWWWWWWWNNXXKkdl:'    .      ...':oooddxxxolcc;..     
      .''lOXNNNWWWWWNNNX0o,.        .    .;cdxddk0KXXNNWWWWWWWWWNXXKOxdxdc'          .''cOXNNNWWWWWNNNXKd;.    
     ...l0KXNNWWWWWWWNNXXKd,.            .'...   ..,:cldOO00Okdlc:,..  ....         ...cOKXNNWWWWWWNNNNXKx,.   
     ..,lkKXNWWWWWWWWWNXK0x:..           ..            .;ldxo;.              .      ..'ok0XNWWWWWWWWWWNK0kc... 
       ':okKXNWMWWWWWWNXKkl,. .     ...  ...           'dOKNKd'             ...       .lxk0XNWWWWWWWWNXKko;. . 
       .;coOXNWWWWWWWWNX0xl,       .,'.. .;;'..       .oKKXNXKo.        .....,,.      .:dkOKNNWWWWWWWNX0ko,    
       .....,:ldk00Oxoc;'...       .::,. .':olc:;;;;,,cOXNWWNKkl;;,,,;:cc;...;,       .','.,:cox00Oxoc;'',.    
                'dkc.        .     .,lc'...';ldddddxxdokXNWWN0xoddooodol:'..cc.     .  .       .dOl.        .  
    ....'..    .lXNO,     ...'.     .,cc,...';coodxkxl;,:lool;,cdxdoooc;...;l;     .'..''.     cKN0:     ...'. 
    ,;..,clc:::cONWKdc:::c:..;.       .;;.....':odxkxd;.      'lxkxddl;...';'      ':..,llcc::ckNWXxc:::cc'.;. 
    .:;..':odxxc:dxlcddoo:'.;;         .,;....';odxk0Oxc'.. .:dO0Okxoc'....'.      .;:..;codxxl:odl:oxolc'.;;. 
     .''..':dxko.  .cxkdc'.''.         .c:....',lddxkkdo:;,,;cldxxxdl;...            ''.,:coxkd,  .cxkdc,..'.  
      .,...;odxdc'.:oxxo;...           .:;. ...':lc;;;;;;;::;;;;;;::;'..             .;..;:ldxdc'':oxdl:'..    
      .;. .';:clllllllc:'.             .cl'  ...',;coooolllllodddl;,'..              .:...,;:cccclccc:;'.      
      .;'  ..,c;,,,,:c;..               ;o;   ....';:,.........,:;'...               .:,  ..,::,,;,;:;..       
       ',.  ..';lddo:'..                .l:.    ....',:oxxxkkdc;'....                 ;:.  ..':oxxdc'..        
       .;...  ..',,,'.. .                ;l'..     .';codddxxdl:'.    .               .:...  .',;;,'.  ..      
       .:'......     ......              'o:.....   .............  ....               .:,......     ......     
      ..;;,'...........';:'.             ,ol,...''.................';:,..            ..;:;'...........';:,..   

# URL Tourist

## It's a Powershell script for checking a list of URLs for a regex pattern match.

### Info 

The script is in Powershell 5.1. 

Add file "links.txt" in the same location as the script with the regex pattern on the first line,
and the links to check on the following lines. Modify the script contents as needed to pass env variables etc.

It will try to spawn one job with one attempt to visit the url for each link.

Feel free to suggest any new points on the feature list that might be helpful in 0-dep URL regex search.

Feature list:
- [ ] Nice, animated progress bar that will support working with async jobs
- [ ] Headless, async HTML parsing with no browser, and not the SSR variant only
