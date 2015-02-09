data water;                            /* Chapter 2 */
*    infile 'n:\handbook\datasets\water.dat';
    input flag $ 1 Town $ 2-18 Mortal 19-22 Hardness 25-27;
    if flag='*' then location='north';
        else location='south';
*run;
cards;
 Bath             1247  105        
*Birkenhead       1668  17         
 Birmingham       1466  5          
*Blackburn        1800  14         
*Blackpool        1609  18         
*Bolton           1558  10         
*Bootle           1807  15         
 Bournemouth      1299  78         
*Bradford         1637  10         
 Brighton         1359  84         
 Bristol          1392  73         
*Burnley          1755  12         
 Cardiff          1519  21    
 Coventry         1307  78         
 Croydon          1254  96         
*Darlington       1491  20         
*Derby            1555  39         
*Doncaster        1428  39         
 East Ham         1318  122        
 Exeter           1260  21         
*Gateshead        1723  44         
*Grimsby          1379  94         
*Halifax          1742  8          
*Huddersfield     1574  9          
*Hull             1569  91         
 Ipswich          1096  138        
*Leeds            1591  16         
 Leicester        1402  37         
*Liverpool        1772  15         
*Manchester       1828  8          
*Middlesbrough    1704  26         
*Newcastle        1702  44              
 Newport          1581  14    
 Northampton      1309  59    
 Norwich          1259  133   
*Nottingham       1427  27    
*Oldham           1724  6     
 Oxford           1175  107   
 Plymouth         1486  5     
 Portsmouth       1456  90    
*Preston          1696  6     
 Reading          1236  101   
*Rochdale         1711  13    
*Rotherham        1444  14    
*St Helens        1591  49    
*Salford          1987  8     
*Sheffield        1495  14    
 Southampton      1369  68    
 Southend         1257  50    
*Southport        1587  75    
*South Shields    1713  71    
*Stockport        1557  13    
*Stoke            1640  57  
*Sunderland       1709  71    
 Swansea          1625  13    
*Wallasey         1625  20    
 Walsall          1527  60    
 West Bromwich    1627  53    
 West Ham         1486  122
 Wolverhampton    1485  81    
*York             1378  71    
;
